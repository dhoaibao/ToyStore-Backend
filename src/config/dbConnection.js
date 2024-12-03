import knex from "knex";
import { Model } from "objection";
import config from "./index.js";

const knexConfig = knex(config.knex.development);

Model.knex(knexConfig);

export default knexConfig;