import prisma from '../config/prismaClient.js'
import bcrypt from 'bcrypt';
import generateToken from '../utils/generateToken.js';

export const signUp = async (req, res) => {
    try {
        const { fullName, email, password, confirmPassword } = req.body;

        if (!fullName || !email || !password || !confirmPassword) {
            return res.status(400).json({ message: 'Missing required fields!' });
        }

        if (password.length < 8) {
            return res.status(400).json({
                error: 'Password must be at least 8 characters!',
            });
        }

        if (password !== confirmPassword) {
            return res.status(400).json({
                error: 'Passwords do not match!',
            });
        }

        const existingUser = await prisma.user.findUnique({ where: { email } });

        if (existingUser) {
            return res.status(400).json({
                error: 'User already exists!',
            });
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const user = await prisma.user.create({
            data: {
                fullName,
                email,
                password: hashedPassword,
            }
        });

        const tokens = generateToken(user);

        await prisma.user.update({
            where: { userId: user.userId },
            data: { refreshToken: tokens.refreshToken },
        });

        return res.status(201).json({
            message: 'User created!',
            data: {
                user,
                tokens,
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