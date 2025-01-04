import prisma from '../config/prismaClient.js'
import bcrypt from 'bcrypt';

export const getLoggedInUser = async (req, res) => {
    try {
        const userId = req.userId;

        const existingUser = await prisma.user.findUnique({
            where: { userId: userId },
            select: {
                userId: true,
                fullName: true,
                email: true,
                birthday: true,
                phone: true,
                gender: true,
                isActive: true,
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
        const { page = 1, limit = 10 } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const users = await prisma.user.findMany({
            skip,
            take,
            select: {
                userId: true,
                fullName: true,
                email: true,
                birthday: true,
                phone: true,
                gender: true,
                isActive: true,
            }
        });

        const totalUsers = await prisma.user.count();

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
        const { userId } = req.params;

        const user = await prisma.user.findUnique({
            where: { userId: parseInt(userId) },
            select: {
                userId: true,
                fullName: true,
                email: true,
                birthday: true,
                phone: true,
                gender: true,
                isActive: true,
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

export const updateUser = async (req, res) => {
    try {
        const { userId } = req.params;

        const { fullName, email, phone, gender, birthday } = req.body;

        const user = await prisma.user.findUnique({ where: { userId: parseInt(userId) } });

        if (!user) {
            return res.status(404).json({ message: 'User not found!' });
        }

        const updatedUser = await prisma.user.update({
            where: { userId: parseInt(userId) },
            data: {
                fullName: fullName || user.fullName,
                email: email || user.email,
                phone: phone || user.phone,
                gender: gender || user.gender,
                birthday: birthday || user.birthday,
            },
            select: {
                userId: true,
                fullName: true,
                email: true,
                birthday: true,
                phone: true,
                gender: true,
                isActive: true,
            }
        });

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
        const { userId } = req.params;

        await prisma.user.delete({ where: { userId: parseInt(userId) } });

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