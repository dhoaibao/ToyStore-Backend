import { createClient } from 'redis';

const client = createClient({
    socket: {
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
