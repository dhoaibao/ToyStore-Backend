import prisma from '../config/prismaClient.js'
import { generateSlug } from '../utils/generateSlug.js';
import { uploadMultipleImages } from '../services/upload.service.js';

const addEmbedding = async (productId, uploadImageId, embedding) => {
    const embeddingString = `[${embedding.join(',')}]`;
    await prisma.$executeRaw`
      INSERT INTO product_image_embeddings (product_id, upload_image_id, embedding)
      VALUES (${productId}, ${uploadImageId}, ${embeddingString}::vector)
    `;
};

export const getAllProducts = async (req, res) => {
    try {
        const { page = 1, limit = 10 } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const products = await prisma.product.findMany({
            skip,
            take,
            include: {
                brand: true,
                productImages: {
                    select: {
                        uploadImage: {
                            select: {
                                url: true
                            }
                        }
                    }
                }
            }
        });

        const totalProducts = await prisma.product.count();

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
            include: {
                brand: true,
                productImages: {
                    select: {
                        uploadImage: {
                            select: {
                                url: true
                            }
                        }
                    }
                }
            }
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

        const { productName, price, visible, quantity, description, brandId } = req.body;

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
                brandId: parseInt(brandId) || null,
            }
        });

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
            }
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