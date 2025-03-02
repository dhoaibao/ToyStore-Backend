-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_orderAddressId_fkey";

-- AlterTable
ALTER TABLE "orders" ALTER COLUMN "orderAddressId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_orderAddressId_fkey" FOREIGN KEY ("orderAddressId") REFERENCES "order_addresses"("orderAddressId") ON DELETE SET NULL ON UPDATE CASCADE;
