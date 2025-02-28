/*
  Warnings:

  - You are about to drop the column `orderId` on the `order_addresses` table. All the data in the column will be lost.
  - You are about to drop the column `uploadImageId` on the `system_configurations` table. All the data in the column will be lost.
  - You are about to drop the column `bannerId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `conversationId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `productImageEmbeddingId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `promotionId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `systemConfigId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `cartId` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[logoId]` on the table `system_configurations` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `logoId` to the `system_configurations` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "system_configurations" DROP CONSTRAINT "system_configurations_uploadImageId_fkey";

-- DropIndex
DROP INDEX "order_addresses_orderId_key";

-- DropIndex
DROP INDEX "system_configurations_uploadImageId_key";

-- AlterTable
ALTER TABLE "order_addresses" DROP COLUMN "orderId";

-- AlterTable
ALTER TABLE "system_configurations" DROP COLUMN "uploadImageId",
ADD COLUMN     "logoId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "upload_images" DROP COLUMN "bannerId",
DROP COLUMN "categoryId",
DROP COLUMN "conversationId",
DROP COLUMN "productImageEmbeddingId",
DROP COLUMN "promotionId",
DROP COLUMN "systemConfigId",
DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "cartId";

-- CreateIndex
CREATE UNIQUE INDEX "system_configurations_logoId_key" ON "system_configurations"("logoId");

-- AddForeignKey
ALTER TABLE "system_configurations" ADD CONSTRAINT "system_configurations_logoId_fkey" FOREIGN KEY ("logoId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;
