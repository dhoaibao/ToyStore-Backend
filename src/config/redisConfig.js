import { createClient } from 'redis';

const client = createClient({
    // username: process.env.REDIS_USERNAME,
    // password: process.env.REDIS_PASSWORD,
    socket: {
        // host: process.env.REDIS_HOST,
        // port: process.env.REDIS_PORT,
        host: '127.0.0.1',
        port: 6379,
        reconnectStrategy: 100,
    }
});

client.on('error', (err) => {
    console.error('Redis client error:', err);
});

(async () => {
    await client.connect();
})();

export default client;
