import prisma from '../config/prismaClient.js'
import moment from 'moment';

export const getAllOrders = async (_, res) => {
    try {
        const orders = await prisma.order.findMany({});

        return res.status(200).json({
            message: 'All orders fetched!',
            data: orders,
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

        const order = await prisma.order.findMany({
            where: { userId: userId },
        });

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

export const getOrderById = async (req, res) => {
    try {
        const { id } = req.params;

        const order = await prisma.order.findUnique({
            where: { orderId: parseInt(id) },
        });

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

        if (!totalPrice || !totalDiscount || !shippingFee || !finalPrice || !paymentMethodId || !orderItems || !addressString || !contactName || !contactPhone) {
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
                data: dataUpdate
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