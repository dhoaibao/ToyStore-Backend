import express from 'express';
import { getAllNews, getNewsBySlug, createNews, updateNews, deleteNews } from "../controllers/news.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/', getAllNews);
router.get('/:slug', authentication, getNewsBySlug);
router.post('/', authentication, upload.single("file"), createNews);
router.put('/:id', authentication, upload.single("file"), updateNews);
router.delete('/:id', authentication, deleteNews);

export const newsRoute = router;