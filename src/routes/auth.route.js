import express from 'express';
import { signUp, signIn, signOut, verifyEmail, resendOtp } from "../controllers/auth.controller.js";
import { auth } from '../middlewares/authentication.js';

const router = express.Router();

router.post('/sign-up', signUp);
router.post('/sign-in', signIn);
router.post('/verify-email', verifyEmail);
router.post('/resend-otp', resendOtp);
router.post('/sign-out',auth, signOut);

export default router;