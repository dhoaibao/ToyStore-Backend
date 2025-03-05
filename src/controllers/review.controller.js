import prisma from '../config/prismaClient.js'
import { uploadMultipleFiles } from '../utils/supabaseStorage.js';

const include = {
    uploadImages: {
        select: {
            url: true,
        }
    },
    user: {
        select: {
            fullName: true,
            email: true,
            avatar: true
        }
    },
    product: {
        select: {
            productName: true,
            productImages: true
        }
    },
    childrenReviews: {
        select: {
            comment: true,
            createdAt: true,
            user: {
                select: {
                    fullName: true,
                    email: true,
                    avatar: true
                }
            },
            uploadImages: {
                select: {
                    url: true,
                }
            },
        }
    },
}

export const getAllReviews = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '' } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {
            parentReviewId: null
        };

        if (keyword) {
            filters.comment = {
                contains: keyword,
                mode: 'insensitive'
            }
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        } else {
            sortOrder.createdAt = 'desc';
        }

        let reviews = [];
        if (take === -1) {
            reviews = await prisma.review.findMany({
                where: filters,
                orderBy: sortOrder,
                include
            });
        } else {
            reviews = await prisma.review.findMany({
                where: filters,
                skip,
                take,
                orderBy: sortOrder,
                include
            });
        }

        const totalReviews = await prisma.review.count({ where: filters });

        return res.status(200).json({
            message: 'All reviews fetched!',
            data: reviews,
            pagination: {
                total: totalReviews,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalReviews / take),
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

export const getReviewById = async (req, res) => {
    try {
        const { id } = req.params;

        const review = await prisma.review.findUnique({
            where: { reviewId: parseInt(id) },
            include
        });

        if (!review) {
            return res.status(404).json({ message: "Review not found!" });
        }

        return res.status(200).json({
            message: 'Review fetched!',
            data: review,
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

export const createReview = async (req, res) => {
    try {
        const { comment, rating, userId, productId, orderDetailId, parentReviewId } = req.body;

        const files = req.files;

        if (!comment || !userId) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        if (orderDetailId) {
            const existingReview = await prisma.review.findFirst({
                where: {
                    userId: parseInt(userId),
                    productId: parseInt(productId),
                    orderDetailId: parseInt(orderDetailId)
                }
            });

            if (existingReview) {
                return res.status(400).json({ message: 'Review already exists!' });
            }
        }

        let data = {
            comment,
            rating: parseFloat(rating),
            userId: parseInt(userId),
            productId: productId ? parseInt(productId) : null,
            orderDetailId: orderDetailId ? parseInt(orderDetailId) : null,
            parentReviewId: parentReviewId ? parseInt(parentReviewId) : null
        }

        if (files) {
            const images = await uploadMultipleFiles(files);
            const imageObjects = images.map(image => ({
                url: image.url,
                filePath: image.filePath
            }));

            data.uploadImages = {
                create: imageObjects
            }
        }

        const review = await prisma.review.create({
            data,
            include: {
                uploadImages: true
            }
        });

        return res.status(201).json({
            message: 'Review created!',
            data: review,
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

export const deleteReview = async (req, res) => {
    try {
        const { id } = req.params;

        const reviewExists = await prisma.review.findUnique({ where: { reviewId: parseInt(id) } });

        if (!reviewExists) {
            return res.status(404).json({ message: 'Review not found!' });
        }

        await prisma.uploadImage.deleteMany({ where: { reviewId: parseInt(id) } });
        await prisma.review.delete({ where: { reviewId: parseInt(id) } });

        return res.status(200).json({ message: 'Review deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}