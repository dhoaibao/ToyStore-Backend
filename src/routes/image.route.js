import express from 'express';
import { uploadSingleImage, uploadMultipleImages, getAllImages, getImageById } from "../controllers/image.controller.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.post('/single', upload.single("file"), uploadSingleImage);
router.post('/multiple', upload.array("files", 10), uploadMultipleImages);
router.get('/', getAllImages);
router.get('/:id', getImageById);

export default router;