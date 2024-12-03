import knex from "knex";
import { Model } from "objection";

const knexConfig = knex({
    client: 'pg',
    connection: {
        host: process.env.PGHOST,
        user: process.env.PGUSER,
        password: process.env.PGPASSWORD,
        database: process.env.PGDATABASE,
        ssl: { rejectUnauthorized: false }
    },
    migrations: {
        tableName: 'knex_migrations',
    },
});

Model.knex(knexConfig);

export default knexConfig;