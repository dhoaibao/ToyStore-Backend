import express from 'express';
import { signUp } from "../controllers/auth.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.post('/signup', signUp);


export default router;