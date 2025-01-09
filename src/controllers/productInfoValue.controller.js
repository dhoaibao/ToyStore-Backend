import prisma from '../config/prismaClient.js'

export const getAllProductInfoValues = async (_, res) => {
    try {
        const productInfoValues = await prisma.productInfoValue.findMany({});

        return res.status(200).json({
            message: 'All product information values fetched!',
            data: productInfoValues,
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

export const getProductInfoValueById = async (req, res) => {
    try {
        const { productId, productInfoId } = req.params;

        const productInfoValue = await prisma.productInfoValue.findUnique({
            where: { productId_productInfoId: { productId: parseInt(productId), productInfoId: parseInt(productInfoId) } }
        });

        if (!productInfoValue) {
            return res.status(404).json({ message: "Product information value not found!" });
        }

        return res.status(200).json({
            message: 'Product information value fetched!',
            data: productInfoValue,
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

export const createProductInfoValue = async (req, res) => {
    try {
        const { productId, productInfoId, value } = req.body;

        if (!productId || !productInfoId || !value) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const productInfoValue = await prisma.productInfoValue.create({
            data: { productId: parseInt(productId), productInfoId: parseInt(productInfoId), value }
        });

        return res.status(201).json({
            message: 'Product information value created!',
            data: productInfoValue,
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

export const updateProductInfoValue = async (req, res) => {
    try {
        const { productId, productInfoId } = req.params;

        const { value } = req.body;

        const productInfoValue = await prisma.productInfoValue.findUnique({ where: { productId_productInfoId: { productId: parseInt(productId), productInfoId: parseInt(productInfoId) } } });

        if (!productInfoValue) {
            return res.status(404).json({ message: 'Product information value not found!' });
        }

        const updatedProductInfoValue = await prisma.productInfoValue.update({
            where: { productId_productInfoId: { productId: parseInt(productId), productInfoId: parseInt(productInfoId) } },
            data: { productId: parseInt(productId), productInfoId: parseInt(productInfoId), value }
        });

        return res.status(200).json({
            message: 'Product information value updated!',
            data: updatedProductInfoValue,
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

export const deleteProductInfoValue = async (req, res) => {
    try {
        const { productId, productInfoId } = req.params;

        const productInfoValueExists = await prisma.productInfoValue.findUnique({ where: { productId_productInfoId: { productId: parseInt(productId), productInfoId: parseInt(productInfoId) } } });

        if (!productInfoValueExists) {
            return res.status(404).json({ message: 'Product information value not found!' });
        }

        await prisma.productInfoValue.delete({ where: { productId_productInfoId: { productId: parseInt(productId), productInfoId: parseInt(productInfoId) } } });

        return res.status(200).json({ message: 'Product information value deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}