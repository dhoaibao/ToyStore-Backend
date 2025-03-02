import express from 'express';
import { getAllProducts, getProductBySlug, createProduct, updateProduct, deleteProduct, imageSearch } from "../controllers/product.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllProducts);
router.post('/', upload.array("newImages", 10), authentication, authorization, createProduct);
router.post('/image-search', upload.single("file"), imageSearch);
router.get('/:slug', getProductBySlug);
router.put('/:id', upload.array("newImages", 10), authentication, authorization, updateProduct);
router.delete('/:id', authentication, authorization, deleteProduct);

export const productRoute = router;