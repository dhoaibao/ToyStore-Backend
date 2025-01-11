import prisma from '../config/prismaClient.js'
import { generateSlug } from '../utils/generateSlug.js';
import { uploadMultipleImages } from '../services/upload.service.js';
import { generateImageEmbedding } from '../utils/generateEmbeddings.js';

const addEmbedding = async (productId, uploadImageId, embedding) => {
    const embeddingString = `[${embedding.join(',')}]`;
    await prisma.$executeRaw`
      INSERT INTO product_image_embeddings (product_id, upload_image_id, embedding)
      VALUES (${productId}, ${uploadImageId}, ${embeddingString}::vector)
    `;
};

const include = {
    category: {
        select: {
            categoryName: true,
            slug: true
        }
    },
    brand: {
        select: {
            brandName: true
        }
    },
    productInfoValues: {
        select: {
            value: true,
            productInfo: {
                select: {
                    productInfoName: true
                }
            }
        }
    },
    productImages: {
        select: {
            uploadImage: {
                select: {
                    url: true
                }
            }
        }
    }
};

export const getAllProducts = async (req, res) => {
    try {
        const { page = 1, limit = 10, brandNames, categoryNames, ageOption, priceOption, sort, sortPrice, keyword } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.productName = {
                contains: keyword,
                mode: 'insensitive'
            };
        }

        if (brandNames) {
            filters.brand = {
                brandName: {
                    in: brandNames.split(',').map(name => name.trim()),
                    mode: 'insensitive'
                }
            };
        }

        if (categoryNames) {
            filters.category = {
                categoryName: {
                    in: categoryNames.split(',').map(name => name.trim()),
                    mode: 'insensitive'
                }
            };
        }

        if (ageOption) {
            const [minAge, maxAge] = ageOption.includes('-')
                ? ageOption.split('-').map(age => age)
                : [ageOption, '100'];
            filters.productInfoValues = {
                some: {
                    AND: [
                        {
                            value: {
                                gte: minAge,
                                lte: maxAge
                            }
                        },
                        {
                            productInfo: {
                                productInfoName: {
                                    equals: 'Tuổi',
                                    mode: 'insensitive'
                                }
                            }
                        }
                    ]
                }
            };
        }

        if (priceOption) {
            const [minPrice, maxPrice] = priceOption.includes('-')
                ? priceOption.split('-').map(price => parseFloat(price))
                : [parseFloat(priceOption), 100000000000];

            filters.price = {
                gte: minPrice,
                lte: maxPrice
            };
        }

        const products = await prisma.product.findMany({
            skip,
            take,
            where: filters,
            include,
        });

        if (sort) {
            if (sort === 'newest') {
                products.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
            } else if (sort === 'bestseller') {
                products.sort((a, b) => b.soldNumber - a.soldNumber);
            }
        }

        if (sortPrice) {
            if (sortPrice === 'asc') {
                products.sort((a, b) => a.price - b.price);
            } else if (sortPrice === 'desc') {
                products.sort((a, b) => b.price - a.price);
            }
        }

        const totalProducts = products.length;

        return res.status(200).json({
            message: 'All products fetched!',
            data: products,
            pagination: {
                total: totalProducts,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalProducts / take),
            }
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const getProductBySlug = async (req, res) => {
    try {
        const { slug } = req.params;

        const product = await prisma.product.findUnique({
            where: { slug },
            include,
        });

        if (!product) {
            return res.status(404).json({ message: "Product not found!" });
        }

        return res.status(200).json({
            message: 'Product fetched!',
            data: product,
        });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const createProduct = async (req, res) => {
    try {
        const filePaths = req.files.map(file => file.path);

        const { productName, price, visible, quantity, description, brandId, categoryId, productInfos } = req.body;

        if (!productName || !price || !visible || !quantity || !description) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const productExists = await prisma.product.findFirst({
            where: { productName }
        });

        if (productExists) {
            return res.status(400).json({ message: 'Product already exists!' });
        }

        const slug = generateSlug(productName);

        const product = await prisma.product.create({
            data: {
                productName,
                slug,
                price: parseFloat(price),
                visible: visible === 'true',
                quantity: parseInt(quantity),
                description,
                brand: {
                    connect: { brandId: parseInt(brandId) },
                },
                category: {
                    connect: { categoryId: parseInt(categoryId) },
                },
            },
            include,
        });

        if (productInfos) {
            const productInfosArray = JSON.parse(productInfos);

            await prisma.productInfoValue.createMany({
                data: productInfosArray.map(info => ({
                    productId: product.productId,
                    productInfoId: info.productInfoId,
                    value: info.value
                }))
            });
        }

        const imageDatas = await uploadMultipleImages(filePaths);

        const uploadImageIds = imageDatas.map(imageData => imageData.image.uploadImageId);

        await prisma.productImage.createMany({
            data: uploadImageIds.map(imageId => ({
                productId: product.productId,
                uploadImageId: imageId,
            }))
        });

        await Promise.all(imageDatas.map(async ({ image, embeddings }) => {
            await addEmbedding(product.productId, image.uploadImageId, embeddings);
        }));

        return res.status(201).json({
            message: 'Product created!',
            data: product,
        });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const updateProduct = async (req, res) => {
    try {
        const { id } = req.params;

        const { productName, productDesc } = req.body;

        const product = await prisma.product.findUnique({ where: { productId: parseInt(id) } });

        if (!product) {
            return res.status(404).json({ message: 'Product not found!' });
        }

        const updatedProduct = await prisma.product.update({
            where: { productId: parseInt(id) },
            data: {
                productName: productName || product.productName,
                productDesc: productDesc || product.productDesc,
            },
            include,
        });

        return res.status(200).json({
            message: 'Product updated!',
            data: updatedProduct,
        });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const deleteProduct = async (req, res) => {
    try {
        const { id } = req.params;

        const productExists = await prisma.product.findUnique({ where: { productId: parseInt(id) } });

        if (!productExists) {
            return res.status(404).json({ message: 'Product not found!' });
        }

        await prisma.product.delete({ where: { productId: parseInt(id) } });

        return res.status(200).json({ message: 'Product deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const imageSearch = async (req, res) => {
    try {
        const { file, url } = req;

        if (!file && !url) {
            return res.status(400).json({ message: 'No image uploaded!' });
        }

        let imageEmbedding;
        if (file) {
            imageEmbedding = await generateImageEmbedding(file.path);
        } else {
            imageEmbedding = await generateImageEmbedding(url);
        }

        const imageEmbeddingString = `[${imageEmbedding.join(',')}]`;

        const productImageEmbeddings = await prisma.$queryRaw`
            SELECT product_id, embedding::text, 
                   1 - (embedding <=> ${imageEmbeddingString}::vector) AS cosine_similarity
            FROM product_image_embeddings
            WHERE 1 - (embedding <=> ${imageEmbeddingString}::vector) > 0.6
            ORDER BY cosine_similarity DESC
            LIMIT 1;
        `;
        console.log(productImageEmbeddings);

        const products = productImageEmbeddings.map(embedding => embedding.product_id);

        const productsData = await prisma.product.findMany({
            where: {
                productId: {
                    in: products
                }
            },
            include,
        });

        return res.status(200).json({
            message: 'Image search results fetched!',
            data: productsData,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}