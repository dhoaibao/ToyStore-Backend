/*
  Warnings:

  - You are about to drop the column `uploadImageId` on the `messages` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_uploadImageId_fkey";

-- DropIndex
DROP INDEX "messages_uploadImageId_key";

-- AlterTable
ALTER TABLE "messages" DROP COLUMN "uploadImageId";

-- AlterTable
ALTER TABLE "upload_images" ADD COLUMN     "messageId" INTEGER;

-- AddForeignKey
ALTER TABLE "upload_images" ADD CONSTRAINT "upload_images_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "messages"("messageId") ON DELETE SET NULL ON UPDATE CASCADE;
