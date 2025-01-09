import express from 'express';
import { getAllProductInformations, getProductInformationById, createProductInformation, updateProductInformation, deleteProductInformation } from "../controllers/productInfo.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllProductInformations);
router.post('/', auth, createProductInformation);
router.get('/:id', auth, getProductInformationById);
router.put('/:id', auth, updateProductInformation);
router.delete('/:id', auth, deleteProductInformation);

export default router;