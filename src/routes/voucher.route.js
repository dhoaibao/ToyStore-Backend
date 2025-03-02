import express from 'express';
import { getAllVouchers, getVoucherByUser, getVoucherById, createVoucher, updateVoucher, deleteVoucher, collectVoucher } from "../controllers/voucher.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllVouchers);
router.get('/by-user', authentication, getVoucherByUser);
router.get('/:id', authentication, getVoucherById);
router.post('/', authentication, createVoucher);
router.post('/collect/:id', authentication, collectVoucher);
router.put('/:id', authentication, updateVoucher);
router.delete('/:id', authentication, deleteVoucher);

export const voucherRoute = router;