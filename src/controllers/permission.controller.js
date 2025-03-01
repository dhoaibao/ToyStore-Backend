import prisma from '../config/prismaClient.js'

export const getAllPermissions = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '' } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.permissionName = {
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

        const permissions = await prisma.permission.findMany({
            where: filters,
            skip,
            take,
            orderBy: sortOrder
        });

        const totalPermissions = await prisma.permission.count({ where: filters });

        return res.status(200).json({
            message: 'All Permissions fetched!',
            data: permissions,
            pagination: {
                total: totalPermissions,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalPermissions / take),
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

export const getPermissionById = async (req, res) => {
    try {
        const { id } = req.params;

        const permission = await prisma.permission.findUnique({
            where: { permissionId: parseInt(id) },
        });

        return res.status(200).json({
            message: 'Permission fetched!',
            data: permission,
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

export const createPermission = async (req, res) => {
    try {
        const { permissionName, apiPath, method, module } = req.body;

        if (!permissionName || !apiPath || !method || !module) {
            return res.status(400).json({
                message: 'Missing required fields!'
            });
        }

        const existingPermission = await prisma.permission.findFirst({
            where: { permissionName }
        });

        if (existingPermission) {
            return res.status(400).json({
                message: 'Permission already exists!'
            });
        }

        const permission = await prisma.permission.create({
            data: {
                permissionName,
                apiPath,
                method,
                module
            },
        });

        return res.status(201).json({
            message: 'Permission created!',
            data: permission,
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

export const updatePermission = async (req, res) => {
    try {
        const { id } = req.params;

        const { permissionName, apiPath, method, module } = req.body;

        const existingPermission = await prisma.permission.findUnique({ where: { permissionId: parseInt(id) } });

        if (!existingPermission) {
            return res.status(404).json({ message: 'Permission not found!' });
        }

        if (permissionName && permissionName !== existingPermission.permissionName) {
            const existingPermissionName = await prisma.permission.findFirst({
                where: { permissionName }
            });

            if (existingPermissionName) {
                return res.status(400).json({ message: 'Permission already exists!' });
            }
        }

        const fields = {
            permissionName,
            apiPath,
            method,
            module
        };

        const data = Object.entries(fields).reduce((acc, [key, value]) => {
            if (value != null && value !== existingPermission[key]) {
                acc[key] = value;
            }
            return acc;
        }, {});

        const updatedPermission = await prisma.permission.update({
            where: { permissionId: parseInt(id) },
            data,
        });

        return res.status(200).json({
            message: 'Permission updated!',
            data: updatedPermission,
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