import express from 'express';
import { createOrder, getAllOrders, getOrderByUser, getOrderById } from "../controllers/order.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllOrders);
router.get('/by-user', auth, getOrderByUser);
router.get('/:id', auth, getOrderById);
router.post('/', auth, createOrder);

export const orderRoute = router;