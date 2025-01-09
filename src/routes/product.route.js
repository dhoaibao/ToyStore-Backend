import express from 'express';
import { getAllProducts, getProductById, createProduct, updateProduct, deleteProduct } from "../controllers/product.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', auth, getAllProducts);
router.post('/', upload.array("images", 10), auth, createProduct);
router.get('/:id', auth, getProductById);
router.put('/:id', upload.array("images", 10), auth, updateProduct);
router.delete('/:id', auth, deleteProduct);

export default router;