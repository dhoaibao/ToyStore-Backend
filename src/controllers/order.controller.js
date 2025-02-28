import prisma from '../config/prismaClient.js'

const include = {
    orderTrackings: {
        select: {
            orderStatus: true,
            time: true
        }
    },
    user: true,
}

export const getAllOrders = async (req, res) => {
    try {
        const { page = 1, limit = 10, orderStatus, paymentStatus, startDate, endDate, keyword = '', sort = '', order = '' } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (orderStatus) {
            filters.orderTrackings = {
                some: {
                    orderStatus: {
                        statusName: orderStatus
                    }
                }
            };
        }

        if (startDate && endDate) {
            filters.createdAt = {
                gte: new Date(`${startDate}T00:00:00.000Z`),
                lte: new Date(`${endDate}T23:59:59.999Z`),
            };
        }

        if (paymentStatus) {
            filters.paymentStatus = paymentStatus === 'true';
        }

        if (keyword) {
            if (/[a-zA-Z]/.test(keyword)) {
                filters.user = {
                    fullName: {
                        contains: keyword,
                        mode: 'insensitive'
                    }
                }
            } else {
                filters.orderId = parseInt(keyword);
            }
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        } else {
            sortOrder.updatedAt = 'desc';
        }

        const [orders, totalOrders] = await Promise.all([
            prisma.order.findMany({
                skip: skip,
                take: take,
                where: filters,
                orderBy: sortOrder,
                include
            }),

            prisma.order.count({
                where: filters
            })
        ]);

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

        const [orders, totalOrders] = await Promise.all([
            prisma.order.findMany({
                skip: orderId ? undefined : skip,
                take: orderId ? undefined : take,
                where: filters,
                orderBy: {
                    updatedAt: 'desc'
                },
                include
            }),

            prisma.order.count({
                where: filters
            })
        ]);

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
                                productImages: true,
                                promotions: true
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
        const { totalPrice, totalDiscount, shippingFee, finalPrice, paymentMethodId, paymentStatus = false, orderItems, cartId, addressString, contactName, contactPhone, voucherId } = req.body;

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
                    user: {
                        connect: {
                            userId
                        }
                    },
                    paymentMethod: {
                        connect: {
                            paymentMethodId
                        }
                    },
                    voucherId,
                    orderAddress: {
                        create: {
                            address: addressString,
                            contactName,
                            contactPhone,
                        }
                    }
                }
            });

            await tx.orderTracking.create({
                data: {
                    orderStatusId: 1,
                    orderId: order.orderId
                }
            });

            const orderDetails = orderItems.map((item) => ({
                price: item.product.price,
                discountedPrice: item.product.discountedPrice || 0,
                quantity: item.quantity,
                orderId: order.orderId,
                productId: item.product.productId
            }));

            await tx.orderDetail.createMany({ data: orderDetails });

            await Promise.all(orderItems.map(async (item) => {
                await tx.product.update({
                    where: {
                        productId: item.product.productId
                    },
                    data: {
                        soldNumber: {
                            increment: item.quantity
                        }
                    }
                });
            }));

            let updateData = paymentStatus ? { paidDate: new Date() } : {};

            const updatedOrder = await tx.order.update({
                where: { orderId: order.orderId },
                data: updateData,
                include
            });

            await tx.cartDetail.deleteMany({
                where: { cartId, productId: { in: orderItems.map(item => item.product.productId) } }
            });

            if (voucherId) {
                await tx.voucher.update({
                    where: { voucherId },
                    data: {
                        currentUsedQuantity: {
                            increment: 1
                        }
                    }
                });
            }

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

        const existingOrder = await prisma.order.findUnique({
            where: { orderId: parseInt(id) },
            include: {
                orderTrackings: true
            }
        });

        if (!existingOrder) {
            return res.status(404).json({ message: 'Order not found!' });
        }

        const length = existingOrder.orderTrackings.length;

        console.log(existingOrder.orderTrackings[length - 1]);

        if (existingOrder.orderTrackings[length - 1].orderStatusId !== 1) {
            return res.status(400).json({ message: 'Order cannot be cancelled!' });
        }

        await prisma.orderTracking.create({
            data: {
                orderStatusId: 5,
                orderId: existingOrder.orderId
            }
        });

        return res.status(200).json({
            message: 'Order cancelled!'
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

        await tx.orderTracking.create({
            data: {
                orderStatusId: 5,
                orderId: existingOrder.orderId
            }
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