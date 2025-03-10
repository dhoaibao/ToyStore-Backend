import prisma from "../config/prismaClient.js";
import moment from "moment";

export const getStatistics = async (req, res) => {
  try {
    const { start, end, type } = req.query;

    if (!start || !end || !type) {
      return res.status(400).json({ message: "Missing required fields!" });
    }

    let startDate = null;
    let endDate = null;
    if (type === "quarter") {
      // Handle "2024-Q1" format
      const [year, quarter] = start.split("-Q");
      startDate = moment(`${year}-${(quarter - 1) * 3 + 1}-01`)
        .startOf("month")
        .toDate();

      const [endYear, endQuarter] = end.split("-Q");
      endDate = moment(`${endYear}-${endQuarter * 3}-01`)
        .endOf("month")
        .toDate();
    } else {
      startDate = moment(start).startOf(type).toDate();
      endDate = moment(end).endOf(type).toDate();
    }

    const totalProducts = await prisma.product.count({
      where: {
        createdAt: {
          gte: startDate,
          lte: endDate,
        },
      },
    });

    const totalUsers = await prisma.user.count({
      where: {
        createdAt: {
          gte: startDate,
          lte: endDate,
        },
      },
    });

    const orders = await prisma.order.findMany({
      where: {
        createdAt: {
          gte: startDate,
          lte: endDate,
        },
      },
      select: {
        finalPrice: true,
      },
    });

    let groupedRevenues = {};
    let groupedOrders = {};
    let now = moment(startDate);

    while (now <= moment(endDate)) {
      const key = now.format(
        type === "day"
          ? "YYYY-MM-DD"
          : type === "month"
            ? "YYYY-MM"
            : type === "quarter"
              ? "YYYY-[Q]Q"
              : "YYYY",
      );

      const periodStart = now.clone().startOf(type);
      const periodEnd = now.clone().endOf(type);

      const periodRevenues = orders.filter((order) => {
        const orderDate = moment(order.createdAt);
        return orderDate >= periodStart && orderDate <= periodEnd;
      });

      groupedRevenues[key] = periodRevenues.reduce(
        (acc, order) => acc + order.finalPrice,
        0,
      );

      groupedOrders[key] = periodRevenues.length;

      if (type === "quarter") {
        now.add(3, "month");
      } else {
        now.add(1, type);
      }
    }

    const parsedRevenues = Object.entries(groupedRevenues).map(
      ([date, value]) => ({
        date,
        value,
      }),
    );

    const parsedOrders = Object.entries(groupedOrders).map(([date, value]) => ({
      date,
      value,
    }));

    const totalRevenue = orders.reduce(
      (acc, order) => acc + order.finalPrice,
      0,
    );

    const totalOrders = orders.length;

    return res.status(200).json({
      message: "Statistics fetched successfully!",
      data: {
        revenues: parsedRevenues,
        orders: parsedOrders,
        totalRevenue,
        totalOrders,
        totalProducts,
        totalUsers,
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

export const getProducts = async (req, res) => {
  try {
    const { option } = req.query;
    let products;
    if (option === "brand") {
      products = await prisma.product.groupBy({
        by: ["brandId"],
        _count: true,
      });
    } else if (option === "category") {
      products = await prisma.product.groupBy({
        by: ["categoryId"],
        _count: true,
      });
    } else {
      return res.status(400).json({
        message: "Invalid option!",
      });
    }

    const result = await Promise.all(
      products.map(async (product) => {
        const data = {};
        if (product.brandId) {
          const brand = await prisma.brand.findUnique({
            where: { brandId: product.brandId },
            select: {
              brandName: true,
            },
          });
          data.brand = brand.brandName;
        }

        if (product.categoryId) {
          const category = await prisma.category.findUnique({
            where: { categoryId: product.categoryId },
            select: {
              categoryName: true,
            },
          });
          data.category = category.categoryName;
        }

        data.count = product._count;

        return data;
      }),
    );

    return res.status(200).json({
      message: "Products fetched successfully!",
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
