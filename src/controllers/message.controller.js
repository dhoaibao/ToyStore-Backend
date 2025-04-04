import prisma from "../config/prismaClient.js";

const include = {
  uploadImages: {
    select: {
      url: true,
    },
  },
};

export const getMessages = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = parseInt(id);

    const { page = 1, limit = 20 } = req.query;
    const skip = (parseInt(page) - 1) * parseInt(limit);
    const take = parseInt(limit);

    const messages = await prisma.message.findMany({
      where: {
        OR: [
          {
            senderId: userId,
          },
          {
            receiverId: userId,
          },
        ],
      },
      skip,
      take,
      include,
    });

    const totalMessages = await prisma.message.count({
      where: {
        OR: [
          {
            senderId: userId,
          },
          {
            receiverId: userId,
          },
        ],
      },
    });

    const unreadCount = await prisma.message.count({
      where: {
        receiverId: userId,
        isRead: false,
      },
    });

    return res.status(200).json({
      message: "All messages fetched!",
      data: messages,
      unreadCount: unreadCount,
      pagination: {
        total: totalMessages,
        page: parseInt(page),
        limit: take,
        totalPages: Math.ceil(totalMessages / take),
      },
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const getConversations = async (req, res) => {
  try {
    const { page = 1, limit = 20 } = req.query;
    const skip = (parseInt(page) - 1) * parseInt(limit);
    const take = parseInt(limit);

    const senders = await prisma.message.findMany({
      where: {
        receiverId: null,
      },
      distinct: ["senderId"],
      include: {
        sender: {
          select: {
            fullName: true,
            email: true,
            avatar: {
              select: {
                url: true,
              },
            },
          },
        },
      },
      orderBy: {
        time: "desc",
      },
      skip,
      take,
    });

    const conversations = await Promise.all(
      senders.map(async (i) => {
        const senderId = i.senderId;
        const unreadCount = await prisma.message.count({
          where: {
            senderId: senderId,
            isRead: false,
          },
        });

        const sender = {
          senderId: i.senderId,
          ...i.sender,
        };

        const lastMessage = {
          content: i.content,
          time: i.time,
          isRead: i.isRead,
        };

        return { sender, lastMessage, unreadCount };
      }),
    );

    const totalConversations = conversations.length;

    return res.status(200).json({
      message: "Conversations fetched!",
      data: conversations,
      pagination: {
        total: totalConversations,
        page: parseInt(page),
        limit: take,
        totalPages: Math.ceil(totalConversations / take),
      },
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const getUnreadCount = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = parseInt(id);

    const unreadCount = await prisma.message.count({
      where: {
        receiverId: userId,
        isRead: false,
      },
    });

    return res.status(200).json({
      message: "Unread messages fetched!",
      data: unreadCount,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};
