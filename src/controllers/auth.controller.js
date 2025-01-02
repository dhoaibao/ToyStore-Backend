import prisma from '../config/prismaClient.js'
import bcrypt from 'bcrypt';
import generateToken from '../utils/generateToken.js';
import { sendOTPEmail } from '../utils/sendEmail.js';
import { saveOTP, verifyOTP, saveUser, getUser } from '../utils/redis.js';

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

        const otp = (Math.floor(100000 + Math.random() * 900000)).toString().padStart(6, '0'); // Generate a 6-digit OTP as a string
        await sendOTPEmail(email, otp);
        await saveOTP(email, otp);

        const user = {
            fullName,
            email,
            password: hashedPassword,
            birthday: new Date(birthday),
        };

        await saveUser(user);

        return res.status(201).json({
            message: 'Done! Please verify your email with the OTP sent.',
            data: user,
            otp: otp,
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

export const verifyEmail = async (req, res) => {
    try {
        const { email, otp } = req.body;

        const isOtpValid = await verifyOTP(email, otp);

        if (isOtpValid) {
            const user = await getUser(email);
            const { fullName, email: userEmail, password, birthday } = user;
            await prisma.user.create({
                data: {
                    fullName,
                    email: userEmail,
                    password,
                    birthday: new Date(birthday),
                }
            });

            return res.status(200).json({ message: 'Email verified successfully!' });
        } else {
            return res.status(400).json({ message: 'Invalid OTP or OTP expired.' });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}

export const resendOtp = async (req, res) => {
    try {
        const { email } = req.body;

        const otp = (Math.floor(100000 + Math.random() * 900000)).toString().padStart(6, '0');
        await sendOTPEmail(email, otp);
        await saveOTP(email, otp);

        return res.status(200).json({
            message: 'OTP resend successfully!',
            otp: otp,
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}