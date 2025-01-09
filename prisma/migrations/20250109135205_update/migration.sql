/*
  Warnings:

  - A unique constraint covering the columns `[productId,cartId]` on the table `cart_details` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[orderId,productId]` on the table `order_details` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[productId,productInfoId]` on the table `product_info_values` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "cart_details_productId_cartId_key" ON "cart_details"("productId", "cartId");

-- CreateIndex
CREATE UNIQUE INDEX "order_details_orderId_productId_key" ON "order_details"("orderId", "productId");

-- CreateIndex
CREATE UNIQUE INDEX "product_info_values_productId_productInfoId_key" ON "product_info_values"("productId", "productInfoId");
