/*
  Warnings:

  - You are about to drop the column `imageId` on the `product_images` table. All the data in the column will be lost.
  - Added the required column `uploadImageId` to the `product_images` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "product_images" DROP CONSTRAINT "product_images_imageId_fkey";

-- AlterTable
ALTER TABLE "product_images" DROP COLUMN "imageId",
ADD COLUMN     "uploadImageId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;
