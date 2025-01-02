import express from 'express';
import { getLoggedInUser, getAllUsers } from "../controllers/user.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/me', auth, getLoggedInUser);
router.get('/', auth, getAllUsers);

export default router;