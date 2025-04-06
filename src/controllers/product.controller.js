import prisma from "../config/prismaClient.js";
import { generateSlug } from "../utils/generateSlug.js";
import getCurrentPrice from "../utils/getCurrentPrice.js";
import { deleteFile, uploadFile } from "../utils/supabaseStorage.js";
import {
  generateImageEmbedding,
  generateTextEmbedding,
} from "../utils/generateEmbeddings.js";

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

export const getAllProducts = async (req, res) => {
  try {
    const {
      page = 1,
      limit = 10,
      productIds,
      brandNames,
      categoryNames,
      ageOption,
      priceOption,
      sort,
      order,
      keyword,
      promotion,
      isActive,
    } = req.query;
    const skip = (page - 1) * limit;
    const take = parseInt(limit);

    const filters = {};

    if (promotion) {
      filters.promotionValues = {
        some: {
          promotionId: parseInt(promotion),
        },
      };
    }

    if (isActive) {
      filters.isActive = isActive === "true";
    }

    // if (keyword) {
    //   const uniqueProductIds = await searchProducts(keyword);
    //   filters.productId = {
    //     in: uniqueProductIds,
    //   };
    // }
    //

    if (keyword) {
      filters.productName = {
        contains: keyword,
        mode: "insensitive",
      };
    }

    if (productIds) {
      filters.productId = {
        in: productIds.map((id) => parseInt(id)),
        mode: "insensitive",
      };
    }

    if (brandNames) {
      filters.brand = {
        brandName: {
          in: brandNames.split(",").map((name) => name.trim()),
          mode: "insensitive",
        },
      };
    }

    if (categoryNames) {
      filters.category = {
        categoryName: {
          in: categoryNames.split(",").map((name) => name.trim()),
          mode: "insensitive",
        },
      };
    }

    if (ageOption) {
      const [minAge, maxAge] = ageOption.includes("-")
        ? ageOption.split("-").map((age) => age)
        : [ageOption, "100"];
      filters.productInfoValues = {
        some: {
          AND: [
            {
              value: {
                gte: minAge,
                lte: maxAge,
              },
            },
            {
              productInfo: {
                productInfoName: {
                  equals: "Tuổi",
                  mode: "insensitive",
                },
              },
            },
          ],
        },
      };
    }

    if (priceOption) {
      const [minPrice, maxPrice] = priceOption.includes("-")
        ? priceOption.split("-").map((price) => parseFloat(price))
        : [parseFloat(priceOption), 100000000000];

      filters.price = {
        gte: minPrice,
        lte: maxPrice,
      };
    }

    const sortOrder = {};

    if (sort && order) {
      if (sort === "newest") {
        sortOrder.createdAt = order;
      } else if (sort === "bestseller") {
        sortOrder.soldNumber = order;
      } else if (sort === "soldNumber") {
        sortOrder.soldNumber = order === "asc" ? "desc" : "asc";
      } else {
        sortOrder[sort] = order;
      }
    } else {
      sortOrder.updatedAt = "desc";
    }

    const products = await prisma.product.findMany({
      skip,
      take,
      where: filters,
      orderBy: sortOrder,
      include,
    });

    const updatedProducts = products.map((product) => {
      const currentPrice = getCurrentPrice(product.prices);
      return {
        ...product,
        price: currentPrice,
      };
    });

    const totalProducts = await prisma.product.count({
      where: filters,
    });

    return res.status(200).json({
      message: "All products fetched!",
      data: updatedProducts,
      pagination: {
        total: totalProducts,
        page: parseInt(page),
        limit: take,
        totalPages: Math.ceil(totalProducts / take),
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

export const getProductBySlug = async (req, res) => {
  try {
    const { slug } = req.params;

    const product = await prisma.product.findUnique({
      where: { slug },
      include,
    });

    if (!product) {
      res.status(400).json({
        messgae: "Product not found!",
      });
    }

    const currentPrice = getCurrentPrice(product.prices);
    const updatedProduct = {
      ...product,
      price: currentPrice,
    };

    if (!product) {
      return res.status(404).json({ message: "Product not found!" });
    }

    return res.status(200).json({
      message: "Product fetched!",
      data: updatedProduct,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const createProduct = async (req, res) => {
  try {
    const files = req.files;

    const {
      productName,
      price,
      isActive,
      quantity,
      description,
      brandId,
      categoryId,
      productInfos,
      vat
    } = req.body;

    if (!productName || !price || !isActive || !quantity || !description || !vat) {
      return res.status(400).json({ message: "Missing required fields!" });
    }

    const existingProduct = await prisma.product.findFirst({
      where: { productName },
    });

    if (existingProduct) {
      return res.status(400).json({ message: "Product already exists!" });
    }

    const slug = generateSlug(productName);

    const images = await Promise.all(
      files.map(async (file) => {
        const { url, filePath } = await uploadFile(file);
        const formData = new FormData();
        const blob = new Blob([file.buffer], { type: file.mimetype });
        formData.append("file", blob, file.originalname);
        const embedding = await generateImageEmbedding(formData);
        return { url, filePath, embedding };
      }),
    );

    const productInfosArray = JSON.parse(productInfos);

    const result = await prisma.$transaction(
      async (tx) => {
        const product = await tx.product.create({
          data: {
            productName,
            slug,
            prices: {
              create: {
                price: parseFloat(price),
                startDate: new Date(),
              },
            },
            isActive: isActive === "true",
            quantity: parseInt(quantity),
            description,
            vat: parseFloat(vat),
            brandId: parseInt(brandId),
            categoryId: parseInt(categoryId),
            productImages: {
              createMany: {
                data: images.map(({ url, filePath }) => ({
                  url,
                  filePath,
                })),
              },
            },
            productInfoValues: {
              createMany: {
                data: productInfosArray.map((info) => ({
                  value: String(info.value),
                  productInfoId: info.productInfoId,
                })),
              },
            },
          },
          include,
        });

        const imageMap = new Map(
          images.map((image) => [image.url, image.embedding]),
        );

        await Promise.all(
          product.productImages.map(async ({ url, uploadImageId }) => {
            const imageEmbedding = imageMap.get(url);
            const embeddingString = `[${imageEmbedding.join(",")}]`;
            await tx.$executeRaw`
                  INSERT INTO product_image_embeddings (product_id, upload_image_id, embedding)
                  VALUES (${product.productId}, ${uploadImageId}, ${embeddingString}::vector)
                `;
          }),
        );

        const allProductInfo = [
          product.productName,
          product.description,
          product.brand.brandName,
          product.category.categoryName,
        ];

        await Promise.all(
          allProductInfo.map(async (item) => {
            const textEmbedding = await generateTextEmbedding(item);
            const embeddingString = `[${textEmbedding.join(",")}]`;
            await tx.$executeRaw`
                  INSERT INTO product_embeddings (product_id, embedding)
                  VALUES (${product.productId}, ${embeddingString}::vector)
                `;
          }),
        );

        return product;
      },
      {
        timeout: 20000,
      },
    );

    return res.status(201).json({
      message: "Product created!",
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

export const updateProduct = async (req, res) => {
  try {
    const { id } = req.params;

    const files = req.files;

    const {
      productName,
      price,
      startValidPrice,
      isActive,
      quantity,
      description,
      vat,
      brandId,
      categoryId,
      productInfos,
      existingImages,
    } = req.body;

    const existingProduct = await prisma.product.findUnique({
      where: { productId: parseInt(id) },
      include: { prices: true },
    });

    if (!existingProduct) {
      return res.status(404).json({ message: "Product not found!" });
    }

    if (productName) {
      const existingProductWithSameName = await prisma.product.findFirst({
        where: { productName },
      });

      if (
        existingProductWithSameName &&
        existingProductWithSameName.productId !== parseInt(id)
      ) {
        return res.status(400).json({ message: "Product already exists!" });
      }
    }

    const fields = {
      productName,
      slug: productName ? generateSlug(productName) : null,
      isActive: isActive ? isActive === "true" : null,
      quantity: quantity ? parseInt(quantity) : null,
      vat: vat ? parseInt(vat) : null,
      description,
      brandId: brandId ? parseInt(brandId) : null,
      categoryId: categoryId ? parseInt(categoryId) : null,
    };

    const data = Object.entries(fields).reduce((acc, [key, value]) => {
      if (value != null && value !== existingProduct[key]) {
        acc[key] = value;
      }
      return acc;
    }, {});

    if (
      price &&
      parseFloat(price) !==
        existingProduct.prices[existingProduct.prices.length - 1].price
    ) {
      // const endDate = new Date();
      // endDate.setDate(endDate.getDate() - 1); // Trừ 1 ngày một cách chính xác

      data.prices = {
        create: {
          price: parseFloat(price),
          startDate: new Date(),
        },
      };

      await prisma.priceHistory.updateMany({
        where: { productId: parseInt(id), endDate: null },
        data: { endDate: new Date() },
      });
    }

    const images = await Promise.all(
      files.map(async (file) => {
        const { url, filePath } = await uploadFile(file);
        const formData = new FormData();
        const blob = new Blob([file.buffer], { type: file.mimetype });
        formData.append("file", blob, file.originalname);
        const embedding = await generateImageEmbedding(formData);
        return { url, filePath, embedding };
      }),
    );

    const result = await prisma.$transaction(
      async (tx) => {
        const product = await tx.product.update({
          where: { productId: parseInt(id) },
          data,
          include,
        });

        if (productInfos) {
          const productInfosArray = JSON.parse(productInfos);

          await Promise.all(
            productInfosArray.map(async (info) => {
              await tx.productInfoValue.upsert({
                where: {
                  productId_productInfoId: {
                    productId: product.productId,
                    productInfoId: info.productInfoId,
                  },
                },
                update: { value: String(info.value) },
                create: {
                  productId: product.productId,
                  productInfoId: info.productInfoId,
                  value: info.value,
                },
              });
            }),
          );
        }

        const dbImages = product.productImages;

        if (existingImages) {
          const nonExistingImages = dbImages.filter(
            (image) => !existingImages.includes(String(image.uploadImageId)),
          );

          if (nonExistingImages.length > 0) {
            const idsToDelete = nonExistingImages.map(
              (image) => image.uploadImageId,
            );
            const filePathsToDelete = nonExistingImages.map(
              (image) => image.filePath,
            );

            await Promise.all([
              tx.productImageEmbedding.deleteMany({
                where: { uploadImageId: { in: idsToDelete } },
              }),
              tx.uploadImage.deleteMany({
                where: { uploadImageId: { in: idsToDelete } },
              }),
              ...filePathsToDelete.map((filePath) => deleteFile(filePath)),
            ]);
          }
        } else {
          await Promise.all([
            tx.productImageEmbedding.deleteMany({
              where: { productId: product.productId },
            }),
            tx.uploadImage.deleteMany({
              where: { productId: product.productId },
            }),
            dbImages.map(({ filePath }) => deleteFile(filePath)),
          ]);
        }

        if (images.length > 0) {
          const productImages = await Promise.all(
            images.map(async ({ url, filePath }) => {
              const uploadImage = await tx.uploadImage.create({
                data: {
                  url,
                  filePath,
                  productId: product.productId,
                },
              });

              return uploadImage;
            }),
          );

          const imageMap = new Map(
            images.map((image) => [image.url, image.embedding]),
          );

          await Promise.all(
            productImages.map(async ({ url, uploadImageId }) => {
              const imageEmbedding = imageMap.get(url);
              const embeddingString = `[${imageEmbedding.join(",")}]`;
              await tx.$executeRaw`
                INSERT INTO product_image_embeddings (product_id, upload_image_id, embedding)
                VALUES (${product.productId}, ${uploadImageId}, ${embeddingString}::vector)
              `;
            }),
          );
        }

        if (
          data.productName ||
          data.description ||
          data.brandId ||
          data.categoryId
        ) {
          const allProductInfo = [
            product.productName,
            product.description,
            product.brand.brandName,
            product.category.categoryName,
            product.productInfoValues.map((info) => info.value).join(" "),
          ].join(" ");

          const textEmbedding = await generateTextEmbedding(allProductInfo);

          const embeddingString = `[${textEmbedding.join(",")}]`;

          const existingEmbedding = await tx.productEmbedding.findFirst({
            where: {
              productId: product.productId,
            },
          });

          if (existingEmbedding !== embeddingString) {
            await tx.$executeRaw`
                      UPDATE product_embeddings
                      SET embedding = ${embeddingString}::vector
                      WHERE product_id = ${product.productId}
                    `;
          }
        }

        return product;
      },
      {
        timeout: 15000,
      },
    );

    return res.status(200).json({
      message: "Product updated!",
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

export const deleteProduct = async (req, res) => {
  try {
    const { id } = req.params;

    const productExists = await prisma.product.findUnique({
      where: { productId: parseInt(id) },
    });

    if (!productExists) {
      return res.status(404).json({ message: "Product not found!" });
    }

    await prisma.$transaction(async (tx) => {
      await tx.priceHistory.deleteMany({ where: { productId: parseInt(id) } });
      await tx.productImageEmbedding.deleteMany({
        where: { productId: parseInt(id) },
      });
      await tx.productEmbedding.deleteMany({
        where: { productId: parseInt(id) },
      });
      await tx.uploadImage.deleteMany({ where: { productId: parseInt(id) } });
      await tx.productInfoValue.deleteMany({
        where: { productId: parseInt(id) },
      });
      await tx.product.delete({ where: { productId: parseInt(id) } });
    });

    return res.status(200).json({ message: "Product deleted!" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const imageSearch = async (req, res) => {
  try {
    const { file } = req;

    const { url } = req.body;

    if (!file && !url) {
      return res.status(400).json({ message: "No image uploaded!" });
    }

    const formData = new FormData();
    if (file) {
      const blob = new Blob([file.buffer], { type: file.mimetype });
      formData.append("file", blob, file.originalname);
    }
    if (url) {
      formData.append("url", url);
    }

    const imageEmbedding = await generateImageEmbedding(formData);

    const imageEmbeddingString = `[${imageEmbedding.join(",")}]`;

    const productImageEmbeddings = await prisma.$queryRaw`
            SELECT product_id, embedding::text,
                   1 - (embedding <=> ${imageEmbeddingString}::vector) AS cosine_similarity
            FROM product_image_embeddings
            WHERE 1 - (embedding <=> ${imageEmbeddingString}::vector) > 0.5
            ORDER BY cosine_similarity DESC
            LIMIT 1;
        `;

    const productIds = productImageEmbeddings.map(
      (embedding) => embedding.product_id,
    );
    const uniqueProductIds = [...new Set(productIds)];

    const productsData = await prisma.product.findMany({
      where: {
        productId: {
          in: uniqueProductIds,
        },
      },
      include,
    });

    const sortedProductsData = uniqueProductIds.map((id) =>
      productsData.find((product) => product.productId === id),
    );

    return res.status(200).json({
      message: "Image search results fetched!",
      data: sortedProductsData,
      pagination: {
        total: productsData.length,
        totalPages: 1,
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

const searchProducts = async (keyword) => {
  try {
    const embedding = await generateTextEmbedding(keyword);

    const embeddingString = `[${embedding.join(",")}]`;

    const productEmbeddings = await prisma.$queryRaw`
            SELECT product_id, embedding::text,
                   1 - (embedding <=> ${embeddingString}::vector) AS cosine_similarity
            FROM product_embeddings
            WHERE 1 - (embedding <=> ${embeddingString}::vector) > 0.5
            ORDER BY cosine_similarity DESC
        `;

    const productIds = productEmbeddings.map(
      (embedding) => embedding.product_id,
    );
    const uniqueProductIds = [...new Set(productIds)];

    return uniqueProductIds;
  } catch (error) {
    console.error(error);
    return [];
  }
};
