import express from 'express';
import { getAllBrands, getBrandById, createBrand, updateBrand, deleteBrand } from "../controllers/brand.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllBrands);
router.get('/:id', authentication, getBrandById);
router.post('/', authentication, authorization, createBrand);
router.put('/:id', authentication, authorization, updateBrand);
router.delete('/:id', authentication, deleteBrand);

export const brandRoute = router;