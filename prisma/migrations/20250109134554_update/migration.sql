/*
  Warnings:

  - The primary key for the `product_info_values` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "product_info_values" DROP CONSTRAINT "product_info_values_pkey",
ADD CONSTRAINT "product_info_values_pkey" PRIMARY KEY ("productId", "productInfoId");
