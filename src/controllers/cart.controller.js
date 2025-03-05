import prisma from '../config/prismaClient.js'

const include = {
    cartDetails: {
        include: {
            product: {
                include: {
                    productImages: {
                        select: {
                            url: true
                        }
                    },
                    promotion: true,
                    prices: true,
                }
            }
        }
    }
}

export const addToCart = async (req, res) => {
    try {
        const userId = req.userId;
        const { productId, quantity } = req.body;

        let existingCart = await prisma.cart.findFirst({
            where: { userId: userId }
        });

        if (!existingCart) {
            existingCart = await prisma.cart.create({
                data: { userId }
            });
        }

        const cartItem = await prisma.cartDetail.findFirst({
            where: {
                cartId: existingCart.cartId,
                productId: parseInt(productId)
            }
        });

        if (cartItem) {
            await prisma.cartDetail.update({
                where: {
                    productId_cartId: {
                        productId: parseInt(productId),
                        cartId: existingCart.cartId
                    }
                },
                data: {
                    quantity: cartItem.quantity + quantity
                }
            });
        } else {
            const productExists = await prisma.product.findFirst({
                where: { productId: parseInt(productId) }
            });

            if (!productExists) {
                return res.status(404).json({ message: 'Product not found!' });
            }

            await prisma.cartDetail.create({
                data: {
                    cartId: existingCart.cartId,
                    productId: parseInt(productId),
                    quantity
                }
            });
        }

        const updatedCart = await prisma.cart.findFirst({
            where: { userId: userId },
            include,
        });

        return res.status(200).json({
            message: 'Cart updated!',
            data: updatedCart,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
};

export const getCartByUser = async (req, res) => {
    try {
        const userId = req.userId;

        const cart = await prisma.cart.findFirst({
            where: { userId: userId },
            include,
        });

        return res.status(200).json({
            message: 'Cart fetched!',
            data: cart,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const removeFromCart = async (req, res) => {
    try {
        const userId = req.userId;
        const { id: productId } = req.params;

        const existingCart = await prisma.cart.findFirst({
            where: { userId: userId }
        });

        if (!existingCart) {
            return res.status(404).json({ message: 'Cart not found!' });
        }

        const cartItem = await prisma.cartDetail.findFirst({
            where: {
                cartId: existingCart.cartId,
                productId: parseInt(productId)
            }
        });

        if (!cartItem) {
            return res.status(404).json({ message: 'Product not found in cart!' });
        }

        await prisma.cartDetail.delete({
            where: {
                productId_cartId: {
                    productId: parseInt(productId),
                    cartId: existingCart.cartId
                }
            }
        });

        const updatedCart = await prisma.cart.findFirst({
            where: { userId: userId },
            include,
        });

        return res.status(200).json({
            message: 'Cart updated!',
            data: updatedCart,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const updateCartItem = async (req, res) => {
    try {
        const userId = req.userId;
        const { productId, quantity } = req.body;

        const existingCart = await prisma.cart.findFirst({
            where: { userId: userId }
        });

        if (!existingCart) {
            return res.status(404).json({ message: 'Cart not found!' });
        }

        const cartItem = await prisma.cartDetail.findFirst({
            where: {
                cartId: existingCart.cartId,
                productId: parseInt(productId)
            }
        });

        if (!cartItem) {
            return res.status(404).json({ message: 'Product not found in cart!' });
        }

        await prisma.cartDetail.update({
            where: {
                productId_cartId: {
                    productId: parseInt(productId),
                    cartId: existingCart.cartId
                }
            },
            data: {
                quantity
            }
        });

        const updatedCart = await prisma.cart.findFirst({
            where: { userId: userId },
            include,
        });

        return res.status(200).json({
            message: 'Cart updated!',
            data: updatedCart,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}