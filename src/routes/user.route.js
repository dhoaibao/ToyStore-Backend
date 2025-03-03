import express from 'express';
import {
    getLoggedInUser, getAllUsers, getUserById, updateUser, deleteUser, changePassword,
    createUser
} from "../controllers/user.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";
import upload from '../middlewares/multer.js';

const router = express.Router();

router.get('/me', authentication, getLoggedInUser);
router.get('/', authentication, getAllUsers);
router.get('/:id', authentication, getUserById);
router.post('/', upload.single('avatar'), authentication, authorization, createUser);
router.put('/change-password', authentication, authorization, changePassword);
router.put('/:id', upload.single("avatar"), authentication, authorization, updateUser);
router.delete('/:id', authentication, deleteUser);

export const userRoute = router;