import dotenv from 'dotenv';
dotenv.config();

const config = {
    app: {
        port: process.env.PORT || 3000,
    },
    knex: {
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
};

export default config;