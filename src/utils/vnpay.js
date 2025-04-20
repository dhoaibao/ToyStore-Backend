import qs from 'qs'
import crypto from 'crypto'
import sortObject from "./sortObject";

const tmnCode = process.env.vnp_TmnCode;
const secretKey = process.env.vnp_HashSecret;
const vnpUrl = process.env.vnp_Url;
const returnUrl = process.env.vnp_ReturnUrl;

export const createPaymentUrl = (ipAddr, createDate, orderId, amount) => {

    let vnp_Params = {
        vnp_Version: '2.1.0',
        vnp_Command: 'pay',
        vnp_TmnCode: tmnCode,
        vnp_Locale: 'vn',
        vnp_CurrCode: 'VND',
        vnp_TxnRef: orderId,
        vnp_OrderInfo: `Thanh toan don hang ${orderId}`,
        vnp_OrderType: 'other',
        vnp_Amount: amount * 100, // VNPay yêu cầu nhân 100
        vnp_ReturnUrl: returnUrl,
        vnp_IpAddr: ipAddr,
        vnp_CreateDate: createDate
    };

    vnp_Params = sortObject(vnp_Params);

    const signData = qs.stringify(vnp_Params, { encode: true });
    const hmac = crypto.createHmac('sha512', secretKey);
    const signed = hmac.update(Buffer.from(signData, 'utf-8')).digest('hex');

    vnp_Params['vnp_SecureHash'] = signed;
    const paymentUrl = vnpUrl + '?' + qs.stringify(vnp_Params, { encode: true });

    return paymentUrl;
}

