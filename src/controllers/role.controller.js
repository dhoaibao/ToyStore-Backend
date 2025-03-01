import prisma from '../config/prismaClient.js'

const include = {
    permissions: true,
};

export const getAllRoles = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '' } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.roleName = {
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

        const roles = await prisma.role.findMany({
            where: filters,
            skip,
            take,
            include,
            orderBy: sortOrder
        });

        const totalRoles = await prisma.role.count({ where: filters });

        return res.status(200).json({
            message: 'All Roles fetched!',
            data: roles,
            pagination: {
                total: totalRoles,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalRoles / take),
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

export const getRoleById = async (req, res) => {
    try {
        const { id } = req.params;

        const role = await prisma.role.findUnique({
            where: { roleId: parseInt(id) },
            include
        });

        return res.status(200).json({
            message: 'Role fetched!',
            data: role,
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

export const createRole = async (req, res) => {
    try {
        const { roleName, roleDesc, isActive = 'true' } = req.body;

        if (!roleName || !roleDesc || !isActive) {
            return res.status(400).json({
                message: 'Missing required fields!'
            });
        }

        const existingRole = await prisma.role.findFirst({
            where: { roleName }
        });

        if (existingRole) {
            return res.status(400).json({
                message: 'Role already exists!'
            });
        }

        const role = await prisma.role.create({
            data: {
                roleName,
                roleDesc,
                isActive: isActive === 'true'
            },
            include
        });

        return res.status(201).json({
            message: 'Role created!',
            data: role,
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

export const updateRole = async (req, res) => {
    try {
        const { id } = req.params;

        const { roleName, roleDesc, isActive } = req.body;

        const existingRole = await prisma.role.findUnique({ where: { roleId: parseInt(id) } });

        if (!existingRole) {
            return res.status(404).json({ message: 'Role not found!' });
        }

        if (roleName && roleName !== existingRole.roleName) {
            const existingRoleName = await prisma.role.findFirst({
                where: { roleName }
            });

            if (existingRoleName) {
                return res.status(400).json({ message: 'Role already exists!' });
            }
        }

        const fields = {
            roleName,
            roleDesc,
            isActive: isActive ? isActive === 'true' : null
        };

        const data = Object.entries(fields).reduce((acc, [key, value]) => {
            if (value != null && value !== existingRole[key]) {
                acc[key] = value;
            }
            return acc;
        }, {});

        const updatedRole = await prisma.role.update({
            where: { roleId: parseInt(id) },
            data,
            include
        });

        return res.status(200).json({
            message: 'Role updated!',
            data: updatedRole,
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

export const addRolePermission = async (req, res) => {
    try {
        const { id } = req.params;
        const { permissionIdArray } = req.body;

        const existingRole = await prisma.role.findUnique({ where: { roleId: parseInt(id) }, include });

        if (!existingRole) {
            return res.status(404).json({ message: 'Role not found!' });
        }

        const permissions = await prisma.permission.findMany({
            where: { permissionId: { in: permissionIdArray.map(id => parseInt(id)) } },
            select: { permissionId: true },
        });

        if (permissions.length !== permissionIdArray.length) {
            return res.status(404).json({ message: 'One or more permissions not found!' });
        }

        const existingPermissionIds = existingRole.permissions.map(p => p.permissionId);
        const newPermissionIds = permissionIdArray
            .map(id => parseInt(id))
            .filter(id => !existingPermissionIds.includes(id));

        if (newPermissionIds.length === 0) {
            return res.status(200).json({ message: 'All permissions already assigned to role!' });
        }

        const updatedRole = await prisma.role.update({
            where: { roleId: parseInt(id) },
            data: {
                permissions: {
                    connect: newPermissionIds.map(permissionId => ({ permissionId })),
                },
            },
            include: { permissions: true },
        });

        return res.status(201).json({
            message: 'Role Permissions added!',
            data: updatedRole,
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