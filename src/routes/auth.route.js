import express from 'express';
import { signUp, signIn, getLoggedInUser } from "../controllers/auth.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.post('/sign-up', signUp);
router.post('/sign-in', signIn);
router.get('/me', auth, getLoggedInUser);

export default router;