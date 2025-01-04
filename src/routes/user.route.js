import express from 'express';
import {
    getLoggedInUser, getAllUsers, getUserById, updateUser, deleteUser, changePassword
} from "../controllers/user.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/me', auth, getLoggedInUser);
router.get('/', auth, getAllUsers);
router.get('/:userId', auth, getUserById);
router.put('/change-password', auth, changePassword);
router.put('/:userId', auth, updateUser);
router.delete('/:userId', auth, deleteUser);

export default router;