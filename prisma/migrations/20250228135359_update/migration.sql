/*
  Warnings:

  - Added the required column `updatedAt` to the `banners` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `brands` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `permissions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `price_filters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `product_informations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `roles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `system_configurations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "banners" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "brands" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "categories" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "permissions" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "price_filters" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "product_informations" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "roles" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "system_configurations" ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;
