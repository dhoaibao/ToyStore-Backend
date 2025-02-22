import express from 'express';
import { getAllProductsInformation, getProductInformationById, createProductInformation, updateProductInformation, deleteProductInformation } from "../controllers/productInfo.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', getAllProductsInformation);
router.post('/', auth, createProductInformation);
router.get('/:id', getProductInformationById);
router.put('/:id', auth, updateProductInformation);
router.delete('/:id', auth, deleteProductInformation);

export const productInfoRoute = router;