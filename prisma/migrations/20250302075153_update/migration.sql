/*
  Warnings:

  - Added the required column `isActive` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `categories` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "categories" ADD COLUMN     "isActive" BOOLEAN NOT NULL;
