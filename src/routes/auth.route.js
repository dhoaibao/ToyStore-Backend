import express from 'express';
import { signUp, signIn, verifyEmail, resendOtp } from "../controllers/auth.controller.js";

const router = express.Router();

router.post('/sign-up', signUp);
router.post('/sign-in', signIn);
router.post('/verify-email', verifyEmail);
router.post('/resend-otp', resendOtp);

export default router;