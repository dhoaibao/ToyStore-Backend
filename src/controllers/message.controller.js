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

export const getConversations = async (req, res) => {
    try {
        const senders = await prisma.message.findMany({
            distinct: ['senderId', 'receiverId'],
            select: {
                senderId: true,
                sender: {
                    select: {
                        fullName: true,
                        email: true,
                        avatar: {
                            select: {
                                url: true
                            }
                        }
                    }
                }
            },
            orderBy: {
                time: 'desc'
            },
            where: {
                receiverId: null
            }
        });

        const conversations = [];
        for (const sender of senders) {
            const senderId = sender.senderId;
            const lastMessage = await prisma.message.findFirst({
                where: {
                    OR: [
                        {
                            senderId: senderId
                        },
                        {
                            receiverId: senderId
                        }
                    ]
                },
                select: {
                    content: true,
                    time: true,
                    isRead: true,
                },
                orderBy: {
                    time: 'desc'
                }
            });

            conversations.push({sender, lastMessage});   
        }

        return res.status(200).json({
            message: 'Conversations fetched!',
            data: conversations
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