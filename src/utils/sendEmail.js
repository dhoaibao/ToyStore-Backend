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
            from: '"ToyStore" <noreply@toystore.com>',
            to: email,
            subject: 'Mã xác thực (OTP) của bạn',
            text: `Mã OTP của bạn là: ${otp}`, // Nội dung dự phòng cho email không hỗ trợ HTML
            html: `
                <div style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
                    <div style="max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9;">
                        <h2 style="text-align: center; color: #122da6;">ToyStore - Mã xác thực (OTP)</h2>
                        <p>Xin chào,</p>
                        <p>Chúng tôi đã nhận được yêu cầu xác thực email của bạn trên <strong>ToyStore</strong>. Vui lòng sử dụng mã OTP dưới đây để hoàn tất quá trình xác thực:</p>
                        <div style="text-align: center; margin: 20px 0;">
                            <span style="display: inline-block; padding: 15px 30px; font-size: 24px; font-weight: bold; color: #fff; background-color: #122da6; border-radius: 4px;">
                                ${otp}
                            </span>
                        </div>
                        <p style="color: #555;">Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>
                        <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>
                        <p><strong>Đội ngũ ToyStore</strong></p>
                        <hr style="border: none; border-top: 1px solid #ddd; margin: 20px 0;" />
                        <p style="font-size: 12px; color: #999; text-align: center;">
                            Email này được gửi tự động từ hệ thống của ToyStore. Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ chúng tôi qua email <a href="mailto:support@toystore.com" style="color: #122da6;">support@toystore.com</a>.
                        </p>
                    </div>
                </div>
            `,
        };

        await transporter.sendMail(mailOptions);
        console.log('OTP sent to:', email);
    } catch (error) {
        console.error('Error sending OTP:', error);
    }
};