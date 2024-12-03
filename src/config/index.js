const config = {
    app: {
        port: process.env.PORT || 3000,
    },
    knex: {
        client: 'pg',
        connection: {
            host: process.env.PGHOST,
            user: process.env.PGUSER,
            password: process.env.PGPASSWORD,
            database: process.env.PGDATABASE,
        },
    }
};

export default config;