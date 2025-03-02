/*
  Warnings:

  - Added the required column `type` to the `product_informations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product_informations" ADD COLUMN     "options" TEXT[],
ADD COLUMN     "type" TEXT NOT NULL;
