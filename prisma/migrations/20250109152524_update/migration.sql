/*
  Warnings:

  - You are about to drop the column `productId` on the `product_image_embeddings` table. All the data in the column will be lost.
  - You are about to drop the column `uploadImageId` on the `product_image_embeddings` table. All the data in the column will be lost.
  - Added the required column `product_id` to the `product_image_embeddings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `upload_image_id` to the `product_image_embeddings` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "product_image_embeddings" DROP CONSTRAINT "product_image_embeddings_productId_fkey";

-- DropForeignKey
ALTER TABLE "product_image_embeddings" DROP CONSTRAINT "product_image_embeddings_uploadImageId_fkey";

-- AlterTable
ALTER TABLE "product_image_embeddings" DROP COLUMN "productId",
DROP COLUMN "uploadImageId",
ADD COLUMN     "product_id" INTEGER NOT NULL,
ADD COLUMN     "upload_image_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "product_image_embeddings" ADD CONSTRAINT "product_image_embeddings_upload_image_id_fkey" FOREIGN KEY ("upload_image_id") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image_embeddings" ADD CONSTRAINT "product_image_embeddings_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
