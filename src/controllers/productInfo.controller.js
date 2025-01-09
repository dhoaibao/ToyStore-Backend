import prisma from '../config/prismaClient.js'

export const getAllProductInformations = async (_, res) => {
    try {
        const productInformations = await prisma.productInformation.findMany({});

        return res.status(200).json({
            message: 'All product informations fetched!',
            data: productInformations,
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

export const getProductInformationById = async (req, res) => {
    try {
        const { id } = req.params;

        const productInformation = await prisma.productInformation.findUnique({
            where: { productInfoId: parseInt(id) }
        });

        if (!productInformation) {
            return res.status(404).json({ message: "Product information not found!" });
        }

        return res.status(200).json({
            message: 'Product information fetched!',
            data: productInformation,
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

export const createProductInformation = async (req, res) => {
    try {
        const { productInfoName } = req.body;

        if (!productInfoName) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const productInformationExists = await prisma.productInformation.findFirst({
            where: { productInfoName }
        });

        if (productInformationExists) {
            return res.status(400).json({ message: 'Product information already exists!' });
        }

        const productInformation = await prisma.productInformation.create({
            data: { productInfoName }
        });

        return res.status(201).json({
            message: 'Product information created!',
            data: productInformation,
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

export const updateProductInformation = async (req, res) => {
    try {
        const { id } = req.params;

        const { productInfoName } = req.body;

        const productInformation = await prisma.productInformation.findUnique({ where: { productInfoId: parseInt(id) } });

        if (!productInformation) {
            return res.status(404).json({ message: 'Product information not found!' });
        }

        const updatedProductInformation = await prisma.productInformation.update({
            where: { productInfoId: parseInt(id) },
            data: { productInfoName }
        });

        return res.status(200).json({
            message: 'ProductInformation updated!',
            data: updatedProductInformation,
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

export const deleteProductInformation = async (req, res) => {
    try {
        const { id } = req.params;

        const productInformationExists = await prisma.productInformation.findUnique({ where: { productInfoId: parseInt(id) } });

        if (!productInformationExists) {
            return res.status(404).json({ message: 'Product information not found!' });
        }

        await prisma.productInformation.delete({ where: { productInfoId: parseInt(id) } });

        return res.status(200).json({ message: 'Product information deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}