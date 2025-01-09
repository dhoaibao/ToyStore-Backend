import prisma from '../config/prismaClient.js'

export const getAddressByUser = async (req, res) => {
    try {
        const userId = req.userId;

        const addresss = await prisma.address.findMany({
            where: { userId: parseInt(userId) },
            include: {
                user: true,
            }
        });

        return res.status(200).json({
            message: 'All addresss fetched!',
            data: addresss,
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

export const getAllAddreses = async (_, res) => {
    try {
        const addresss = await prisma.address.findMany({
            include: {
                user: true,
            }
        });

        return res.status(200).json({
            message: 'All addresss fetched!',
            data: addresss,
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

export const getAddressById = async (req, res) => {
    try {
        const { id } = req.params;

        const address = await prisma.address.findUnique({
            where: { addressId: parseInt(id) },
            include: {
                user: true,
            }
        });

        if (!address) {
            return res.status(404).json({ message: "Address not found!" });
        }

        return res.status(200).json({
            message: 'Address fetched!',
            data: address,
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

export const createAddress = async (req, res) => {
    try {
        const { addressName, provinceCode, districtCode, wardCode, provinceName, districtName, wardName, detail, isDefault, contactName, contactPhone, userId } = req.body;

        if (!addressName || !provinceCode || !districtCode || !wardCode || !provinceName || !districtName || !wardName || !detail || !contactName || !contactPhone) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        const address = await prisma.address.create({
            data: {
                addressName,
                provinceCode: String(provinceCode),
                districtCode: String(districtCode),
                wardCode: String(wardCode),
                provinceName,
                districtName,
                wardName,
                detail,
                isDefault: isDefault || false,
                contactName,
                contactPhone,
                userId: parseInt(userId),
            },
            include: {
                user: true,
            }
        });

        if (isDefault) {
            await prisma.address.updateMany({
                where: { addressId: { not: address.addressId } },
                data: { isDefault: false },
            });
        }

        return res.status(201).json({
            message: 'Address created!',
            data: address,
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

export const updateAddress = async (req, res) => {
    try {
        const { id } = req.params;

        const { addressName, provinceCode, districtCode, wardCode, provinceName, districtName, wardName, detail, isDefault, contactName, contactPhone, userId } = req.body;

        const address = await prisma.address.findUnique({ where: { addressId: parseInt(id) } });

        if (!address) {
            return res.status(404).json({ message: 'Address not found!' });
        }

        const updatedAddress = await prisma.address.update({
            where: { addressId: parseInt(id) },
            data: {
                addressName: addressName || address.addressName,
                provinceCode: String(provinceCode) || address.provinceCode,
                districtCode: String(districtCode) || address.districtCode,
                wardCode: String(wardCode) || address.wardCode,
                provinceName: provinceName || address.provinceName,
                districtName: districtName || address.districtName,
                wardName: wardName || address.wardName,
                detail: detail || address.detail,
                isDefault: isDefault || address.isDefault,
                contactName: contactName || address.contactName,
                contactPhone: contactPhone || address.contactPhone,
                userId: parseInt(userId) || address.userId,
            },
            include: {
                user: true,
            }
        });

        if (isDefault) {
            await prisma.address.updateMany({
                where: { addressId: { not: parseInt(id) } },
                data: { isDefault: false },
            });
        }

        return res.status(200).json({
            message: 'Address updated!',
            data: updatedAddress,
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

export const deleteAddress = async (req, res) => {
    try {
        const { id } = req.params;

        await prisma.address.delete({ where: { addressId: parseInt(id) } });

        return res.status(200).json({ message: 'Address deleted!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}