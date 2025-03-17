import express from "express";
import cors from "cors";
import logger from "morgan";
import { Server } from "socket.io";
import http from "http";
import { setData, getData, deleteData } from "./utils/redis.js";
import {
  authRoute,
  userRoute,
  addressRoute,
  brandRoute,
  categoryRoute,
  productInfoRoute,
  productRoute,
  cartRoute,
  reviewRoute,
  messageRoute,
  promotionRoute,
  orderRoute,
  voucherRoute,
  roleRoute,
  permissionRoute,
  statisticRoute
} from "./routes/index.js";
import prisma from "./config/prismaClient.js";
import { send } from "process";

const app = express();
const httpServer = http.createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: "*",
  },
});

io.on("connection", (socket) => {
  const { userId } = socket.handshake.query;
  if (userId !== "null") {
    setData(`user-${userId}`, null, socket.id);
    setData(`user-${userId}-online`, null, "true");
    console.log("User connected:", userId);
  }

  socket.on("joinRoom", async () => {
    socket.join("toystore");
  });

  socket.on("markAsRead", async ({ senderId, receiverId }) => {
    await prisma.message.updateMany({
      where: {
        senderId: senderId,
        receiverId: receiverId,
        isRead: false,
      },
      data: {
        isRead: true,
      },
    });

    const socketId = await getData(`user-${senderId}`);
    io.to(socketId).emit("updateStatus", senderId);
  });

  socket.on(
    "sendMessage",
    async ({ senderId, content, time, senderName, avatar }) => {
      io.to("toystore").emit("newMessage", {
        senderId,
        content,
        isRead: false,
        senderName,
        avatar,
        time,
      });
      await prisma.message.create({
        data: {
          senderId,
          content,
          time,
        },
      });
    },
  );

  socket.on("replyMessage", async ({ senderId, receiverId, content, time }) => {
    const socketId = await getData(`user-${receiverId}`);
    io.to(socketId).emit("newMessage", {
      senderId,
      content,
      isRead: false,
      time,
    });
    await prisma.message.create({
      data: {
        senderId,
        receiverId,
        content,
        time,
      },
    });
  });

  socket.on("disconnect", async () => {
    console.log("User disconnected:", userId);
    deleteData(`user-${userId}`);
    setData(`user-${userId}-online`, null, new Date());
  });
});

app.use(
  cors({
    origin: "*", // Allow all origins
    methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
    preflightContinue: false,
    optionsSuccessStatus: 204,
  }),
);
app.use(express.json());
app.use(logger("dev"));

const API_VERSION = process.env.API_VERSION || "v1";

app.use(`/api/${API_VERSION}/auth`, authRoute);
app.use(`/api/${API_VERSION}/user`, userRoute);
app.use(`/api/${API_VERSION}/address`, addressRoute);
app.use(`/api/${API_VERSION}/brand`, brandRoute);
app.use(`/api/${API_VERSION}/category`, categoryRoute);
app.use(`/api/${API_VERSION}/product-information`, productInfoRoute);
app.use(`/api/${API_VERSION}/product`, productRoute);
app.use(`/api/${API_VERSION}/cart`, cartRoute);
app.use(`/api/${API_VERSION}/promotion`, promotionRoute);
app.use(`/api/${API_VERSION}/order`, orderRoute);
app.use(`/api/${API_VERSION}/voucher`, voucherRoute);
app.use(`/api/${API_VERSION}/role`, roleRoute);
app.use(`/api/${API_VERSION}/permission`, permissionRoute);
app.use(`/api/${API_VERSION}/review`, reviewRoute);
app.use(`/api/${API_VERSION}/message`, messageRoute);
app.use(`/api/${API_VERSION}/statistic`, statisticRoute);

app.get("/", (_, res) => {
  res.json({ message: "Server is running!" });
});

app.use((_, res) => {
  res.status(404).json({
    status: 404,
    message: "Route Not Found",
  });
});

app.use((err, _, res, __) => {
  const { status = 500, message = "Internal Server Error" } = err;
  res.status(status).json({
    status,
    message,
  });
});

export default httpServer;
