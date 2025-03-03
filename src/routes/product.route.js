import express from 'express';
import { getAllProducts, getProductBySlug, createProduct, updateProduct, deleteProduct, imageSearch } from "../controllers/product.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllProducts);
router.get('/:slug', getProductBySlug);
router.post('/', upload.array("newImages", 10), authentication, authorization, createProduct);
router.post('/image-search', upload.single("file"), imageSearch);
router.put('/:id', upload.array("newImages", 10), authentication, authorization, updateProduct);
router.delete('/:id', authentication, deleteProduct);

export const productRoute = router;