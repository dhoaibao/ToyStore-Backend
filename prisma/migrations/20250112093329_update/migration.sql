/*
  Warnings:

  - You are about to drop the column `productId` on the `product_embeddings` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[product_id]` on the table `product_embeddings` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `product_id` to the `product_embeddings` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "product_embeddings" DROP CONSTRAINT "product_embeddings_productId_fkey";

-- DropIndex
DROP INDEX "product_embeddings_productId_key";

-- AlterTable
ALTER TABLE "product_embeddings" DROP COLUMN "productId",
ADD COLUMN     "product_id" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "product_embeddings_product_id_key" ON "product_embeddings"("product_id");

-- AddForeignKey
ALTER TABLE "product_embeddings" ADD CONSTRAINT "product_embeddings_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
