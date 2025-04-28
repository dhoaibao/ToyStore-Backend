import qs from "qs";
import crypto from "crypto";
import sortObject from "./sortObject";
import prisma from "../config/prismaClient";

const tmnCode = process.env.VNP_TMN_CODE;
const secretKey = process.env.VNP_HASH_SECRET;
const vnpUrl = process.env.VNP_URL;
const returnUrl = process.env.VNP_RETURN_URL;

export const createPaymentUrl = (ipAddr, createDate, orderId, amount) => {
  let vnp_Params = {
    vnp_Version: "2.1.0",
    vnp_Command: "pay",
    vnp_TmnCode: tmnCode,
    vnp_Locale: "vn",
    vnp_CurrCode: "VND",
    vnp_TxnRef: orderId,
    vnp_OrderInfo: `Thanh toan don hang ${orderId}`,
    vnp_OrderType: "other",
    vnp_Amount: amount * 100, // VNPay yêu cầu nhân 100
    vnp_ReturnUrl: returnUrl,
    vnp_IpAddr: ipAddr,
    vnp_CreateDate: createDate,
  };

  vnp_Params = sortObject(vnp_Params);

  const signData = qs.stringify(vnp_Params, { encode: false });
  const hmac = crypto.createHmac("sha512", secretKey);
  const signed = hmac.update(Buffer.from(signData, "utf-8")).digest("hex");

  vnp_Params["vnp_SecureHash"] = signed;
  const paymentUrl = vnpUrl + "?" + qs.stringify(vnp_Params, { encode: false });

  return paymentUrl;
};

export const handlePaymentReturn = async (vnp_Params) => {
  const orderId = parseInt(vnp_Params["vnp_TxnRef"]);
  const secureHash = vnp_Params["vnp_SecureHash"];
  delete vnp_Params["vnp_SecureHash"];
  delete vnp_Params["vnp_SecureHashType"];

  vnp_Params = sortObject(vnp_Params);

  const signData = qs.stringify(vnp_Params, { encode: false });
  const hmac = crypto.createHmac("sha512", secretKey);
  const signed = hmac.update(Buffer.from(signData, "utf-8")).digest("hex");

  if (secureHash !== signed) {
    return {
      success: false,
      message: "Invalid Sign",
      vnp_Code: 97,
    };
  }

  const vnp_RspCode = vnp_Params["vnp_ResponseCode"];

  if (vnp_RspCode !== "00") {
    return {
      success: false,
      message: `Thanh toán thất bại, mã lỗi vnpay ${vnp_RspCode}`,
    };
  }

  await prisma.order.update({
    where: { orderId },
    data: { paymentStatus: true, paidDate: new Date() },
  });

  return {
    success: true,
    vnp_Code: vnp_RspCode,
    message: "Thanh toán thành công",
  };
};
