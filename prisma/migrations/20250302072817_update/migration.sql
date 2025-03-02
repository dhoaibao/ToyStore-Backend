/*
  Warnings:

  - You are about to drop the column `price` on the `products` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "products" DROP COLUMN "price";

-- AlterTable
ALTER TABLE "upload_images" ADD COLUMN     "reviewId" INTEGER;

-- CreateTable
CREATE TABLE "price_histories" (
    "priceHistoryId" SERIAL NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "productId" INTEGER NOT NULL,

    CONSTRAINT "price_histories_pkey" PRIMARY KEY ("priceHistoryId")
);

-- AddForeignKey
ALTER TABLE "upload_images" ADD CONSTRAINT "upload_images_reviewId_fkey" FOREIGN KEY ("reviewId") REFERENCES "reviews"("reviewId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "price_histories" ADD CONSTRAINT "price_histories_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
