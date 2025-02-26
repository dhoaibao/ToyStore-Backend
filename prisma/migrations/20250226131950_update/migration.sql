/*
  Warnings:

  - You are about to drop the column `imageId` on the `banners` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `brands` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `imageId` on the `conversations` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `newses` table. All the data in the column will be lost.
  - You are about to drop the column `publishedAt` on the `newses` table. All the data in the column will be lost.
  - You are about to drop the column `discountedPrice` on the `order_details` table. All the data in the column will be lost.
  - You are about to drop the column `orderStatusId` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `permissions` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `permissions` table. All the data in the column will be lost.
  - You are about to drop the column `productEmbeddingId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `visible` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `roles` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `roles` table. All the data in the column will be lost.
  - You are about to drop the column `shopLogoId` on the `system_configurations` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the `_product_promotion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `blog_images` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_images` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[uploadImageId]` on the table `banners` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[categoryThumbnailId]` on the table `categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uploadImageId]` on the table `conversations` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[orderAddressId]` on the table `orders` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[upload_image_id]` on the table `product_image_embeddings` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[promotionThumbnailId]` on the table `promotions` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uploadImageId]` on the table `system_configurations` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[avatarId]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `uploadImageId` to the `banners` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uploadImageId` to the `conversations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `newses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `totalDiscount` to the `order_details` table without a default value. This is not possible if the table is not empty.
  - Made the column `orderAddressId` on table `orders` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `isActive` to the `products` table without a default value. This is not possible if the table is not empty.
  - Made the column `brandId` on table `products` required. This step will fail if there are existing NULL values in that column.
  - Made the column `categoryId` on table `products` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `uploadImageId` to the `system_configurations` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_product_promotion" DROP CONSTRAINT "_product_promotion_A_fkey";

-- DropForeignKey
ALTER TABLE "_product_promotion" DROP CONSTRAINT "_product_promotion_B_fkey";

-- DropForeignKey
ALTER TABLE "banners" DROP CONSTRAINT "banners_imageId_fkey";

-- DropForeignKey
ALTER TABLE "blog_images" DROP CONSTRAINT "blog_images_imageId_fkey";

-- DropForeignKey
ALTER TABLE "blog_images" DROP CONSTRAINT "blog_images_newsId_fkey";

-- DropForeignKey
ALTER TABLE "conversations" DROP CONSTRAINT "conversations_imageId_fkey";

-- DropForeignKey
ALTER TABLE "order_addresses" DROP CONSTRAINT "order_addresses_orderId_fkey";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_orderStatusId_fkey";

-- DropForeignKey
ALTER TABLE "product_images" DROP CONSTRAINT "product_images_productId_fkey";

-- DropForeignKey
ALTER TABLE "product_images" DROP CONSTRAINT "product_images_uploadImageId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_brandId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "system_configurations" DROP CONSTRAINT "system_configurations_shopLogoId_fkey";

-- DropIndex
DROP INDEX "newses_slug_key";

-- AlterTable
ALTER TABLE "banners" DROP COLUMN "imageId",
ADD COLUMN     "uploadImageId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "brands" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "categories" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "conversations" DROP COLUMN "imageId",
ADD COLUMN     "uploadImageId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "newses" DROP COLUMN "published",
DROP COLUMN "publishedAt",
ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "order_addresses" ALTER COLUMN "orderId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "order_details" DROP COLUMN "discountedPrice",
ADD COLUMN     "totalDiscount" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "orders" DROP COLUMN "orderStatusId",
DROP COLUMN "updatedAt",
ALTER COLUMN "orderAddressId" SET NOT NULL;

-- AlterTable
ALTER TABLE "permissions" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "products" DROP COLUMN "productEmbeddingId",
DROP COLUMN "visible",
ADD COLUMN     "isActive" BOOLEAN NOT NULL,
ADD COLUMN     "promotionId" INTEGER,
ALTER COLUMN "brandId" SET NOT NULL,
ALTER COLUMN "categoryId" SET NOT NULL;

-- AlterTable
ALTER TABLE "reviews" DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "roles" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "system_configurations" DROP COLUMN "shopLogoId",
ADD COLUMN     "uploadImageId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "upload_images" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "bannerId" INTEGER,
ADD COLUMN     "categoryId" INTEGER,
ADD COLUMN     "conversationId" INTEGER,
ADD COLUMN     "productId" INTEGER,
ADD COLUMN     "productImageEmbeddingId" INTEGER,
ADD COLUMN     "promotionId" INTEGER,
ADD COLUMN     "systemConfigId" INTEGER,
ADD COLUMN     "userId" INTEGER;

-- DropTable
DROP TABLE "_product_promotion";

-- DropTable
DROP TABLE "blog_images";

-- DropTable
DROP TABLE "product_images";

-- CreateTable
CREATE TABLE "order_trackings" (
    "time" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "orderId" INTEGER NOT NULL,
    "orderStatusId" INTEGER NOT NULL,

    CONSTRAINT "order_trackings_pkey" PRIMARY KEY ("orderId","orderStatusId")
);

-- CreateIndex
CREATE UNIQUE INDEX "banners_uploadImageId_key" ON "banners"("uploadImageId");

-- CreateIndex
CREATE UNIQUE INDEX "categories_categoryThumbnailId_key" ON "categories"("categoryThumbnailId");

-- CreateIndex
CREATE UNIQUE INDEX "conversations_uploadImageId_key" ON "conversations"("uploadImageId");

-- CreateIndex
CREATE UNIQUE INDEX "orders_orderAddressId_key" ON "orders"("orderAddressId");

-- CreateIndex
CREATE UNIQUE INDEX "product_image_embeddings_upload_image_id_key" ON "product_image_embeddings"("upload_image_id");

-- CreateIndex
CREATE UNIQUE INDEX "promotions_promotionThumbnailId_key" ON "promotions"("promotionThumbnailId");

-- CreateIndex
CREATE UNIQUE INDEX "system_configurations_uploadImageId_key" ON "system_configurations"("uploadImageId");

-- CreateIndex
CREATE UNIQUE INDEX "users_avatarId_key" ON "users"("avatarId");

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upload_images" ADD CONSTRAINT "upload_images_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "banners" ADD CONSTRAINT "banners_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "system_configurations" ADD CONSTRAINT "system_configurations_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("brandId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("categoryId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES "promotions"("promotionId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_orderAddressId_fkey" FOREIGN KEY ("orderAddressId") REFERENCES "order_addresses"("orderAddressId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_trackings" ADD CONSTRAINT "order_trackings_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "orders"("orderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_trackings" ADD CONSTRAINT "order_trackings_orderStatusId_fkey" FOREIGN KEY ("orderStatusId") REFERENCES "order_statuses"("orderStatusId") ON DELETE RESTRICT ON UPDATE CASCADE;
