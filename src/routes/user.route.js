import express from 'express';
import {
    getLoggedInUser, getAllUsers, getUserById, updateUser, deleteUser, changePassword
} from "../controllers/user.controller.js";
import { auth } from "../middlewares/authentication.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/me', auth, getLoggedInUser);
router.get('/', auth, getAllUsers);
router.get('/:id', auth, getUserById);
router.put('/change-password', auth, changePassword);
router.put('/:id', upload.single("avatar"), auth, updateUser);
router.delete('/:id', auth, deleteUser);

export const userRoute = router;