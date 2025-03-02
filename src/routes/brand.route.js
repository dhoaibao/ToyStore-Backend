import express from 'express';
import { getAllBrands, getBrandById, createBrand, updateBrand, deleteBrand } from "../controllers/brand.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllBrands);
router.post('/', authentication, authorization, createBrand);
router.get('/:id', authentication, getBrandById);
router.put('/:id', authentication, authorization, updateBrand);
router.delete('/:id', authentication, authorization, deleteBrand);

export const brandRoute = router;