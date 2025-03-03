import express from 'express';
import { getAllCategories, getCategoryById, createCategory, updateCategory, deleteCategory } from "../controllers/category.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllCategories);
router.get('/:id', authentication, getCategoryById);
router.post('/', authentication, authorization, upload.single("file"), createCategory);
router.put('/:id', authentication, authorization, upload.single("file"), updateCategory);
router.delete('/:id', authentication, deleteCategory);

export const categoryRoute = router;