import express from 'express';
import { getAllBrands, getBrandById, createBrand, updateBrand, deleteBrand } from "../controllers/brand.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', getAllBrands);
router.post('/', auth, createBrand);
router.get('/:id', auth, getBrandById);
router.put('/:id', auth, updateBrand);
router.delete('/:id', auth, deleteBrand);

export default router;