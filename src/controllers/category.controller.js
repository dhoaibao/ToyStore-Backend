import prisma from '../config/prismaClient.js'
import { generateSlug } from '../utils/generateSlug.js';
import { uploadSingleImage, deleteImage } from '../services/upload.service.js';

const include = {
    categoryThumbnail: {
        select: {
            url: true
        }
    }
}

export const getAllCategories = async (_, res) => {
    try {
        const categories = await prisma.category.findMany({ include });

        return res.status(200).json({
            message: 'All categories fetched!',
            data: categories,
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

export const getCategoryById = async (req, res) => {
    try {
        const { id } = req.params;

        const category = await prisma.category.findUnique({
            where: { categoryId: parseInt(id) },
            include
        });

        if (!category) {
            return res.status(404).json({ message: "Category not found!" });
        }

        return res.status(200).json({
            message: 'Category fetched!',
            data: category,
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

export const createCategory = async (req, res) => {
    try {
        const { categoryName } = req.body;

        const file = req.file;

        if (!categoryName || !file) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const categoryExists = await prisma.category.findFirst({
            where: { categoryName }
        });

        if (categoryExists) {
            return res.status(400).json({ message: 'Category already exists!' });
        }

        const image = await uploadSingleImage(file);
        const categoryThumbnailId = image.uploadImageId;

        const slug = generateSlug(categoryName);

        const category = await prisma.category.create({
            data: {
                categoryName,
                categoryThumbnailId,
                slug,
            },
            include
        });

        return res.status(201).json({
            message: 'Category created!',
            data: category,
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

export const updateCategory = async (req, res) => {
    try {
        const { id } = req.params;

        const { categoryName } = req.body;

        const file = req.file;

        const existingCategory = await prisma.category.findUnique({ where: { categoryId: parseInt(id) } });

        if (!existingCategory) {
            return res.status(404).json({ message: 'Category not found!' });
        }

        const slug = generateSlug(categoryName);

        let categoryThumbnailId = null;
        if (file) {
            const image = await uploadSingleImage(file);
            categoryThumbnailId = image.uploadImageId;
        }

        const updatedCategory = await prisma.category.update({
            where: { categoryId: parseInt(id) },
            data: {
                categoryName: categoryName || existingCategory.categoryName,
                categoryThumbnailId: categoryThumbnailId || existingCategory.categoryThumbnailId,
                slug: slug,
            },
            include
        });

        if (categoryThumbnailId && existingCategory.categoryThumbnailId) {
            await deleteImage(existingCategory.categoryThumbnailId);
        }

        return res.status(200).json({
            message: 'Category updated!',
            data: updatedCategory,
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

export const deleteCategory = async (req, res) => {
    try {
        const { id } = req.params;

        const categoryExists = await prisma.category.findUnique({ where: { categoryId: parseInt(id) } });

        if (!categoryExists) {
            return res.status(404).json({ message: 'Category not found!' });
        }

        await prisma.category.delete({ where: { categoryId: parseInt(id) } });

        return res.status(200).json({ message: 'Category deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}