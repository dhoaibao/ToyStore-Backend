/*
  Warnings:

  - Made the column `soldNumber` on table `products` required. This step will fail if there are existing NULL values in that column.
  - Made the column `avgRating` on table `products` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "products" ALTER COLUMN "soldNumber" SET NOT NULL,
ALTER COLUMN "soldNumber" SET DEFAULT 0,
ALTER COLUMN "avgRating" SET NOT NULL,
ALTER COLUMN "avgRating" SET DEFAULT 0;
