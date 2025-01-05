/*
  Warnings:

  - You are about to drop the column `fileName` on the `upload_images` table. All the data in the column will be lost.
  - You are about to drop the column `path` on the `upload_images` table. All the data in the column will be lost.
  - Added the required column `publicId` to the `upload_images` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `upload_images` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "upload_images" DROP COLUMN "fileName",
DROP COLUMN "path",
ADD COLUMN     "publicId" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;
