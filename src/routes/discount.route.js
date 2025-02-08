import express from 'express';
import { getAllDiscounts, getDiscountById, createDiscount, updateDiscount, deleteDiscount } from "../controllers/discount.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllDiscounts);
router.post('/', auth, upload.single("file"), createDiscount);
router.get('/:id', getDiscountById);
router.put('/:id', auth, upload.single("file"), updateDiscount);
router.delete('/:id', auth, deleteDiscount);

export const discountRoute = router;