import express from 'express';
import { signUp, signIn, verifyEmail, resendOtp, refreshToken, resetPassword, verifyResetPassword, signInWithGoogle, signOut } from "../controllers/auth.controller.js";

const router = express.Router();

router.post('/sign-up', signUp);
router.post('/sign-in', signIn);
router.post('/verify-email', verifyEmail);
router.post('/resend-otp', resendOtp);
router.post('/refresh-token', refreshToken);
router.post('/reset-password', resetPassword);
router.post('/verify-reset-password', verifyResetPassword);
router.post('/sign-in-with-google', signInWithGoogle);
router.post('/sign-out', signOut);

export const authRoute = router;