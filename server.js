import app from './src/app.js';
import config from './src/config/index.js';
import db from './db.js';

async function startServer() {
    try {
        await db.migrate.latest();
        console.log('Database migrated successfully!');
        app.listen(config.app.port, () => {
            console.log(`Server is running on port ${config.app.port}`);
        });
    } catch (error) {
        console.error('Error starting server: ', error);
    }
}

startServer();