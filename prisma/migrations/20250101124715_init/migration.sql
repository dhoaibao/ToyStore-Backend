/*
  Warnings:

  - You are about to drop the `permission_roles` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "permission_roles" DROP CONSTRAINT "permission_roles_permissionId_fkey";

-- DropForeignKey
ALTER TABLE "permission_roles" DROP CONSTRAINT "permission_roles_roleId_fkey";

-- DropTable
DROP TABLE "permission_roles";
