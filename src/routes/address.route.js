import express from 'express';
import { getAllAddreses, getAddressById, createAddress, updateAddress, deleteAddress } from "../controllers/address.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', auth, getAllAddreses);
router.post('/', auth, createAddress);
router.get('/:id', auth, getAddressById);
router.put('/:id', auth, updateAddress);
router.delete('/:id', auth, deleteAddress);

export default router;