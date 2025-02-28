import prisma from '../config/prismaClient.js'
import { generateSlug } from '../utils/generateSlug.js';
import { uploadFile, deleteFile } from '../utils/supabaseStorage.js';

const include = {
    categoryThumbnail: {
        select: {
            url: true
        }
    }
}

export const getAllCategories = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '' } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.categoryName = {
                contains: keyword,
                mode: 'insensitive'
            }
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        } else {
            sortOrder.updatedAt = 'desc';
        }

        const categories = await prisma.category.findMany({
            where: filters,
            include,
            skip,
            take,
            orderBy: sortOrder
        });

        const totalCategories = await prisma.category.count({ where: filters });

        return res.status(200).json({
            message: 'All categories fetched!',
            data: categories,
            pagination: {
                total: totalCategories,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalCategories / take),
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

        const { url, filePath } = await uploadFile(file);

        const slug = generateSlug(categoryName);

        const category = await prisma.category.create({
            data: {
                categoryName,
                slug,
                categoryThumbnail: {
                    create: {
                        url,
                        filePath
                    }
                }
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

        const existingCategory = await prisma.category.findUnique({
            where: { categoryId: parseInt(id) },
            include: {
                categoryThumbnail: {
                    select: {
                        filePath: true
                    }
                }
            }
        });

        if (!existingCategory) {
            return res.status(404).json({ message: 'Category not found!' });
        }

        const slug = generateSlug(categoryName);

        const { url, filePath } = await uploadFile(file);

        await deleteFile(existingCategory.categoryThumbnail.filePath);

        const updatedCategory = await prisma.category.update({
            where: { categoryId: parseInt(id) },
            data: {
                categoryName: categoryName || existingCategory.categoryName,
                slug: slug,
                categoryThumbnail: {
                    update: {
                        url,
                        filePath
                    }
                }
            },
            include
        });

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

        const categoryExists = await prisma.category.findUnique({
            where: { categoryId: parseInt(id) }, include: {
                categoryThumbnail: {
                    select: {
                        filePath: true
                    }
                }
            }
        });

        if (!categoryExists) {
            return res.status(404).json({ message: 'Category not found!' });
        }

        await prisma.category.delete({ where: { categoryId: parseInt(id) } });

        await deleteFile(categoryExists.categoryThumbnail.filePath);

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