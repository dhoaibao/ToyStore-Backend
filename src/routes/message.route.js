import express from 'express';
import { getMessages, getConversations, getUnreadCount } from "../controllers/message.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/conversations', authentication, getConversations);
router.get('/:id', authentication, getMessages);
router.get('/unread/:id', authentication, getUnreadCount);  

export const messageRoute = router;