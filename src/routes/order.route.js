import express from 'express';
import { createOrder, getAllOrders, getOrderByUser, getOrderById, cancelOrder, updateOrderStatus } from "../controllers/order.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllOrders);
router.get('/by-user', auth, getOrderByUser);
router.get('/:id', auth, getOrderById);
router.post('/', auth, createOrder);
router.put('/:id', auth, updateOrderStatus);
router.put('/cancel/:id', auth, cancelOrder);

export const orderRoute = router;