import prisma from '../config/prismaClient.js'
import { uploadFile, deleteFile } from '../utils/supabaseStorage.js';

const include = {
    promotionThumbnail: {
        select: {
            url: true
        }
    }
}

export const getAllPromotions = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '', discountType } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.promotionName = {
                contains: keyword,
                mode: 'insensitive'
            }
        }

        if (discountType) {
            filters.discountType = discountType;
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        } else {
            sortOrder.updatedAt = 'desc';
        }

        const [promotions, totalPromotions] = await Promise.all([
            prisma.promotion.findMany({
                skip,
                take,
                where: filters,
                orderBy: sortOrder,
                include,
            }),
            prisma.promotion.count({ where: filters })
        ]);

        return res.status(200).json({
            message: 'All promotions fetched!',
            data: promotions,
            pagination: {
                total: totalPromotions,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalPromotions / take),
            }
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
};

export const getPromotionById = async (req, res) => {
    try {
        const { id } = req.params;

        const promotion = await prisma.promotion.findUnique({
            where: { promotionId: parseInt(id) },
            include
        });

        if (!promotion) {
            return res.status(404).json({ message: "Promotion not found!" });
        }

        return res.status(200).json({
            message: 'Promotion fetched!',
            data: promotion,
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

export const createPromotion = async (req, res) => {
    try {
        const { promotionName, description, discountType, discountValue, startDate, endDate } = req.body;

        const file = req.file;

        if (!promotionName || !description || !discountType || !discountValue || !startDate || !endDate || !file) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const image = await uploadFile(file);
        const promotion = await prisma.promotion.create({
            data: {
                promotionName,
                description,
                discountType,
                discountValue: parseFloat(discountValue),
                startDate: new Date(startDate),
                endDate: new Date(endDate),
                promotionThumbnail: {
                    create: {
                        url: image.url,
                        filePath: image.filePath
                    }
                }
            },
            include
        });

        return res.status(201).json({
            message: 'Promotion created!',
            data: promotion,
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

export const updatePromotion = async (req, res) => {
    try {
        const { id } = req.params;

        const { promotionName, description, discountType, discountValue, startDate, endDate } = req.body;

        const file = req.file;

        const existingPromotion = await prisma.promotion.findUnique({
            where: { promotionId: parseInt(id) },
            include: {
                promotionThumbnail: {
                    select: {
                        filePath: true
                    }
                }
            }
        });

        if (!existingPromotion) {
            return res.status(404).json({ message: "Promotion not found!" });
        }

        const fields = {
            promotionName,
            description,
            discountType,
            discountValue: discountValue ? parseFloat(discountValue) : null,
            startDate: startDate ? new Date(startDate) : null,
            endDate: endDate ? new Date(endDate) : null,
        };

        const data = Object.entries(fields).reduce((acc, [key, value]) => {
            if (value != null && value !== existingPromotion[key]) {
                acc[key] = value;
            }
            return acc;
        }, {});

        if (file) {
            const { url, filePath } = await uploadFile(file);
            data.promotionThumbnail = {
                update: {
                    url,
                    filePath
                }
            }
        }

        const promotion = await prisma.promotion.update({
            where: { promotionId: parseInt(id) },
            data,
            include
        });

        return res.status(200).json({
            message: 'Promotion updated!',
            data: promotion,
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

export const deletePromotion = async (req, res) => {
    try {
        const { id } = req.params;

        const promotion = await prisma.promotion.findUnique({
            where: { promotionId: parseInt(id) }
        });

        if (!promotion) {
            return res.status(404).json({ message: "Promotion not found!" });
        }

        await prisma.promotion.delete({
            where: { promotionId: parseInt(id) }
        });

        return res.status(200).json({
            message: 'Promotion deleted!',
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