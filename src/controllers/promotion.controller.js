import prisma from '../config/prismaClient.js'
import { uploadSingleImage, deleteImage } from '../services/upload.service.js';

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

        const image = await uploadSingleImage(file);
        const promotionThumbnailId = image.uploadImageId;

        const promotion = await prisma.promotion.create({
            data: {
                promotionName,
                description,
                discountType,
                discountValue: parseFloat(discountValue),
                startDate: new Date(startDate),
                endDate: new Date(endDate),
                promotionThumbnailId
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
            where: { promotionId: parseInt(id) }
        });

        if (!existingPromotion) {
            return res.status(404).json({ message: "Promotion not found!" });
        }

        console.log('endDate', endDate);

        let promotionThumbnailId = null;
        if (file) {
            const image = await uploadSingleImage(file);
            promotionThumbnailId = image.uploadImageId;
        }

        const promotion = await prisma.promotion.update({
            where: { promotionId: parseInt(id) },
            data: {
                promotionName: promotionName || existingPromotion.promotionName,
                description: description || existingPromotion.description,
                discountType: discountType || existingPromotion.discountType,
                discountValue: parseFloat(discountValue) || existingPromotion.discountValue,
                startDate: startDate ? new Date(startDate) : existingPromotion.startDate,
                endDate: endDate ? new Date(endDate) : existingPromotion.endDate,
                promotionThumbnailId: promotionThumbnailId || existingPromotion.promotionThumbnailId
            },
            include
        });

        if (promotionThumbnailId && existingPromotion.promotionThumbnailId) {
            await deleteImage(existingPromotion.promotionThumbnailId);
        }

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