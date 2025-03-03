import express from 'express';
import { getAllProductsInformation, getProductInformationById, createProductInformation, updateProductInformation, deleteProductInformation } from "../controllers/productInfo.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllProductsInformation);
router.get('/:id', getProductInformationById);
router.post('/', authentication, authorization, createProductInformation);
router.put('/:id', authentication, authorization, updateProductInformation);
router.delete('/:id', authentication, deleteProductInformation);

export const productInfoRoute = router;