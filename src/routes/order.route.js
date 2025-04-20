import express from 'express';
import { createOrder, getAllOrders, getOrderByUser, getOrderById, cancelOrder, updateOrderStatus, vnpayReturn } from "../controllers/order.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', authentication, getAllOrders);
router.get('/by-user', authentication, getOrderByUser);
router.get('/payment/vnpay_return', vnpayReturn);
router.get('/:id', authentication, getOrderById);
router.post('/', authentication, authorization, createOrder);
router.put('/:id', authentication, authorization, updateOrderStatus);
router.put('/cancel/:id', authentication, authorization, cancelOrder);

export const orderRoute = router;