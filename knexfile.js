import dotenv from 'dotenv';

dotenv.config();

export default {
    development: {
        client: 'pg',
        connection: {
            host: process.env.PGHOST,
            user: process.env.PGUSER,
            password: process.env.PGPASSWORD,
            database: process.env.PGDATABASE,
            ssl: { rejectUnauthorized: false }
        },
    },
    migrations: {
        tableName: 'knex_migrations',
    },
}