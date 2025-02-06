/*
  Warnings:

  - You are about to drop the column `districtCode` on the `addresses` table. All the data in the column will be lost.
  - You are about to drop the column `provinceCode` on the `addresses` table. All the data in the column will be lost.
  - You are about to drop the column `discountPrice` on the `order_details` table. All the data in the column will be lost.
  - Added the required column `districtId` to the `addresses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `provinceId` to the `addresses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `discountedPrice` to the `order_details` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "addresses" DROP COLUMN "districtCode",
DROP COLUMN "provinceCode",
ADD COLUMN     "districtId" TEXT NOT NULL,
ADD COLUMN     "provinceId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "order_details" DROP COLUMN "discountPrice",
ADD COLUMN     "discountedPrice" DOUBLE PRECISION NOT NULL;
