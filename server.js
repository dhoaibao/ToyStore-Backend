import app from './src/app.js';
import dotenv from 'dotenv';
import dbConnection from './src/config/dbConnection.js';

dotenv.config();

async function startServer() {
    try {
        await dbConnection.migrate.latest();
        console.log('Database migrated successfully!');

        const PORT = process.env.PORT || 3000;
        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Error starting server: ', error);
    }
}

startServer();