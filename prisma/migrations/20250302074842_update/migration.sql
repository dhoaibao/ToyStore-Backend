/*
  Warnings:

  - Added the required column `isActive` to the `product_informations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product_informations" ADD COLUMN     "isActive" BOOLEAN NOT NULL;
