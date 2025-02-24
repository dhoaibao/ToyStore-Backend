import dotenv from 'dotenv';
dotenv.config();

const config = {
    app: {
        port: process.env.PORT || 3000,
    },
    supabase: {
        url: process.env.SUPABASE_URL,
        key: process.env.SUPABASE_KEY
    },
    redis: {
        username: process.env.REDIS_USERNAME,
        password: process.env.REDIS_PASSWORD,
        socket: {
            host: process.env.REDIS_HOST,
            port: process.env.REDIS_PORT,
            reconnectStrategy: 100,
        }
    },
};

export default config;