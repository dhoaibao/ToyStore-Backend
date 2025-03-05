/*
  Warnings:

  - The primary key for the `conversations` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `conversationId` on the `conversations` table. All the data in the column will be lost.
  - You are about to drop the column `text` on the `conversations` table. All the data in the column will be lost.
  - Added the required column `content` to the `conversations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "conversations" DROP CONSTRAINT "conversations_pkey",
DROP COLUMN "conversationId",
DROP COLUMN "text",
ADD COLUMN     "content" TEXT NOT NULL,
ADD COLUMN     "messageId" SERIAL NOT NULL,
ADD CONSTRAINT "conversations_pkey" PRIMARY KEY ("messageId");
