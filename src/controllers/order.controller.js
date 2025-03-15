import prisma from "../config/prismaClient.js";
import getCurrentPrice from "../utils/getCurrentPrice.js";

const include = {
  orderTrackings: {
    select: {
      orderStatus: true,
      time: true,
    },
  },
  user: {
    select: {
      fullName: true,
    },
  },
  orderAddress: true,
  paymentMethod: true,
  orderDetails: {
    select: {
      orderDetailId: true,
      quantity: true,
      price: true,
      discountedPrice: true,
      product: {
        select: {
          productId: true,
          productName: true,
          slug: true,
          productImages: {
            select: {
              url: true,
            },
          },
        },
      },
    },
  },
};

export const getAllOrders = async (req, res) => {
  try {
    const {
      page = 1,
      limit = 10,
      orderStatus,
      paymentStatus,
      startDate,
      endDate,
      keyword = "",
      sort = "",
      order = "",
    } = req.query;
    const skip = (page - 1) * limit;
    const take = parseInt(limit);

    const filters = {};

    if (orderStatus) {
      filters.orderTrackings = {
        some: {
          orderStatus: {
            statusName: orderStatus,
          },
        },
      };
    }

    if (startDate && endDate) {
      filters.createdAt = {
        gte: new Date(`${startDate}T00:00:00.000Z`),
        lte: new Date(`${endDate}T23:59:59.999Z`),
      };
    }

    if (paymentStatus) {
      filters.paymentStatus = paymentStatus === "true";
    }

    if (keyword) {
      if (/[a-zA-Z]/.test(keyword)) {
        filters.user = {
          fullName: {
            contains: keyword,
            mode: "insensitive",
          },
        };
      } else {
        filters.orderId = parseInt(keyword);
      }
    }

    const sortOrder = {};

    if (sort && order) {
      sortOrder[sort] = order;
    } else {
      sortOrder.updatedAt = "desc";
    }

    const [orders, totalOrders] = await Promise.all([
      prisma.order.findMany({
        skip: skip,
        take: take,
        where: filters,
        orderBy: sortOrder,
        include,
      }),

      prisma.order.count({
        where: filters,
      }),
    ]);

    let filteredOrders = orders;
    let filteredTotalOrders = totalOrders;

    if (orderStatus) {
      filteredOrders = orders.filter((order) => {
        const lastOrderTracking =
          order.orderTrackings[order.orderTrackings.length - 1];
        return lastOrderTracking.orderStatus.statusName === orderStatus;
      });
      filteredTotalOrders = filteredOrders.length;
    }

    return res.status(200).json({
      message: "All orders fetched!",
      data: filteredOrders,
      pagination: {
        total: filteredTotalOrders,
        page: parseInt(page),
        limit: take,
        totalPages: Math.ceil(filteredTotalOrders / take),
      },
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const getOrderByUser = async (req, res) => {
  try {
    const userId = req.userId;
    const {
      page = 1,
      limit = 10,
      orderStatus,
      orderId,
      startDate,
      endDate,
    } = req.query;
    const skip = (page - 1) * limit;
    const take = parseInt(limit);

    const filters = {};

    filters.userId = userId;

    if (orderStatus && orderStatus !== "all") {
      filters.orderTrackings = {
        some: {
          orderStatus: {
            statusName: orderStatus,
          },
        },
      };
    }
    if (startDate && endDate) {
      filters.createdAt = {
        gte: new Date(`${startDate}T00:00:00.000Z`),
        lte: new Date(`${endDate}T23:59:59.999Z`),
      };
    }

    if (orderId) {
      filters.orderId = parseInt(orderId);
    }

    const [orders, totalOrders] = await Promise.all([
      prisma.order.findMany({
        skip: orderId ? undefined : skip,
        take: orderId ? undefined : take,
        where: filters,
        orderBy: {
          updatedAt: "desc",
        },
        include,
      }),

      prisma.order.count({
        where: filters,
      }),
    ]);

    let filteredOrders = orders;
    let filteredTotalOrders = totalOrders;

    if (orderStatus && orderStatus !== "all") {
      filteredOrders = orders.filter((order) => {
        const lastOrderTracking =
          order.orderTrackings[order.orderTrackings.length - 1];
        return lastOrderTracking.orderStatus.statusName === orderStatus;
      });
      filteredTotalOrders = filteredOrders.length;
    }

    return res.status(200).json({
      message: "Order fetched!",
      data: filteredOrders,
      pagination: {
        total: filteredTotalOrders,
        page: parseInt(page),
        limit: take,
        totalPages: Math.ceil(filteredTotalOrders / take),
      },
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const getOrderById = async (req, res) => {
  try {
    const { id } = req.params;

    const order = await prisma.order.findUnique({
      where: { orderId: parseInt(id) },
      include,
    });

    if (!order) {
      return res.status(404).json({ message: "Order not found!" });
    }

    return res.status(200).json({
      message: "Order fetched!",
      data: order,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const createOrder = async (req, res) => {
  try {
    const userId = req.userId;
    const {
      totalPrice,
      totalDiscount,
      shippingFee,
      finalPrice,
      paymentMethodId,
      paymentStatus = false,
      orderItems,
      cartId,
      addressString,
      contactName,
      contactPhone,
      voucherId,
    } = req.body;

    if (
      !totalPrice ||
      !shippingFee ||
      !finalPrice ||
      !paymentMethodId ||
      !orderItems ||
      !addressString ||
      !contactName ||
      !contactPhone
    ) {
      return res.status(400).json({ message: "Missing required fields!" });
    }

    const result = await prisma.$transaction(async (tx) => {
      const order = await tx.order.create({
        data: {
          totalPrice,
          totalDiscount,
          shippingFee,
          finalPrice,
          paymentStatus,
          user: {
            connect: {
              userId,
            },
          },
          paymentMethod: {
            connect: {
              paymentMethodId,
            },
          },
          // voucherId,
          orderAddress: {
            create: {
              address: addressString,
              contactName,
              contactPhone,
            },
          },
        },
      });

      await tx.orderTracking.create({
        data: {
          orderStatusId: 1,
          orderId: order.orderId,
        },
      });

      const orderDetails = orderItems.map((item) => ({
        price: getCurrentPrice(item.product.prices),
        discountedPrice: item.product.discountedPrice || 0,
        quantity: item.quantity,
        orderId: order.orderId,
        productId: item.product.productId,
      }));

      await tx.orderDetail.createMany({ data: orderDetails });

      await Promise.all(
        orderItems.map(async (item) => {
          await tx.product.update({
            where: {
              productId: item.product.productId,
            },
            data: {
              soldNumber: {
                increment: item.quantity,
              },
            },
          });
        }),
      );

      let updateData = paymentStatus ? { paidDate: new Date() } : {};

      const updatedOrder = await tx.order.update({
        where: { orderId: order.orderId },
        data: updateData,
        include,
      });

      await tx.cartDetail.deleteMany({
        where: {
          cartId,
          productId: { in: orderItems.map((item) => item.product.productId) },
        },
      });

      if (voucherId) {
        await tx.voucher.update({
          where: { voucherId },
          data: {
            currentUsedQuantity: {
              increment: 1,
            },
          },
        });
      }

      return updatedOrder;
    });

    return res.status(200).json({
      message: "Order created!",
      data: result,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const cancelOrder = async (req, res) => {
  try {
    const { id } = req.params;

    const existingOrder = await prisma.order.findUnique({
      where: { orderId: parseInt(id) },
      include: {
        orderTrackings: true,
      },
    });

    if (!existingOrder) {
      return res.status(404).json({ message: "Order not found!" });
    }

    await prisma.orderTracking.create({
      data: {
        orderStatusId: 5,
        orderId: existingOrder.orderId,
      },
    });

    return res.status(200).json({
      message: "Order cancelled!",
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const updateOrderStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { orderStatusId } = req.body;

    const existingOrder = await prisma.order.findUnique({
      where: { orderId: parseInt(id) },
    });

    if (!existingOrder) {
      return res.status(404).json({ message: "Order not found!" });
    }

    const existingTracking = await prisma.orderTracking.findUnique({
      where: {
        orderId_orderStatusId: {
          orderId: existingOrder.orderId,
          orderStatusId: parseInt(orderStatusId),
        },
      },
    });

    if (!existingTracking) {
      await prisma.orderTracking.create({
        data: {
          orderStatusId: parseInt(orderStatusId),
          orderId: existingOrder.orderId,
        },
      });
    }

    if (parseInt(orderStatusId) === 4) {
      await prisma.order.update({
        where: { orderId: existingOrder.orderId },
        data: {
          paymentStatus: true,
          paidDate: new Date(),
        },
      });
    }

    return res.status(200).json({
      message: "Order status updated!",
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};
