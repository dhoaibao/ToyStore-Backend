import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import logger from 'morgan';
import ApiError from './middlewares/api-error.js';
import { authRoute, userRoute, imageRoute, addressRoute } from './routes/index.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(logger('dev'));

dotenv.config();
const API_VERSION = process.env.API_VERSION || 'v1';

app.use(`/api/${API_VERSION}/auth`, authRoute);
app.use(`/api/${API_VERSION}/user`, userRoute);
app.use(`/api/${API_VERSION}/image`, imageRoute);
app.use(`/api/${API_VERSION}/address`, addressRoute);

app.get("/", (req, res) => {
    res.json({ message: "Server is running!" });
});

app.use((_, __, next) => {
    next(new ApiError(404, 'Not Found Route!'));
});

app.use((err, _, res, __) => {
    const { status = 500, message = 'Internal Server Error' } = err;
    res.status(status).json({
        status,
        message,
    });
});

export default app;