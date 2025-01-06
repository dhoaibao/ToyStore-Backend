/*
  Warnings:

  - Added the required column `addressName` to the `addresses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "addresses" ADD COLUMN     "addressName" TEXT NOT NULL;
