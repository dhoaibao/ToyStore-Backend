/*
  Warnings:

  - You are about to drop the column `productId` on the `product_informations` table. All the data in the column will be lost.
  - You are about to drop the column `productInfoValue` on the `product_informations` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "product_informations" DROP CONSTRAINT "product_informations_productId_fkey";

-- AlterTable
ALTER TABLE "product_informations" DROP COLUMN "productId",
DROP COLUMN "productInfoValue";

-- CreateTable
CREATE TABLE "product_info_details" (
    "value" TEXT NOT NULL,
    "productInfoId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_info_details_pkey" PRIMARY KEY ("productInfoId","productId")
);

-- AddForeignKey
ALTER TABLE "product_info_details" ADD CONSTRAINT "product_info_details_productInfoId_fkey" FOREIGN KEY ("productInfoId") REFERENCES "product_informations"("productInfoId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_info_details" ADD CONSTRAINT "product_info_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
