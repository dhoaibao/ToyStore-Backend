/*
  Warnings:

  - You are about to drop the `product_info_details` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "product_info_details" DROP CONSTRAINT "product_info_details_productId_fkey";

-- DropForeignKey
ALTER TABLE "product_info_details" DROP CONSTRAINT "product_info_details_productInfoId_fkey";

-- DropTable
DROP TABLE "product_info_details";

-- CreateTable
CREATE TABLE "product_info_values" (
    "value" TEXT NOT NULL,
    "productInfoId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_info_values_pkey" PRIMARY KEY ("productInfoId","productId")
);

-- AddForeignKey
ALTER TABLE "product_info_values" ADD CONSTRAINT "product_info_values_productInfoId_fkey" FOREIGN KEY ("productInfoId") REFERENCES "product_informations"("productInfoId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_info_values" ADD CONSTRAINT "product_info_values_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
