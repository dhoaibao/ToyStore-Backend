/*
  Warnings:

  - Added the required column `orderDate` to the `orders` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "orders" ADD COLUMN     "orderDate" TIMESTAMP(3) NOT NULL;
