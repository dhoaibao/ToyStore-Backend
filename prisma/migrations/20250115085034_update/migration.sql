/*
  Warnings:

  - Added the required column `categoryThumbnailId` to the `categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imageId` to the `conversations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `discountName` to the `discounts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `discountThumbnailId` to the `discounts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "categories" ADD COLUMN     "categoryThumbnailId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "conversations" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "imageId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "discounts" ADD COLUMN     "discountName" TEXT NOT NULL,
ADD COLUMN     "discountThumbnailId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_categoryThumbnailId_fkey" FOREIGN KEY ("categoryThumbnailId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "discounts" ADD CONSTRAINT "discounts_discountThumbnailId_fkey" FOREIGN KEY ("discountThumbnailId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;
