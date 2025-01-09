/*
  Warnings:

  - The primary key for the `product_informations` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `productInforId` on the `product_informations` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "product_informations" DROP CONSTRAINT "product_informations_pkey",
DROP COLUMN "productInforId",
ADD COLUMN     "productInfoId" SERIAL NOT NULL,
ADD CONSTRAINT "product_informations_pkey" PRIMARY KEY ("productInfoId");
