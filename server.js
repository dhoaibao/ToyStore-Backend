import app from './src/app.js';
import dotenv from 'dotenv';

dotenv.config();

async function startServer() {
    try {
        const PORT = process.env.PORT || 3000;
        app.listen(PORT, '0.0.0.0', () => {
            console.log(`Server is running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Error starting server: ', error);
    }
}

startServer();