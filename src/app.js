import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import logger from 'morgan';
import ApiError from './middlewares/api-error.js';
import {
    authRoute, userRoute, addressRoute, brandRoute, categoryRoute,
    productInfoRoute, productInfoValueRoute, productRoute, cartRoute,
    discountRoute
} from './routes/index.js';

const app = express();

app.use(cors({
    origin: '*', // Allow all origins
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    preflightContinue: false,
    optionsSuccessStatus: 204,
}));
app.use(express.json());
app.use(logger('dev'));

dotenv.config();
const API_VERSION = process.env.API_VERSION || 'v1';

app.use(`/api/${API_VERSION}/auth`, authRoute);
app.use(`/api/${API_VERSION}/user`, userRoute);
app.use(`/api/${API_VERSION}/address`, addressRoute);
app.use(`/api/${API_VERSION}/brand`, brandRoute);
app.use(`/api/${API_VERSION}/category`, categoryRoute);
app.use(`/api/${API_VERSION}/product-information`, productInfoRoute);
app.use(`/api/${API_VERSION}/product-information-value`, productInfoValueRoute);
app.use(`/api/${API_VERSION}/product`, productRoute);
app.use(`/api/${API_VERSION}/cart`, cartRoute);
app.use(`/api/${API_VERSION}/discount`, discountRoute);

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