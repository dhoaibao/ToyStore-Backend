import prisma from "../config/prismaClient";
import cosineSimilarity from "./cosineSimilarity";

const getUserItemMatrix = async (userId) => {
  const reviews = await prisma.review.findMany({
    select: {
      userId: true,
      productId: true,
      rating: true,
    },
    where: {
      productId: {
        not: null,
      },
    },
  });

  const userLists = reviews.map((review) => review.userId);
  const productLists = reviews.map((review) => review.productId);

  const uniqueUserIds = [...new Set(userLists)];
  const uniqueProductIds = [...new Set(productLists)];

  const maxProductId = Math.max(...uniqueProductIds);

  const matrix = [];
  const similarityMatrix = [];
  
  const user = reviews.findIndex((review) => review.userId === userId);
  const type = user !== -1 ? 'User-Based' : 'Item-Based';

  if (type === 'User-Based') { //User-Item
    for (let i = 0; i < uniqueUserIds.length; i++) {
      matrix[i] = Array(maxProductId + 1).fill(2.5);
    }

    for (const review of reviews) {
      const userIndex = uniqueUserIds.indexOf(review.userId);
      if (userIndex !== -1) {
        matrix[userIndex][review.productId] = review.rating;
      }
    }
    
    for (let i = 0; i < uniqueUserIds.length; i++) {
      similarityMatrix[i] = new Array(uniqueUserIds.length).fill(0);
    }
  
    for (let i = 0; i < uniqueUserIds.length; i++) {
      for (let j = 0; j < uniqueUserIds.length; j++) {
        const similarity = cosineSimilarity(matrix[i], matrix[j]);
        similarityMatrix[i][j] = similarity;
        similarityMatrix[j][i] = similarity;
      }
    }
  } else if (type === 'Item-Based') { //Item-User
    for (let i = 0; i < maxProductId + 1; i++) {
      matrix[i] = Array(uniqueUserIds.length).fill(2.5);
    }

    for (const review of reviews) {
      const productIndex = uniqueProductIds.indexOf(review.productId);
      if (productIndex !== -1) {
        matrix[productIndex][uniqueUserIds.indexOf(review.userId)] =
          review.rating;
      }
    }
    
    for (let i = 0; i < uniqueProductIds.length; i++) {
      similarityMatrix[i] = new Array(uniqueProductIds.length).fill(0);
    }
  
    for (let i = 0; i < uniqueProductIds.length; i++) {
      for (let j = 0; j < uniqueProductIds.length; j++) {
        const similarity = cosineSimilarity(matrix[i], matrix[j]);
        similarityMatrix[i][j] = similarity;
        similarityMatrix[j][i] = similarity;
      }
    }
  }
  
  console.log(matrix)

  return {
    matrix,
    similarityMatrix,
    uniqueUserIds,
    uniqueProductIds,
    type
  };
};

export default getUserItemMatrix;
