import prisma from "../config/prismaClient";
import getUserItemMatrix from "../utils/getMatrix";

const include = {
  prices: true,
  category: {
    select: {
      categoryName: true,
      slug: true,
    },
  },
  brand: {
    select: {
      brandName: true,
    },
  },
  productInfoValues: {
    select: {
      value: true,
      productInfo: {
        select: {
          productInfoName: true,
        },
      },
    },
  },
  productImages: true,
  promotionPeriods: true,
  reviews: {
    select: {
      comment: true,
      rating: true,
      createdAt: true,
      user: {
        select: {
          fullName: true,
        },
      },
    },
  },
};

export const getTrendingProducts = async (req, res) => {
  try {
    const products = await getProducts(10);

    return res.status(200).json({
      message: "Trending products fetched!",
      data: products,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

export const getRecommendations = async (req, res) => {
  try {
    const userId = req.userId;

    const userPurchased = await prisma.order.findMany({
      where: {
        userId: userId,
      },
      select: {
        orderDetails: {
          select: {
            productId: true,
          },
        },
      },
    });

    const purchasedProductIds = new Set();
    userPurchased.forEach((order) => {
      order.orderDetails.forEach((item) => {
        purchasedProductIds.add(item.productId);
      });
    });

    const { matrix, similarityMatrix, uniqueUserIds, uniqueProductIds, type } =
      await getUserItemMatrix(userId);

    let similarities = [];
    if (type === "User-Based") {
      const userIndex = uniqueUserIds.indexOf(userId);
      if (userIndex !== -1) similarities = similarityMatrix[userIndex];
    } else if (type === 'Item-Based') {
      purchasedProductIds.forEach((id) => {
        const productIndex = uniqueProductIds.indexOf(id);
        if (productIndex !== -1) similarities.push(similarityMatrix[productIndex]);
      });
    }
    
    const sortedSimilarities = similarities
      .map((similarity, index) => ({ index, similarity }))
      .sort((a, b) => b.similarity - a.similarity);

    const products = [];
    for (let i = 0; i < sortedSimilarities.length; i++) {
      const { index, similarity } = sortedSimilarities[i];
      if (similarity > 0) {
        const userProducts = matrix[index].map((rating, productId) => ({
          productId,
          rating,
        }));
        products.push(...userProducts);
      }
    }

    const filteredProducts = products.filter((product) => product.rating > 2.5);

    const uniqueProducts = new Set();
    filteredProducts.forEach((product) => {
      uniqueProducts.add(product.productId);
    });

    const productArray = Array.from(uniqueProducts);

    const filteredProductArray = productArray.filter(
      (id) => !purchasedProductIds.has(id),
    );

    const recommendationProducts = await prisma.product.findMany({
      where: {
        productId: {
          in: filteredProductArray,
        },
      },
      include,
    });

    const addProducts = await getProducts(
      10 - recommendationProducts.length,
      filteredProductArray,
    );

    const finalProducts = [...recommendationProducts, ...addProducts];

    return res.status(200).json({
      message: "Recommendations fetched!",
      data: finalProducts,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

const getProducts = async (limit, productIds = []) => {
  const threeMonthsAgo = new Date();
  threeMonthsAgo.setMonth(threeMonthsAgo.getMonth() - 3);

  const products = await prisma.product.findMany({
    where: {
      productId: {
        notIn: productIds,
      },
      orderDetails: {
        some: {
          order: {
            createdAt: {
              gte: threeMonthsAgo,
            },
          },
        },
      },
    },
    orderBy: {
      soldNumber: "desc",
    },
    include,
  });

  return products;
};
