import express from 'express';
import { getAllPermissions, getPermissionById, createPermission, updatePermission } from "../controllers/permission.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', getAllPermissions);
router.post('/', auth, createPermission);
router.get('/:id', auth, getPermissionById);
router.put('/:id', auth, updatePermission);

export const permissionRoute = router;