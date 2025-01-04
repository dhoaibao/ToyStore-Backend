import { createClient } from 'redis';

const client = createClient();

client.on('error', (err) => {
    console.error('Redis client error:', err);
});

client.connect().catch((err) => {
    console.error('Error connecting to Redis:', err);
});

export const saveData = async (key, time, value) => {
    try {
        await client.setEx(key, parseInt(time), value);
        console.log('Data saved for:', key);
    } catch (err) {
        console.error('Error saving data:', err);
    }
};

export const getData = async (key) => {
    try {
        const value = await client.get(key);
        console.log('Data fetched:', value);
        return value;
    } catch (err) {
        console.error('Error fetching data:', err);
        return null;
    }
}

export const verifyData = async (key, value) => {
    try {
        const storedValue = await client.get(key);
        console.log('Stored value:', storedValue);
        if (storedValue === value) {
            console.log('Data verified successfully!');
            return true;
        } else {
            console.log('Invalid data');
            return false;
        }
    } catch (err) {
        console.error('Error verifying data:', err);
        return false;
    }
};

export const saveUser = async (user) => {
    try {
        const userKey = `user:${user.email}`; // Sử dụng ID làm khóa
        await client.hSet(userKey, {
            fullName: user.fullName,
            email: user.email,
            password: user.password,
            birthday: user.birthday.toISOString(), // Chuyển ngày tháng sang chuỗi
        });

        // Đặt thời gian hết hạn (nếu cần, ví dụ 1 ngày)
        await client.expire(userKey, 86400);
    } catch (err) {
        console.error('Error verifying OTP:', err);
        return false;
    }
};

export const getUser = async (userEmail) => {
    const userKey = `user:${userEmail}`;

    // Kiểm tra nếu người dùng tồn tại trong Redis
    const userExists = await client.exists(userKey);
    if (!userExists) {
        console.log('User not found in Redis');
        return null;
    }

    // Lấy thông tin người dùng
    const user = await client.hGetAll(userKey);
    console.log('User from Redis:', user);
    return user;
}