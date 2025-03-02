import prisma from '../config/prismaClient.js'
import bcrypt from 'bcrypt';
import { generateToken, decodedRefreshToken } from '../utils/token.js';
import { sendOTPEmail, sendPasswordResetSuccessEmail } from '../utils/sendEmail.js';
import { setData, getData, verifyData } from '../utils/redis.js';
import { uploadFileFromUrl } from '../utils/supabaseStorage.js';

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
        await setData(`otp:${email}`, '60s', otp);

        const user = {
            fullName,
            email,
            roleId: 1,
            password: hashedPassword,
            birthday: new Date(birthday),
        };

        await setData(`user:${email}`, '1h', user);

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

        if (!existingUser.isActive) {
            return res.status(401).json({ message: "User is inactive!" });
        }

        const isPasswordValid = await bcrypt.compare(password, existingUser.password);

        if (!isPasswordValid) {
            return res.status(401).json({ message: "Invalid credentials!" });
        }

        const tokens = generateToken(existingUser);

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

export const signInAdmin = async (req, res) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(400).json({ message: "Email and password are required!" })
        }

        const existingUser = await prisma.user.findUnique({ where: { email } });

        if (!existingUser) {
            return res.status(404).json({ message: "User not found!" });
        }

        if (!existingUser.isActive) {
            return res.status(401).json({ message: "User is inactive!" });
        }

        const existingRole = await prisma.role.findUnique({ where: { roleId: existingUser.roleId } });

        if (!existingRole || existingRole.roleId === 1) {
            return res.status(401).json({ message: "Unauthorized!" });
        }

        const isPasswordValid = await bcrypt.compare(password, existingUser.password);

        if (!isPasswordValid) {
            return res.status(401).json({ message: "Invalid credentials!" });
        }

        const tokens = generateToken(existingUser);

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

export const signInWithGoogle = async (req, res) => {
    try {
        const { email, fullName, photoUrl, phoneNumber } = req.body;

        let url = null;
        let filePath = null;
        if (photoUrl) {
            const result = await uploadFileFromUrl(photoUrl);
            url = result.url;
            filePath = result.filePath;
        }

        let user = await prisma.user.findUnique({ where: { email } });

        if (!user) {
            user = await prisma.user.create({
                data: {
                    email,
                    fullName,
                    phone: phoneNumber || null,
                    avatar: {
                        create: {
                            url,
                            filePath,
                        }
                    }
                }
            });
        }

        const tokens = generateToken(user);

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

        const isOtpValid = await verifyData(`otp:${email}`, otp);

        if (isOtpValid) {
            const user = await getData(`user:${email}`);
            const { fullName, email: userEmail, password, birthday, roleId } = user;
            await prisma.user.create({
                data: {
                    fullName,
                    roleId,
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
        await setData(`otp:${email}`, '60s', otp);

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

export const resetPassword = async (req, res) => {
    try {
        const { email, newPassword, confirmNewPassword } = req.body;

        if (!email || !newPassword || !confirmNewPassword) {
            return res.status(400).json({ message: 'Email, new password, and confirm new password are required!' });
        }

        if (newPassword.length < 8) {
            return res.status(400).json({
                error: 'Password must be at least 8 characters!',
            });
        }

        if (newPassword !== confirmNewPassword) {
            return res.status(400).json({
                error: 'Passwords do not match!',
            });
        }

        const existingUser = await prisma.user.findUnique({ where: { email } });

        if (!existingUser) {
            return res.status(404).json({ message: 'User not found!' });
        }

        const otp = (Math.floor(100000 + Math.random() * 900000)).toString().padStart(6, '0'); // Generate a 6-digit OTP as a string
        await sendOTPEmail(email, otp);
        await setData(`otp:${email}`, '60s', otp);

        const hashedPassword = await bcrypt.hash(newPassword, 10);

        await setData(`pass:${email}`, '1d', hashedPassword);
        return res.status(201).json({
            message: 'Password reset successfully!',
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

export const verifyResetPassword = async (req, res) => {
    try {
        const { email, otp } = req.body;

        const isOtpValid = await verifyData(`otp:${email}`, otp);

        if (isOtpValid) {
            const password = await getData(`pass:${email}`);

            await prisma.user.update({
                where: { email },
                data: { password: password },
            });

            await sendPasswordResetSuccessEmail(email);

            return res.status(200).json({ message: 'Password reset successfully!' });
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

export const refreshToken = async (req, res) => {
    try {
        const { refreshToken } = req.body;

        if (!refreshToken) {
            return res.status(400).json({ message: 'Refresh token is required!' });
        }

        const result = decodedRefreshToken(refreshToken);

        if (!result) {
            return res.status(400).json({ message: 'Invalid token!' });
        }

        const { userId, iat } = result;

        getData(`blocklist:${userId}-${iat}`).then((result) => {
            if (result === refreshToken) {
                return res.status(401).json({ message: 'Token expired!' });
            }
        });

        const existingUser = await prisma.user.findUnique({ where: { userId } });

        if (!existingUser) {
            return res.status(404).json({ message: 'User not found!' });
        }

        const tokens = generateToken(existingUser);

        return res.status(200).json({
            message: 'Token refreshed!',
            token: tokens,
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

export const signOut = async (req, res) => {
    try {
        const { refreshToken } = req.body;

        const { userId, iat, exp } = decodedRefreshToken(refreshToken);

        const expTime = exp - Math.floor(Date.now() / 1000);

        setData(`blocklist:${userId}-${iat}`, `${expTime}s`, refreshToken);

        return res.status(200).json({ message: 'User logged out!' });
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({
            message: 'Internal Server Error',
            error: error.message
        });
    }
}