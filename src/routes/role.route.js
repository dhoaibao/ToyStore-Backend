import express from 'express';
import { getAllRoles, getRoleById, createRole, updateRole, addRolePermission } from "../controllers/role.controller.js";
import { authentication } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllRoles);
router.post('/', authentication, createRole);
router.get('/:id', authentication, getRoleById);
router.put('/:id', authentication, updateRole);
router.put('/add-role-permission/:id', authentication, addRolePermission);

export const roleRoute = router;