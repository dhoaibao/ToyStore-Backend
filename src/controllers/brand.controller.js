import prisma from '../config/prismaClient.js'

export const getAllBrands = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '' } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.brandName = {
                contains: keyword,
                mode: 'insensitive'
            }
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        }

        const brands = await prisma.brand.findMany({
            where: filters,
            skip,
            take,
            orderBy: sortOrder
        });

        const totalBrands = await prisma.brand.count({ where: filters });

        return res.status(200).json({
            message: 'All brands fetched!',
            data: brands,
            pagination: {
                total: totalBrands,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalBrands / take),
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

export const getBrandById = async (req, res) => {
    try {
        const { id } = req.params;

        const brand = await prisma.brand.findUnique({
            where: { brandId: parseInt(id) }
        });

        if (!brand) {
            return res.status(404).json({ message: "Brand not found!" });
        }

        return res.status(200).json({
            message: 'Brand fetched!',
            data: brand,
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

export const createBrand = async (req, res) => {
    try {
        const { brandName, brandDesc } = req.body;

        if (!brandName || !brandDesc) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const brandExists = await prisma.brand.findFirst({
            where: { brandName }
        });

        if (brandExists) {
            return res.status(400).json({ message: 'Brand already exists!' });
        }

        const brand = await prisma.brand.create({
            data: {
                brandName,
                brandDesc,
            }
        });

        return res.status(201).json({
            message: 'Brand created!',
            data: brand,
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

export const updateBrand = async (req, res) => {
    try {
        const { id } = req.params;

        const { brandName, brandDesc } = req.body;

        const brand = await prisma.brand.findUnique({ where: { brandId: parseInt(id) } });

        if (!brand) {
            return res.status(404).json({ message: 'Brand not found!' });
        }

        const updatedBrand = await prisma.brand.update({
            where: { brandId: parseInt(id) },
            data: {
                brandName: brandName || brand.brandName,
                brandDesc: brandDesc || brand.brandDesc,
            }
        });

        return res.status(200).json({
            message: 'Brand updated!',
            data: updatedBrand,
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

export const deleteBrand = async (req, res) => {
    try {
        const { id } = req.params;

        const brandExists = await prisma.brand.findUnique({ where: { brandId: parseInt(id) } });

        if (!brandExists) {
            return res.status(404).json({ message: 'Brand not found!' });
        }

        await prisma.brand.delete({ where: { brandId: parseInt(id) } });

        return res.status(200).json({ message: 'Brand deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}