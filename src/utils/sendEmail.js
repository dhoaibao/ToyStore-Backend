import nodemailer from 'nodemailer';
import dotenv from 'dotenv';

dotenv.config();
const EMAIL_USER = process.env.EMAIL_USER;
const EMAIL_PASS = process.env.EMAIL_PASS;

export const sendOTPEmail = async (email, otp) => {
    try {
        const transporter = nodemailer.createTransport({
            service: 'gmail', // Hoặc dịch vụ khác (Outlook, Yahoo, ...)
            auth: {
                user: EMAIL_USER, // Email của bạn
                pass: EMAIL_PASS, // Mật khẩu ứng dụng (không phải mật khẩu tài khoản)
            },
        });

        const mailOptions = {
            from: '"ToyStore" <noreply@yourapp.com>',
            to: email,
            subject: 'Your OTP Code',
            text: `Your OTP code is: ${otp}`,
            html: `<p>Your OTP code is: <b>${otp}</b></p>`,
        };

        await transporter.sendMail(mailOptions);
        console.log('OTP sent to:', email);
    } catch (error) {
        console.error('Error sending OTP:', error);
    }
};