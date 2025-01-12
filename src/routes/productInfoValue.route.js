import express from 'express';
import { getAllProductInfoValues, getProductInfoValueById, createProductInfoValue, updateProductInfoValue, deleteProductInfoValue } from "../controllers/productInfoValue.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', getAllProductInfoValues);
router.post('/', auth, createProductInfoValue);
router.get('/:productId/:productInfoId', getProductInfoValueById);
router.put('/:productId/:productInfoId', auth, updateProductInfoValue);
router.delete('/:productId/:productInfoId', auth, deleteProductInfoValue);

export default router;