/*
  Warnings:

  - You are about to drop the column `promotionId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `discountType` on the `promotions` table. All the data in the column will be lost.
  - You are about to drop the column `discountValue` on the `promotions` table. All the data in the column will be lost.
  - You are about to drop the column `endDate` on the `promotions` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `promotions` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_promotionId_fkey";

-- AlterTable
ALTER TABLE "products" DROP COLUMN "promotionId";

-- AlterTable
ALTER TABLE "promotions" DROP COLUMN "discountType",
DROP COLUMN "discountValue",
DROP COLUMN "endDate",
DROP COLUMN "startDate";

-- CreateTable
CREATE TABLE "promotion_values" (
    "discountType" TEXT NOT NULL,
    "discountValue" DOUBLE PRECISION NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "promotionId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "promotion_values_pkey" PRIMARY KEY ("promotionId","productId")
);

-- AddForeignKey
ALTER TABLE "promotion_values" ADD CONSTRAINT "promotion_values_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES "promotions"("promotionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promotion_values" ADD CONSTRAINT "promotion_values_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
