import app from './src/app.js';
import config from './src/config/index.js';

async function startServer() {
    try {
        const PORT = config.app.port;
        app.listen(PORT, '0.0.0.0', () => {
            console.log(`Server is running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Error starting server: ', error);
    }
}

startServer();