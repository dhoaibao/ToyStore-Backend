import express from 'express';
import { getAllProductsInformation, getProductInformationById, createProductInformation, updateProductInformation, deleteProductInformation } from "../controllers/productInfo.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllProductsInformation);
router.post('/', authentication, createProductInformation);
router.get('/:id', getProductInformationById);
router.put('/:id', authentication, updateProductInformation);
router.delete('/:id', authentication, deleteProductInformation);

export const productInfoRoute = router;