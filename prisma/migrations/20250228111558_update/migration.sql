/*
  Warnings:

  - You are about to drop the column `totalDiscount` on the `order_details` table. All the data in the column will be lost.
  - Added the required column `discountedPrice` to the `order_details` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "order_details" DROP COLUMN "totalDiscount",
ADD COLUMN     "discountedPrice" DOUBLE PRECISION NOT NULL;
