import app from './src/app.js';
import config from './src/config/index.js';
import dbConnection from './src/config/dbConnection.js';

async function startServer() {
    try {
        await dbConnection.migrate.latest();
        console.log('Database migrated successfully!');

        const PORT = config.app.port;
        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Error starting server: ', error);
    }
}

startServer();