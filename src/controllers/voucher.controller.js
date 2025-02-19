import prisma from '../config/prismaClient.js'

export const getAllVouchers = async (req, res) => {
    try {
        const { page = 1, limit = 10 } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const [vouchers, totalVouchers] = await Promise.all([
            prisma.voucher.findMany({
                skip,
                take
            }),
            prisma.voucher.count()
        ]);

        return res.status(200).json({
            message: 'All vouchers fetched!',
            data: vouchers,
            pagination: {
                total: totalVouchers,
                page: parseInt(page),
                limit: take,
                totalPages: Math.ceil(totalVouchers / take),
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

export const collectVoucher = async (req, res) => {
    try {
        const userId = req.userId;
        const { id } = req.params;
        const voucherId = parseInt(id);

        const existingVoucher = await prisma.voucher.findUnique({
            where: { voucherId },
        });

        if (!existingVoucher) {
            return res.status(404).json({
                message: 'Voucher not found!'
            });
        }

        const isVoucherCollected = await prisma.user.findFirst({
            where: {
                userId,
                vouchers: {
                    some: {
                        voucherId
                    }
                }
            }
        });

        if (isVoucherCollected) {
            return res.status(400).json({
                message: 'Voucher already collected!'
            });
        }

        const result = await prisma.voucher.update({
            where: { voucherId },
            data: {
                users: {
                    connect: { userId }
                },
                collectedQuantity: { increment: 1 }
            }
        });

        return res.status(200).json({
            message: 'Voucher collected!',
            data: result
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

export const getVoucherByUser = async (req, res) => {
    try {
        const userId = req.userId;

        const vouchers = await prisma.voucher.findMany({
            where: {
                users: {
                    some: {
                        userId: userId
                    }
                }
            }
        });

        return res.status(200).json({
            message: 'Vouchers fetched!',
            data: vouchers
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

export const getVoucherById = async (req, res) => {
    try {
        const { id } = req.params;

        const voucher = await prisma.voucher.findUnique({
            where: { voucherId: parseInt(id) }
        });

        if (!voucher) {
            return res.status(404).json({
                message: 'Voucher not found!'
            });
        }

        return res.status(200).json({
            message: 'Voucher fetched!',
            data: voucher
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

export const createVoucher = async (req, res) => {
    try {
        const { voucherCode, discountType, discountValue, minOrderPrice, maxPriceDiscount, startDate, endDate, quantity } = req.body;

        if (!voucherCode || !discountType || !discountValue || !minOrderPrice || !maxPriceDiscount || !startDate || !endDate || !quantity) {
            return res.status(400).json({
                message: 'Missing required fields!'
            });
        }

        const voucher = await prisma.voucher.create({
            data: {
                voucherCode,
                discountType,
                discountValue: parseFloat(discountValue),
                minOrderPrice: parseFloat(minOrderPrice),
                maxPriceDiscount: parseFloat(maxPriceDiscount),
                startDate: new Date(startDate),
                endDate: new Date(endDate),
                quantity: parseInt(quantity),
            }
        });

        return res.status(201).json({
            message: 'Voucher created!',
            data: voucher
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

export const updateVoucher = async (req, res) => {
    try {
        const { id } = req.params;
        const { voucherCode, discountType, discountValue, minOrderPrice, maxPriceDiscount, startDate, endDate, quantity } = req.body;

        const existingVoucher = await prisma.voucher.findUnique({
            where: { voucherId: parseInt(id) }
        });

        if (!existingVoucher) {
            return res.status(404).json({
                message: 'Voucher not found!'
            });
        }

        const voucher = await prisma.voucher.update({
            where: { voucherId: parseInt(id) },
            data: {
                voucherCode: voucherCode || existingVoucher.voucherCode,
                discountType: discountType || existingVoucher.discountType,
                discountValue: parseFloat(discountValue) || existingVoucher.discountValue,
                minOrderPrice: parseFloat(minOrderPrice) || existingVoucher.minOrderPrice,
                maxPriceDiscount: parseFloat(maxPriceDiscount) || existingVoucher.maxPriceDiscount,
                startDate: new Date(startDate) || existingVoucher.startDate,
                endDate: new Date(endDate) || existingVoucher.endDate,
                quantity: parseInt(quantity) || existingVoucher.quantity,
            }
        });

        return res.status(200).json({
            message: 'Voucher updated!',
            data: voucher
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

export const deleteVoucher = async (req, res) => {
    try {
        const { id } = req.params;

        const existingVoucher = await prisma.voucher.findUnique({
            where: { voucherId: parseInt(id) }
        });

        if (!existingVoucher) {
            return res.status(404).json({
                message: 'Voucher not found!'
            });
        }

        await prisma.voucher.delete({
            where: { voucherId: parseInt(id) }
        });

        return res.status(200).json({
            message: 'Voucher deleted!'
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