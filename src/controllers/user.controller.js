import prisma from '../config/prismaClient.js'
import bcrypt from 'bcrypt';
import { uploadFile, deleteFile } from '../utils/supabaseStorage.js';

export const getLoggedInUser = async (req, res) => {
    try {
        const userId = req.userId;

        const existingUser = await prisma.user.findUnique({
            where: { userId: userId },
            include: {
                avatar: true,
                role: {
                    select: {
                        permissions: true,
                    }
                },
            }
        });

        if (!existingUser) {
            return res.status(404).json({ message: "User not found!" });
        }

        return res.status(200).json({
            message: 'User logged in!',
            data: existingUser,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const getAllUsers = async (req, res) => {
    try {
        const { page = 1, limit = 10, keyword = '', sort = '', order = '', isActive } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.fullName = {
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

        const users = await prisma.user.findMany({
            skip,
            take,
            include: {
                avatar: true,
                role: true,
            },
            where: filters,
            orderBy: sortOrder,
        });

        const totalUsers = await prisma.user.count({ where: filters });

        return res.status(200).json({
            message: 'All users fetched!',
            data: users,
            pagination: {
                total: totalUsers,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalUsers / take),
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

export const getUserById = async (req, res) => {
    try {
        const { id } = req.params;

        const user = await prisma.user.findUnique({
            where: { userId: parseInt(id) },
            include: {
                avatar: true,
            }
        });

        if (!user) {
            return res.status(404).json({ message: "User not found!" });
        }

        return res.status(200).json({
            message: 'User fetched!',
            data: user,
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

export const createUser = async (req, res) => {
    try {
        const { fullName, email, phone, gender, birthday, password, confirmPassword, isActive, roleId } = req.body;

        if (!fullName || !email || !password || !confirmPassword || !birthday || !gender || !phone) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        if (password.length < 8) {
            return res.status(400).json({
                error: 'Password must be at least 8 characters!',
            });
        }

        if (password !== confirmPassword) {
            return res.status(400).json({
                error: 'Passwords do not match!',
            });
        }

        const existingUser = await prisma.user.findUnique({ where: { email } });

        if (existingUser) {
            return res.status(400).json({
                message: 'Email already exists!',
            });
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const user = await prisma.user.create({
            data: {
                fullName,
                email,
                phone,
                roleId: parseInt(roleId),
                isActive: isActive === 'true',
                gender: Boolean(gender),
                birthday: new Date(birthday),
                password: hashedPassword,
            },
        });

        if (req.file) {
            const file = req.file;
            const { url, filePath } = await uploadFile(file);
            await prisma.user.update({
                where: { userId: user.userId },
                data: {
                    avatar: {
                        create: {
                            url,
                            filePath
                        }
                    }
                }
            })
        }

        return res.status(200).json({
            message: 'User updated!',
            data: user,
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

export const updateUser = async (req, res) => {
    try {
        const { id } = req.params;

        const { fullName, email, phone, gender, birthday, isActive, roleId } = req.body;

        const existingUser = await prisma.user.findUnique({
            where: { userId: parseInt(id) }
        });

        if (!existingUser) {
            return res.status(404).json({ message: 'User not found!' });
        }

        if (email && email !== existingUser.email) {
            const existingUserEmail = await prisma.user.findUnique({
                where: { email }
            });

            if (existingUserEmail) {
                return res.status(400).json({ message: 'Email already exists!' });
            }
        }

        const fields = {
            fullName,
            email,
            phone,
            roleId: roleId ? parseInt(roleId) : null,
            isActive: isActive ? isActive === 'true' : null,
            gender: gender ? Boolean(gender) : null,
            birthday: birthday ? new Date(birthday) : null,
        };

        const data = Object.entries(fields).reduce((acc, [key, value]) => {
            if (value != null && value !== existingUser[key]) {
                acc[key] = value;
            }
            return acc;
        }, {});

        const user = await prisma.user.update({
            where: { userId: parseInt(id) },
            data,
            include: {
                avatar: {
                    select: {
                        filePath: true,
                    },
                },
            }
        });

        let updatedUser = user;

        if (req.file) {
            if (user.avatar?.filePath) await deleteFile(user.avatar.filePath);

            const file = req.file;
            const { url, filePath } = await uploadFile(file);
            updatedUser = await prisma.user.update({
                where: { userId: user.userId },
                data: {
                    avatar: {
                        upsert: {
                            update: {
                                url,
                                filePath,
                            },
                            create: {
                                url,
                                filePath,
                            }
                        }
                    }
                },
                include: {
                    avatar: {
                        select: {
                            url: true,
                        },
                    },
                }
            })
        }

        return res.status(200).json({
            message: 'User updated!',
            data: updatedUser,
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

export const changePassword = async (req, res) => {
    try {
        const userId = req.userId;
        const { oldPassword, newPassword, confirmNewPassword } = req.body;

        if (!oldPassword || !newPassword || !confirmNewPassword) {
            return res.status(400).json({ message: 'Email, old password, new password, and confirm new password are required!' });
        }

        if (newPassword.length < 8) {
            return res.status(400).json({
                error: 'New password must be at least 8 characters!',
            });
        }

        if (newPassword !== confirmNewPassword) {
            return res.status(400).json({
                error: 'New passwords do not match!',
            });
        }

        const existingUser = await prisma.user.findUnique({ where: { userId: parseInt(userId) } });

        if (!existingUser) {
            return res.status(404).json({ message: 'User not found!' });
        }

        const isPasswordValid = await bcrypt.compare(oldPassword, existingUser.password);

        if (!isPasswordValid) {
            return res.status(401).json({ message: 'Invalid old password!' });
        }

        const hashedPassword = await bcrypt.hash(newPassword, 10);

        await prisma.user.update({
            where: { userId: parseInt(userId) },
            data: { password: hashedPassword },
        });

        return res.status(200).json({ message: 'Password changed successfully!' });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const deleteUser = async (req, res) => {
    try {
        const { id } = req.params;

        const userExists = await prisma.user.findUnique({ where: { userId: parseInt(id) } });

        if (!userExists) {
            return res.status(404).json({ message: 'User not found!' });
        }

        await prisma.user.delete({ where: { userId: parseInt(id) } });

        return res.status(200).json({ message: 'User deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}