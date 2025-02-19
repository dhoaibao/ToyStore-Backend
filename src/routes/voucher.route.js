import express from 'express';
import { getAllVouchers, getVoucherByUser, getVoucherById, createVoucher, updateVoucher, deleteVoucher, collectVoucher } from "../controllers/voucher.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', getAllVouchers);
router.get('/by-user', auth, getVoucherByUser);
router.get('/:id', auth, getVoucherById);
router.post('/', auth, createVoucher);
router.post('/collect/:id', auth, collectVoucher);
router.put('/:id', auth, updateVoucher);
router.delete('/:id', auth, deleteVoucher);

export const voucherRoute = router;