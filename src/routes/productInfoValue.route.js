import express from 'express';
import { getAllProductInfoValues, getProductInfoValueById, createProductInfoValue, updateProductInfoValue, deleteProductInfoValue } from "../controllers/productInfoValue.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllProductInfoValues);
router.post('/', auth, createProductInfoValue);
router.get('/:productId/:productInfoId', auth, getProductInfoValueById);
router.put('/:productId/:productInfoId', auth, updateProductInfoValue);
router.delete('/:productId/:productInfoId', auth, deleteProductInfoValue);

export default router;