import express from 'express';
import cors from 'cors';
import logger from 'morgan';
import {
    authRoute, userRoute, addressRoute, brandRoute, categoryRoute,
    productInfoRoute, productInfoValueRoute, productRoute, cartRoute,
    promotionRoute, orderRoute, orderStatusRoute, voucherRoute
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
app.use(`/api/${API_VERSION}/promotion`, promotionRoute);
app.use(`/api/${API_VERSION}/order`, orderRoute);
app.use(`/api/${API_VERSION}/order-status`, orderStatusRoute);
app.use(`/api/${API_VERSION}/voucher`, voucherRoute);

app.get("/", (_, res) => {
    res.json({ message: "Server is running!" });
});

app.use((_, res) => {
    res.status(404).json({
        status: 404,
        message: 'Route Not Found',
    });
});

app.use((err, _, res, __) => {
    const { status = 500, message = 'Internal Server Error' } = err;
    res.status(status).json({
        status,
        message,
    });
});

export default app;