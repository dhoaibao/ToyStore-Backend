import prisma from '../config/prismaClient.js'

export const getAllProductsInformation = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '', isActive } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.productInfoName = {
                contains: keyword,
                mode: 'insensitive'
            }
        }

        if (isActive) {
            filters.isActive = isActive === 'true';
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        } else {
            sortOrder.updatedAt = 'desc';
        }

        const productsInformation = await prisma.productInformation.findMany({
            where: filters,
            skip,
            take,
            orderBy: sortOrder,
            include: {
                productInfoDetails: true
            }
        });

        const totalProductsInfo = await prisma.productInformation.count({ where: filters });

        return res.status(200).json({
            message: 'All products information fetched!',
            data: productsInformation,
            pagination: {
                total: totalProductsInfo,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalProductsInfo / take),
            }
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
        const { productInfoName, isActive, type, options } = req.body;

        if (!productInfoName || !type) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const productInformationExists = await prisma.productInformation.findFirst({
            where: { productInfoName }
        });

        if (productInformationExists) {
            return res.status(400).json({ message: 'Product information already exists!' });
        }

        const productInformation = await prisma.productInformation.create({
            data: {
                productInfoName,
                isActive,
                type,
                options
            }
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

        const { productInfoName, isActive, type, options } = req.body;

        const productInformation = await prisma.productInformation.findUnique({ where: { productInfoId: parseInt(id) } });

        if (!productInformation) {
            return res.status(404).json({ message: 'Product information not found!' });
        }

        if (productInfoName && productInfoName !== productInformation.productInfoName) {
            const productInformationName = await prisma.productInformation.findFirst({
                where: { productInfoName }
            });

            if (productInformationName) {
                return res.status(400).json({ message: 'Product information already exists!' });
            }
        }

        const updatedProductInformation = await prisma.productInformation.update({
            where: { productInfoId: parseInt(id) },
            data: {
                productInfoName,
                isActive,
                type,
                options
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