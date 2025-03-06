-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_uploadImageId_fkey";

-- AlterTable
ALTER TABLE "messages" ALTER COLUMN "uploadImageId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES "upload_images"("uploadImageId") ON DELETE SET NULL ON UPDATE CASCADE;
