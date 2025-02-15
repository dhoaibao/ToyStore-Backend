import prisma from '../config/prismaClient.js'
import moment from 'moment';

const include = {
    orderStatus: true,
}

export const getAllOrders = async (req, res) => {
    try {
        const { page = 1, limit = 10, orderStatusId, orderId } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (orderStatusId && orderStatusId !== '0') {
            filters.orderStatus = {
                orderStatusId: parseInt(orderStatusId)
            };
        }

        if (orderId) {
            filters.orderId = parseInt(orderId);
        }

        const orders = await prisma.order.findMany({
            skip: orderId ? undefined : skip,
            take: orderId ? undefined : take,
            where: filters,
            orderBy: {
                updatedAt: 'desc'
            },
            include
        });

        const totalOrders = await prisma.order.count({
            where: filters
        });

        return res.status(200).json({
            message: 'All orders fetched!',
            data: orders,
            pagination: {
                total: totalOrders,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalOrders / take),
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

export const getOrderByUser = async (req, res) => {
    try {
        const userId = req.userId;
        const { page = 1, limit = 10, orderStatusId, orderId, startDate, endDate } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        filters.userId = userId;

        if (orderStatusId && orderStatusId !== '0') {
            filters.orderStatus = {
                orderStatusId: parseInt(orderStatusId)
            };
        }

        if (startDate && endDate) {
            filters.createdAt = {
                gte: new Date(`${startDate}T00:00:00.000Z`),
                lte: new Date(`${endDate}T23:59:59.999Z`),
            };
        }

        if (orderId) {
            filters.orderId = parseInt(orderId);
        }

        const orders = await prisma.order.findMany({
            skip: orderId ? undefined : skip,
            take: orderId ? undefined : take,
            where: filters,
            orderBy: {
                updatedAt: 'desc'
            },
            include
        });

        const totalOrders = await prisma.order.count({
            where: filters
        });

        return res.status(200).json({
            message: 'Order fetched!',
            data: orders,
            pagination: {
                total: totalOrders,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalOrders / take),
            }
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const getOrderById = async (req, res) => {
    try {
        const { id } = req.params;

        const order = await prisma.order.findUnique({
            where: { orderId: parseInt(id) },
            include: {
                orderStatus: true,
                paymentMethod: true,
                orderAddress: true,
                orderDetails: {
                    include: {
                        product: {
                            include: {
                                productImages: {
                                    select: {
                                        uploadImage: {
                                            select: {
                                                url: true
                                            }
                                        }
                                    }
                                },
                                discounts: true
                            }
                        }
                    }
                }
            }
        });

        if (!order) {
            return res.status(404).json({ message: 'Order not found!' });
        }

        return res.status(200).json({
            message: 'Order fetched!',
            data: order,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const createOrder = async (req, res) => {
    try {
        const userId = req.userId;
        const { totalPrice, totalDiscount, shippingFee, finalPrice, paymentMethodId, paymentStatus = false, orderItems, addressString, contactName, contactPhone } = req.body;

        if (!totalPrice || !shippingFee || !finalPrice || !paymentMethodId || !orderItems || !addressString || !contactName || !contactPhone) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const result = await prisma.$transaction(async (tx) => {
            const order = await tx.order.create({
                data: {
                    totalPrice,
                    totalDiscount,
                    shippingFee,
                    finalPrice,
                    paymentStatus,
                    userId,
                    orderStatusId: 1,
                    paymentMethodId,
                }
            });

            await tx.orderDetail.createMany({
                data: orderItems.map((item) => ({
                    price: item.product.price,
                    discountedPrice: item.product.discountedPrice || 0,
                    quantity: item.quantity,
                    orderId: order.orderId,
                    productId: item.product.productId
                }))
            });

            const orderAddress = await tx.orderAddress.create({
                data: {
                    address: addressString,
                    contactName,
                    contactPhone,
                    orderId: order.orderId,
                }
            });

            let dataUpdate = {
                orderAddressId: orderAddress.orderAddressId,
            }

            if (paymentStatus) {
                dataUpdate = {
                    ...dataUpdate,
                    paidDate: moment().toDate()
                }
            }

            const updatedOrder = await tx.order.update({
                where: { orderId: order.orderId },
                data: dataUpdate,
                include
            });


            return updatedOrder;
        });

        return res.status(200).json({
            message: 'Order created!',
            data: result,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const cancelOrder = async (req, res) => {
    try {
        const { id } = req.params;
        const userId = req.userId;

        const existingOrder = await prisma.order.findUnique({
            where: { orderId: parseInt(id) },
        });

        if (!existingOrder) {
            return res.status(404).json({ message: 'Order not found!' });
        }

        if (existingOrder.orderStatusId !== 1) {
            return res.status(400).json({ message: 'Order cannot be cancelled!' });
        }

        const result = await prisma.order.update({
            where: { orderId: parseInt(id), userId: parseInt(userId) },
            data: {
                orderStatusId: 5
            },
            include
        });

        return res.status(200).json({
            message: 'Order cancelled!',
            data: result,
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const updateOrderStatus = async (req, res) => {
    try {
        const { id } = req.params;
        const { orderStatusId } = req.body;

        const existingOrder = await prisma.order.findUnique({
            where: { orderId: parseInt(id) },
        });

        if (!existingOrder) {
            return res.status(404).json({ message: 'Order not found!' });
        }

        const result = await prisma.order.update({
            where: { orderId: parseInt(id) },
            data: {
                orderStatusId
            },
            include
        });

        return res.status(200).json({
            message: 'Order status updated!',
            data: result,
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}