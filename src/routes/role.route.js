import express from 'express';
import { getAllRoles, getRoleById, createRole, updateRole, addRolePermission } from "../controllers/role.controller.js";
import { auth } from "../middlewares/authentication.js";

const router = express.Router();

router.get('/', getAllRoles);
router.post('/', auth, createRole);
router.get('/:id', auth, getRoleById);
router.put('/:id', auth, updateRole);
router.put('/add-role-permission/:id', auth, addRolePermission);

export const roleRoute = router;