import prisma from '../config/prismaClient.js'

export const getAllProductInfomations = async (_, res) => {
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

        const productinformation = await prisma.productInformation.findUnique({
            where: { productInforId: parseInt(id) }
        });

        if (!productinformation) {
            return res.status(404).json({ message: "ProductInformation not found!" });
        }

        return res.status(200).json({
            message: 'ProductInformation fetched!',
            data: productinformation,
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
        const { productInforName, productInforValue } = req.body;

        if (!productInforName || !productInforValue) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const productInformationExists = await prisma.productInformation.findFirst({
            where: { productinformationName }
        });

        if (productinformationExists) {
            return res.status(400).json({ message: 'ProductInformation already exists!' });
        }
        
        const slug = generateSlug(productinformationName);

        const productinformation = await prisma.productinformation.create({
            data: {
                productinformationName,
                slug,
            }
        });

        return res.status(201).json({
            message: 'ProductInformation created!',
            data: productinformation,
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

        const { productinformationName } = req.body;

        const productinformation = await prisma.productinformation.findUnique({ where: { productinformationId: parseInt(id) } });

        if (!productinformation) {
            return res.status(404).json({ message: 'ProductInformation not found!' });
        }

        const slug = generateSlug(productinformationName);

        const updatedProductInformation = await prisma.productinformation.update({
            where: { productinformationId: parseInt(id) },
            data: {
                productinformationName: productinformationName,
                slug: slug,
            }
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

        const productinformationExists = await prisma.productinformation.findUnique({ where: { productinformationId: parseInt(id) } });

        if (!productinformationExists) {
            return res.status(404).json({ message: 'ProductInformation not found!' });
        }

        await prisma.productinformation.delete({ where: { productinformationId: parseInt(id) } });

        return res.status(200).json({ message: 'ProductInformation deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}