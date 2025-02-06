/*
  Warnings:

  - Changed the type of `wardCode` on the `addresses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `districtId` on the `addresses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `provinceId` on the `addresses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "addresses" DROP COLUMN "wardCode",
ADD COLUMN     "wardCode" INTEGER NOT NULL,
DROP COLUMN "districtId",
ADD COLUMN     "districtId" INTEGER NOT NULL,
DROP COLUMN "provinceId",
ADD COLUMN     "provinceId" INTEGER NOT NULL;
