import express from 'express';
import { getAllPermissions, getPermissionById, createPermission, updatePermission } from "../controllers/permission.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllPermissions);
router.post('/', authentication, authorization, createPermission);
router.get('/:id', authentication, authorization, getPermissionById);
router.put('/:id', authentication, updatePermission);

export const permissionRoute = router;