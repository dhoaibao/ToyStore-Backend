import client from '../config/redisConfig.js';
import convertTimeToSeconds from './convertTimeToSeconds.js';

client.on('error', (err) => {
    console.error('Redis client error:', err);
});

client.connect().catch((err) => {
    console.error('Error connecting to Redis:', err);
});

export const setData = async (key, time, value) => {
    try {
        const ttl = time ? convertTimeToSeconds(time) : null;
        const valueToStore = typeof value === "object" ? JSON.stringify(value) : value;
        if (ttl) {
            await client.setEx(key, ttl, valueToStore);
        } else {
            await client.set(key, valueToStore);
        }

        return true;
    } catch (err) {
        console.error("Error saving data:", err);
        return false;
    }
};

export const getData = async (key) => {
    try {
        const value = await client.get(key);

        const parsedValue = (() => {
            try {
                return JSON.parse(value);
            } catch {
                return value;
            }
        })();

        return parsedValue;
    } catch (err) {
        console.error('Error fetching data:', err);
        return null;
    }
}

export const verifyData = async (key, value) => {
    try {
        const storedValue = await client.get(key);

        if (storedValue === null) {
            console.log(`No data found for key: ${key}`);
            return false;
        }

        const parsedStoredValue = (() => {
            try {
                return JSON.parse(storedValue);
            } catch {
                return storedValue;
            }
        })();

        const isVerified = typeof parsedStoredValue === "object"
            ? JSON.stringify(parsedStoredValue) === JSON.stringify(value)
            : String(parsedStoredValue) === value;

        if (isVerified) {
            console.log('Data verified successfully!');
            return true;
        } else {
            console.log('Data verification failed!');
            return false;
        }
    } catch (err) {
        console.error('Error verifying data:', err);
        return false;
    }
};