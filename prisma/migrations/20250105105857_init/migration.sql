/*
  Warnings:

  - You are about to drop the column `districtId` on the `addresses` table. All the data in the column will be lost.
  - You are about to drop the column `provinceId` on the `addresses` table. All the data in the column will be lost.
  - Added the required column `districtCode` to the `addresses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `provinceCode` to the `addresses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "addresses" DROP COLUMN "districtId",
DROP COLUMN "provinceId",
ADD COLUMN     "districtCode" TEXT NOT NULL,
ADD COLUMN     "provinceCode" TEXT NOT NULL;
