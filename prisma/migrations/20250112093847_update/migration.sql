/*
  Warnings:

  - The primary key for the `product_embeddings` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `productEmbeddingId` on the `product_embeddings` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "product_embeddings" DROP CONSTRAINT "product_embeddings_pkey",
DROP COLUMN "productEmbeddingId",
ADD COLUMN     "product_embedding_id" SERIAL NOT NULL,
ADD CONSTRAINT "product_embeddings_pkey" PRIMARY KEY ("product_embedding_id");
