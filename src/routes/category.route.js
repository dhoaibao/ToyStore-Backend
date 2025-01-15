import express from 'express';
import { getAllCategories, getCategoryById, createCategory, updateCategory, deleteCategory } from "../controllers/category.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllCategories);
router.post('/', auth, upload.single("file"), createCategory);
router.get('/:id', auth, getCategoryById);
router.put('/:id', auth, upload.single("file"), updateCategory);
router.delete('/:id', auth, deleteCategory);

export default router;