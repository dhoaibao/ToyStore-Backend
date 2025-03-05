import express from 'express';
import { getAllReviews, getReviewById, createReview, deleteReview } from "../controllers/review.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllReviews);
router.get('/:id', authentication, getReviewById);
router.post('/', authentication, authorization, upload.array('images', 5), createReview);
router.delete('/:id', authentication, deleteReview);

export const reviewRoute = router;