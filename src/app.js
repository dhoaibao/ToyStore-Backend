import express from "express";
import cors from "cors";
import logger from "morgan";
import { Server } from "socket.io";
import http from "http";
import { setData, getData, deleteData } from "./utils/redis.js";
import { uploadFile } from "./utils/supabaseStorage.js";
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
  statisticRoute,
} from "./routes/index.js";
import prisma from "./config/prismaClient.js";

const app = express();
const httpServer = http.createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: "*",
  },
});

io.on("connection", (socket) => {
  const { userId } = socket.handshake.query;
  if (userId !== undefined) {
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
    "sendMessageByClient",
    async ({ senderId, content, time, senderName, email, avatar, files }) => {
      console.log("send message by client")
      const images = await Promise.all(
        files.map(async (file) => {
          const { url, filePath } = await uploadFile(file);
          return { url, filePath };
        }),
      );
      const message = await prisma.message.create({
        data: {
          senderId,
          content,
          time,
        },
      });

      if (images.length > 0) {
        await prisma.uploadImage.createMany({
          data: images.map(({ url, filePath }) => ({
            messageId: message.messageId,
            url,
            filePath,
          })),
        });
      }

      io.to("toystore").emit("newMessage", {
        senderId,
        content,
        isRead: false,
        senderName,
        email,
        avatar,
        uploadImages:
          images.length > 0
            ? images.map(({ url }) => ({
                url,
              }))
            : [],
        time,
      });
    },
  );

  socket.on("sendMessageByStore", async ({ senderId, receiverId, content, time, files }) => {
    console.log("send message by store")
    const images = await Promise.all(
      files.map(async (file) => {
        const { url, filePath } = await uploadFile(file);
        return { url, filePath };
      }),
    );
    
    const message = await prisma.message.create({
      data: {
        senderId,
        receiverId,
        content,
        time,
      },
    });
    
    if (images.length > 0) {
      await prisma.uploadImage.createMany({
        data: images.map(({ url, filePath }) => ({
          messageId: message.messageId,
          url,
          filePath,
        })),
      });
    }
    
    const socketId = await getData(`user-${receiverId}`);
    io.to(socketId).emit("newMessage", {
      senderId,
      content,
      isRead: false,
      time,
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
