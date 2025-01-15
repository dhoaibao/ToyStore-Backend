import prisma from '../config/prismaClient.js'
import { uploadSingleImage } from '../services/upload.service.js';

const include = {
    discountThumbnail: {
        select: {
            url: true
        }
    }
}

export const getAllDiscounts = async (req, res) => {
    try {
        const { page = 1, limit = 10 } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const [discounts, totalDiscounts] = await Promise.all([
            prisma.discount.findMany({
                skip,
                take,
                include,
            }),
            prisma.discount.count()
        ]);

        return res.status(200).json({
            message: 'All discounts fetched!',
            data: discounts,
            pagination: {
                total: totalDiscounts,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalDiscounts / take),
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

export const getDiscountById = async (req, res) => {
    try {
        const { id } = req.params;

        const discount = await prisma.discount.findUnique({
            where: { discountId: parseInt(id) },
            include
        });

        if (!discount) {
            return res.status(404).json({ message: "Discount not found!" });
        }

        return res.status(200).json({
            message: 'Discount fetched!',
            data: discount,
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

export const createDiscount = async (req, res) => {
    try {
        const { discountName, description, discountType, discountValue, startDate, endDate } = req.body;

        const file = req.file;

        if (!discountName || !description || !discountType || !discountValue || !startDate || !endDate || !file) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const image = await uploadSingleImage(file);
        const discountThumbnailId = image.uploadImageId;

        const discount = await prisma.discount.create({
            data: {
                discountName,
                description,
                discountType,
                discountValue: parseFloat(discountValue),
                startDate: new Date(startDate),
                endDate: new Date(endDate),
                discountThumbnailId
            },
            include
        });

        return res.status(201).json({
            message: 'Discount created!',
            data: discount,
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

export const updateDiscount = async (req, res) => {
    try {
        const { id } = req.params;

        const { discountName, description, discountType, discountValue, startDate, endDate } = req.body;

        const file = req.file;

        const existingDiscount = await prisma.discount.findUnique({
            where: { discountId: parseInt(id) }
        });

        if (!existingDiscount) {
            return res.status(404).json({ message: "Discount not found!" });
        }

        let discountThumbnailId = existingDiscount.discountThumbnailId;
        if (file) {
            const image = await uploadSingleImage(file);
            discountThumbnailId = image.uploadImageId;
        }

        const discount = await prisma.discount.update({
            where: { discountId: parseInt(id) },
            data: {
                discountName: discountName || existingDiscount.discountName,
                description: description || existingDiscount.description,
                discountType: discountType || existingDiscount.discountType,
                discountValue: parseFloat(discountValue) || existingDiscount.discountValue,
                startDate: startDate ? new Date(startDate) : existingDiscount.startDate,
                endDate: endDate ? new Date(endDate) : existingDiscount.endDate,
                discountThumbnailId
            },
            include
        });

        return res.status(200).json({
            message: 'Discount updated!',
            data: discount,
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

export const deleteDiscount = async (req, res) => {
    try {
        const { id } = req.params;

        const discount = await prisma.discount.findUnique({
            where: { discountId: parseInt(id) }
        });

        if (!discount) {
            return res.status(404).json({ message: "Discount not found!" });
        }

        await prisma.discount.delete({
            where: { discountId: parseInt(id) }
        });

        return res.status(200).json({
            message: 'Discount deleted!',
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