import prisma from '../config/prismaClient.js';

export const getAllOrderStatuses = async (_, res) => {
    try {
        const orderStatuses = await prisma.orderStatus.findMany({});

        return res.status(200).json({
            message: 'All order statuses fetched!',
            data: orderStatuses,
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