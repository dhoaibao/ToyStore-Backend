/*
  Warnings:

  - The primary key for the `conversations` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `conversationid` on the `conversations` table. All the data in the column will be lost.
  - You are about to drop the column `orderAdressId` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `medthod` on the `permissions` table. All the data in the column will be lost.
  - You are about to drop the column `colectedQuantity` on the `vouchers` table. All the data in the column will be lost.
  - You are about to drop the `price_fillters` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `method` to the `permissions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `collectedQuantity` to the `vouchers` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "price_fillters" DROP CONSTRAINT "price_fillters_systemConfigId_fkey";

-- AlterTable
ALTER TABLE "conversations" DROP CONSTRAINT "conversations_pkey",
DROP COLUMN "conversationid",
ADD COLUMN     "conversationId" SERIAL NOT NULL,
ADD CONSTRAINT "conversations_pkey" PRIMARY KEY ("conversationId");

-- AlterTable
ALTER TABLE "orders" DROP COLUMN "orderAdressId",
ADD COLUMN     "orderAddressId" INTEGER;

-- AlterTable
ALTER TABLE "permissions" DROP COLUMN "medthod",
ADD COLUMN     "method" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "vouchers" DROP COLUMN "colectedQuantity",
ADD COLUMN     "collectedQuantity" INTEGER NOT NULL;

-- DropTable
DROP TABLE "price_fillters";

-- CreateTable
CREATE TABLE "price_filters" (
    "priceFilterId" SERIAL NOT NULL,
    "minPrice" DOUBLE PRECISION NOT NULL,
    "maxPrice" DOUBLE PRECISION NOT NULL,
    "systemConfigId" INTEGER NOT NULL,

    CONSTRAINT "price_filters_pkey" PRIMARY KEY ("priceFilterId")
);

-- AddForeignKey
ALTER TABLE "price_filters" ADD CONSTRAINT "price_filters_systemConfigId_fkey" FOREIGN KEY ("systemConfigId") REFERENCES "system_configurations"("systemConfigId") ON DELETE RESTRICT ON UPDATE CASCADE;
