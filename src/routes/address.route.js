import express from 'express';
import { getAddressByUser, getAllAddresses, getAddressById, createAddress, updateAddress, deleteAddress} from "../controllers/address.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/user', authentication, getAddressByUser);
router.get('/', authentication, getAllAddresses);
router.post('/', authentication, createAddress);
router.get('/:id', authentication, getAddressById);
router.put('/:id', authentication, updateAddress);
router.delete('/:id', authentication, deleteAddress);

export const addressRoute = router;