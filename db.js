// db.js
import Knex from "knex";
import knexConfig from "./knexfile.js";
import { Model } from "objection";

const knex = Knex(knexConfig.development);

// Liên kết Knex với Objection.js
Model.knex(knex);

export default knex;