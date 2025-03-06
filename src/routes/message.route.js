import express from 'express';
import { getMessages, markAsRead, getUnreadCount } from "../controllers/message.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/:id', authentication, getMessages);
router.get('/unread/:id', authentication, getUnreadCount);  
router.put('/:id', authentication, markAsRead);

export const messageRoute = router;