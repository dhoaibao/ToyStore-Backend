import prisma from '../config/prismaClient.js'
import bcrypt from 'bcrypt';
import generateToken from '../utils/generateToken.js';

export const getLoggedInUser = async (req, res) => {
    try {
        const user = req.user;

        const existingUser = await prisma.user.findUnique({
            where: { userId: user.userId },
            select: {
                userId: true,
                fullName: true,
                email: true,
                birthday: true,
                phone: true,
                gender: true,
                isActive: true,
            }
        });

        if (!existingUser) {
            return res.status(404).json({ message: "User not found!" });
        }

        return res.status(200).json({
            message: 'User logged in!',
            data: existingUser,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const signUp = async (req, res) => {
    try {
        const { fullName, email, password, confirmPassword, birthday } = req.body;

        if (!fullName || !email || !password || !confirmPassword || !birthday) {
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
                birthday: new Date(birthday),
            }
        });

        return res.status(201).json({
            message: 'User created!',
            data: user,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const signIn = async (req, res) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(400).json({ message: "Email and password are required!" })
        }

        const existingUser = await prisma.user.findUnique({ where: { email } });

        if (!existingUser) {
            return res.status(404).json({ message: "User not found!" });
        }

        const isPasswordValid = await bcrypt.compare(password, existingUser.password);

        if (!isPasswordValid) {
            return res.status(401).json({ message: "Invalid credentials!" });
        }

        const tokens = generateToken(existingUser);

        await prisma.user.update({
            where: { userId: existingUser.userId },
            data: { refreshToken: tokens.refreshToken },
        });

        return res.status(200).json({
            message: 'User logged in!',
            data: tokens,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}