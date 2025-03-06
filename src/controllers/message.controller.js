import prisma from '../config/prismaClient.js'

export const getMessages = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = parseInt(id);

        const messages = await prisma.message.findMany({
            where: {
                OR: [
                    {
                        senderId: userId
                    },
                    {
                        receiverId: userId
                    }
                ]
            },
            orderBy: {
                time: 'asc'
            }
        });

        const unreadCount = await prisma.message.count({
            where: {
                receiverId: userId,
                isRead: false
            }
        });

        return res.status(200).json({
            message: 'All messages fetched!',
            data: messages,
            unreadCount: unreadCount
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

export const getUnreadCount = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = parseInt(id);

        const unreadCount = await prisma.message.count({
            where: {
                receiverId: userId,
                isRead: false
            }
        });

        return res.status(200).json({
            message: 'Unread messages fetched!',
            data: unreadCount
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

export const markAsRead = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = parseInt(id);

        await prisma.message.updateMany({
            where: {
                receiverId: userId,
                isRead: false
            },
            data: {
                isRead: true
            }
        });

        return res.status(200).json({
            message: 'All messages marked as read!',
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