import express from 'express';
import { create, findAll, remove } from "../controllers/user.controller.js";

const userRoutes = express.Router();

userRoutes.route('/')
    .get(findAll)
    .post(create)
    .delete(remove);


export default userRoutes;