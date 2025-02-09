import express from 'express'
import { getAllOrderStatuses } from '../controllers/orderStatus.controller.js'

const router = express.Router();

router.get('/', getAllOrderStatuses);

export const orderStatusRoute = router;