import express from 'express';
import cors from 'cors';
import logger from 'morgan';
import ApiError from './middlewares/api-error.js';
import userRoutes from './routes/user.route.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(logger('dev'));

app.get('/check', (_, res) => {
    res.status(200).json({
        status: 'OK',
    });
});

app.use('/api/users', userRoutes);

app.use((_, __, next) => {
    next(new ApiError(404, 'Not Found'));
});

app.use((err, _, res, __) => {
    const { status = 500, message = 'Internal Server Error' } = err;
    res.status(status).json({
        status,
        message,
    });
});

export default app;