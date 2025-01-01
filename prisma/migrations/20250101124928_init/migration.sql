/*
  Warnings:

  - You are about to drop the `_PermissionToRole` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_PermissionToRole" DROP CONSTRAINT "_PermissionToRole_A_fkey";

-- DropForeignKey
ALTER TABLE "_PermissionToRole" DROP CONSTRAINT "_PermissionToRole_B_fkey";

-- DropTable
DROP TABLE "_PermissionToRole";

-- CreateTable
CREATE TABLE "_permission_roles" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_permission_roles_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_permission_roles_B_index" ON "_permission_roles"("B");

-- AddForeignKey
ALTER TABLE "_permission_roles" ADD CONSTRAINT "_permission_roles_A_fkey" FOREIGN KEY ("A") REFERENCES "permissions"("permissionId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_permission_roles" ADD CONSTRAINT "_permission_roles_B_fkey" FOREIGN KEY ("B") REFERENCES "roles"("roleId") ON DELETE CASCADE ON UPDATE CASCADE;
