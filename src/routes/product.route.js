import express from 'express';
import { getAllProducts, getProductBySlug, createProduct, updateProduct, deleteProduct } from "../controllers/product.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', auth, getAllProducts);
router.post('/', upload.array("images", 10), auth, createProduct);
router.get('/:slug', auth, getProductBySlug);
router.put('/:id', upload.array("images", 10), auth, updateProduct);
router.delete('/:id', auth, deleteProduct);

export default router;