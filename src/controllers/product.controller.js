import prisma from '../config/prismaClient.js'
import { generateSlug } from '../utils/generateSlug.js';
import { uploadMultipleImages } from '../services/upload.service.js';
import { generateImageEmbedding, generateTextEmbedding } from '../utils/generateEmbeddings.js';
import { fileURLToPath } from 'url';
import path from 'path';
import fs from 'fs/promises';

const addImageEmbedding = async (productId, uploadImageId, embedding) => {
    const embeddingString = `[${embedding.join(',')}]`;
    await prisma.$executeRaw`
      INSERT INTO product_image_embeddings (product_id, upload_image_id, embedding)
      VALUES (${productId}, ${uploadImageId}, ${embeddingString}::vector)
    `;
};

const addEmbedding = async (productId, embedding) => {
    const embeddingString = `[${embedding.join(',')}]`;
    await prisma.$executeRaw`
      INSERT INTO product_embeddings (product_id, embedding)
      VALUES (${productId}, ${embeddingString}::vector)
    `;
}

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
    },
    promotions: {
        include: {
            promotionThumbnail: {
                select: {
                    url: true
                }
            }
        }
    },
};

export const getAllProducts = async (req, res) => {
    try {
        const { page = 1, limit = 10, brandNames, categoryNames, ageOption, priceOption, sort, order, sortPrice, keyword, promotion } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (promotion) {
            filters.promotions = {
                some: {
                    promotionId: parseInt(promotion)
                }
            };
        }

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

        if (sort && order) {
            sortOrder[sort] = order;
        }

        const products = await prisma.product.findMany({
            skip,
            take,
            where: filters,
            include,
        });

        // if (sort) {
        //     if (sort === 'newest') {
        //         products.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
        //     } else if (sort === 'bestseller') {
        //         products.sort((a, b) => b.soldNumber - a.soldNumber);
        //     }
        // }

        if (sortPrice) {
            if (sortPrice === 'asc') {
                products.sort((a, b) => a.price - b.price);
            } else if (sortPrice === 'desc') {
                products.sort((a, b) => b.price - a.price);
            }
        }

        const totalProducts = await prisma.product.count({
            where: filters,
        });

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
        const files = req.files;

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

        const images = await uploadMultipleImages(files);

        await prisma.productImage.createMany({
            data: images.map(image => ({
                productId: product.productId,
                uploadImageId: image.uploadImageId,
            }))
        });

        await Promise.all(images.map(async ({ url, uploadImageId }) => {
            const imageEmbedding = await generateImageEmbedding(url);
            await addImageEmbedding(product.productId, uploadImageId, imageEmbedding);
        }));

        const allProductInfo = product.productName + ' ' + product.description + ' ' + product.brand.brandName + ' ' + product.category.categoryName + ' ' + product.productInfoValues.map(info => info.value).join(' ');

        const textEmbedding = await generateTextEmbedding(allProductInfo);

        await addEmbedding(product.productId, textEmbedding);

        const productEmbedding = await prisma.productEmbedding.findFirst({
            where: {
                productId: product.productId
            }
        });

        const productUpdated = await prisma.product.update({
            where: { productId: product.productId },
            data: {
                productEmbeddingId: productEmbedding.productEmbeddingId
            },
            include,
        });

        return res.status(201).json({
            message: 'Product created!',
            data: productUpdated,
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
        const { file } = req;

        const { url } = req.body;

        if (!file && !url) {
            return res.status(400).json({ message: 'No image uploaded!' });
        }

        let imageEmbedding;
        if (file) {
            const __filename = fileURLToPath(import.meta.url);
            const __dirname = path.dirname(__filename);

            const tempFilePath = path.join(__dirname, '..', '..', file.originalname);
            await fs.writeFile(tempFilePath, file.buffer);

            imageEmbedding = await generateImageEmbedding(tempFilePath);

            await fs.unlink(tempFilePath);
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
            LIMIT 10;
        `;

        const productIds = productImageEmbeddings.map(embedding => embedding.product_id);
        const uniqueProductIds = [...new Set(productIds)];

        const productsData = await prisma.product.findMany({
            where: {
                productId: {
                    in: uniqueProductIds
                }
            },
            include,
        });

        const sortedProductsData = uniqueProductIds.map(id => productsData.find(product => product.productId === id));

        return res.status(200).json({
            message: 'Image search results fetched!',
            data: sortedProductsData,
            pagination: {
                total: productsData.length,
                totalPages: 1,
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