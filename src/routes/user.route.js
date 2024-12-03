import express from 'express';
import { create, findAll } from "../controllers/user.controller.js";

const userRoutes = express.Router();

userRoutes.route('/')
    .get(findAll)
    .post(create);


export default userRoutes;