import express from 'express';
import { addToCart, getCartByUser, updateCartItem, removeFromCart } from "../controllers/cart.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.post('/', authentication, addToCart);
router.get('/', authentication, getCartByUser);
router.put('/', authentication, updateCartItem);
router.delete('/:id', authentication, removeFromCart);

export const cartRoute = router;