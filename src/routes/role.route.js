import express from 'express';
import { getAllRoles, getRoleById, createRole, updateRole } from "../controllers/role.controller.js";
import { authentication, authorization } from "../middlewares/auth.js";

const router = express.Router();

router.get('/', getAllRoles);
router.post('/', authentication, authorization, createRole);
router.get('/:id', authentication, getRoleById);
router.put('/:id', authentication, authorization, updateRole);

export const roleRoute = router;