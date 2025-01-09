import express from 'express';
import { getAllCategories, getCategoryById, createCategory, updateCategory, deleteCategory } from "../controllers/category.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllCategories);
router.post('/', auth, createCategory);
router.get('/:id', auth, getCategoryById);
router.put('/:id', auth, updateCategory);
router.delete('/:id', auth, deleteCategory);

export default router;