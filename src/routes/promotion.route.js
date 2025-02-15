import express from 'express';
import { getAllPromotions, getPromotionById, createPromotion, updatePromotion, deletePromotion } from "../controllers/promotion.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllPromotions);
router.post('/', auth, upload.single("file"), createPromotion);
router.get('/:id', getPromotionById);
router.put('/:id', auth, upload.single("file"), updatePromotion);
router.delete('/:id', auth, deletePromotion);

export const promotionRoute = router;