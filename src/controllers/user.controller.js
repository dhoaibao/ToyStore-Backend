import prisma from '../config/prismaClient.js'

export const getLoggedInUser = async (req, res) => {
    try {
        const user = req.user;

        const existingUser = await prisma.user.findUnique({
            where: { userId: user.userId },
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