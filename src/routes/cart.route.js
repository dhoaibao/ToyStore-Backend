import express from 'express';
import { addToCart, getCartByUser, updateCartItem, removeFromCart } from "../controllers/cart.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.post('/', auth, addToCart);
router.get('/', auth, getCartByUser);
router.put('/', auth, updateCartItem);
router.delete('/:id', auth, removeFromCart);

export const cartRoute = router;