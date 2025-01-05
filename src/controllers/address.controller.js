import prisma from '../config/prismaClient.js'

const addressSelect = {
    addressId: true,
    provinceCode: true,
    districtCode: true,
    wardCode: true,
    provinceName: true,
    districtName: true,
    wardName: true,
    detail: true,
    isDefault: true,
    contactName: true,
    contactPhone: true,
    user: {
        select: {
            userId: true,
            fullName: true,
            email: true,
            phone: true,
        }
    }
};

export const getAllAddresss = async (req, res) => {
    try {
        const addresss = await prisma.address.findMany({
            select: addressSelect,
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
            select: addressSelect,
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

export const updateAddress = async (req, res) => {
    try {
        const { addressId } = req.params;

        const { fullName, email, phone, gender, birthday, avatarId } = req.body;

        const address = await prisma.address.findUnique({ where: { addressId: parseInt(addressId) } });

        if (!address) {
            return res.status(404).json({ message: 'Address not found!' });
        }

        const updatedAddress = await prisma.address.update({
            where: { addressId: parseInt(addressId) },
            data: {
                fullName: fullName || address.fullName,
                email: email || address.email,
                phone: phone || address.phone,
                gender: gender || address.gender,
                avatarId: avatarId || address.avatarId,
                birthday: new Date(birthday) || new Date(address.birthday),
            },
            select: addressSelect,
        });

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