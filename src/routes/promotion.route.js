import express from 'express';
import { getAllPromotions, getPromotionById, createPromotion, updatePromotion, deletePromotion } from "../controllers/promotion.controller.js";
import { authentication } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllPromotions);
router.post('/', authentication, upload.single("file"), createPromotion);
router.get('/:id', getPromotionById);
router.put('/:id', authentication, upload.single("file"), updatePromotion);
router.delete('/:id', authentication, deletePromotion);

export const promotionRoute = router;