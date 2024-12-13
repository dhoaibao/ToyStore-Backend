import express from 'express';
import cors from 'cors';
import logger from 'morgan';
import ApiError from './middlewares/api-error.js';
import authRoutes from './routes/auth.route.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(logger('dev'));

app.use('/api/auth', authRoutes);

app.get("/", (req, res) => {
    res.json({message: "Server is running!"});
});

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