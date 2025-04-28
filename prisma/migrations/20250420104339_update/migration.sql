/*
  Warnings:

  - A unique constraint covering the columns `[upload_image_id]` on the table `newses` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `upload_image_id` to the `newses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "newses" ADD COLUMN     "upload_image_id" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "newses_upload_image_id_key" ON "newses"("upload_image_id");

-- AddForeignKey
ALTER TABLE "newses" ADD CONSTRAINT "newses_upload_image_id_fkey" FOREIGN KEY ("upload_image_id") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;
