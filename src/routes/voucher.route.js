import express from 'express';
import { getAllVouchers, getVoucherByUser, getVoucherById, createVoucher, updateVoucher, deleteVoucher } from "../controllers/voucher.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllVouchers);
router.get('/by-user', auth, getVoucherByUser);
router.get('/:id', auth, getVoucherById);
router.post('/', auth, createVoucher);
router.put('/:id', auth, updateVoucher);
router.delete('/:id', auth, deleteVoucher);

export const voucherRoute = router;