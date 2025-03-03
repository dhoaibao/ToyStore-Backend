import express from 'express';
import { createOrder, getAllOrders, getOrderByUser, getOrderById, cancelOrder, updateOrderStatus } from "../controllers/order.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', authentication, getAllOrders);
router.get('/by-user', authentication, authorization, getOrderByUser);
router.get('/:id', authentication, getOrderById);
router.post('/', authentication, authorization, createOrder);
router.put('/:id', authentication, authorization, updateOrderStatus);
router.put('/cancel/:id', authentication, authorization, cancelOrder);

export const orderRoute = router;