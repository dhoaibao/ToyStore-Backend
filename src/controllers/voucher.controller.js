import prisma from '../config/prismaClient.js'

export const getAllVouchers = async (req, res) => {
    try {
        const { page = 1, limit = 10, status, keyword = '', sort = '', order = '', discountType } = req.query;
        const skip = (page - 1) * limit;
        const take = parseInt(limit);

        const filters = {};

        if (keyword) {
            filters.voucherCode = {
                contains: keyword,
                mode: 'insensitive'
            }
        }

        if (discountType) {
            filters.discountType = discountType;
        }

        if (status === 'valid') {
            filters.startDate = {
                lte: new Date()
            };
            filters.endDate = {
                gte: new Date()
            };
            filters.quantity = {
                not: prisma.voucher.collectedQuantity
            };
        }

        const sortOrder = {};

        if (sort && order) {
            sortOrder[sort] = order;
        } else {
            sortOrder.updatedAt = 'desc';
        }

        const queryOptions = {
            where: filters,
            include: {
                users: {
                    select: {
                        userId: true,
                    }
                }
            },
            orderBy: sortOrder,
        };

        if (take !== -1) {
            queryOptions.skip = skip;
            queryOptions.take = take;
        }

        const [vouchers, totalVouchers] = await Promise.all([
            prisma.voucher.findMany(queryOptions),
            prisma.voucher.count({ where: filters })
        ]);

        return res.status(200).json({
            message: 'All vouchers fetched!',
            data: vouchers,
            pagination: {
                total: totalVouchers,
                page: parseInt(page),
                limit: take,
                totalPages: take === -1 ? 1 : Math.ceil(totalVouchers / take),
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

export const getVoucherByUser = async (req, res) => {
    try {
        const userId = req.userId;

        const vouchers = await prisma.voucher.findMany({
            where: {
                users: {
                    some: {
                        userId: userId
                    }
                },
                orders: {
                    none: {
                        userId: userId
                    }
                },
                startDate: {
                    lte: new Date()
                },
                endDate: {
                    gte: new Date()
                },
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
        const { voucherCode, discountType, discountValue, minOrderPrice = 0, maxPriceDiscount = 0, startDate, endDate, quantity } = req.body;

        if (!voucherCode || !discountType || !discountValue || !startDate || !endDate || !quantity) {
            return res.status(400).json({
                message: 'Missing required fields!'
            });
        }

        const existingVoucher = await prisma.voucher.findUnique({
            where: {
                voucherCode
            }
        });

        if (existingVoucher) {
            return res.status(400).json({
                message: 'Voucher code already exists!'
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
        const { voucherCode, discountType, discountValue, minOrderPrice = 0, maxPriceDiscount = 0, startDate, endDate, quantity } = req.body;

        const existingVoucher = await prisma.voucher.findUnique({
            where: { voucherId: parseInt(id) }
        });

        if (!existingVoucher) {
            return res.status(404).json({
                message: 'Voucher not found!'
            });
        }

        if (voucherCode && voucherCode !== existingVoucher.voucherCode) {
            const existingVoucherCode = await prisma.voucher.findUnique({
                where: { voucherCode }
            });

            if (existingVoucherCode) {
                return res.status(400).json({ message: 'Voucher code already exists!' });
            }
        }

        const fields = {
            voucherCode,
            discountType,
            discountValue,
            minOrderPrice,
            maxPriceDiscount: maxPriceDiscount ? parseFloat(maxPriceDiscount) : null,
            startDate: startDate ? new Date(startDate) : null,
            endDate: endDate ? new Date(endDate) : null,
            quantity: quantity ? parseInt(quantity) : null,
        };

        const data = Object.entries(fields).reduce((acc, [key, value]) => {
            if (value != null && value !== existingVoucher[key]) {
                acc[key] = value;
            }
            return acc;
        }, {});

        const voucher = await prisma.voucher.update({
            where: { voucherId: parseInt(id) },
            data
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