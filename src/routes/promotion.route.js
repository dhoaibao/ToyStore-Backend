import express from 'express';
import { getAllPromotions, getPromotionById, createPromotion, updatePromotion, deletePromotion } from "../controllers/promotion.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllPromotions);
router.get('/:id', getPromotionById);
router.post('/', authentication, authorization, upload.single("file"), createPromotion);
router.put('/:id', authentication, authorization, upload.single("file"), updatePromotion);
router.delete('/:id', authentication, deletePromotion);

export const promotionRoute = router;