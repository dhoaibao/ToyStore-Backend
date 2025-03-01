import express from 'express';
import { getAllProducts, getProductBySlug, createProduct, updateProduct, deleteProduct, imageSearch } from "../controllers/product.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllProducts);
router.post('/', upload.array("newImages", 10), auth, createProduct);
router.post('/image-search', upload.single("file"), imageSearch);
router.get('/:slug', getProductBySlug);
router.put('/:id', upload.array("newImages", 10), auth, updateProduct);
router.delete('/:id', auth, deleteProduct);

export const productRoute = router;