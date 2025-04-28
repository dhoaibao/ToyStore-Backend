import express from 'express';
import { getRecommendations, getTrendingProducts } from "../controllers/recommendation.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', authentication, getRecommendations);
router.get('/trending', getTrendingProducts);

export const recommendationRoute = router;