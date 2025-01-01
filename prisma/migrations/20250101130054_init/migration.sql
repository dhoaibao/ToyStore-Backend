/*
  Warnings:

  - You are about to drop the column `birtdDay` on the `users` table. All the data in the column will be lost.
  - Added the required column `birthDay` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "users" DROP COLUMN "birtdDay",
ADD COLUMN     "birthDay" TIMESTAMP(3) NOT NULL;
