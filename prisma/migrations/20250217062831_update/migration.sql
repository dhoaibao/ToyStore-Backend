/*
  Warnings:

  - Added the required column `filePath` to the `upload_images` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "upload_images" ADD COLUMN     "filePath" TEXT NOT NULL;
