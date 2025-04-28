import express from 'express';
import { getStatistics, getProducts } from "../controllers/statistic.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', authentication, authorization, getStatistics);
router.get('/products', authentication, authorization, getProducts);

export const statisticRoute = router;