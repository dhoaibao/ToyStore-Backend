-- AlterTable
ALTER TABLE "products" ADD COLUMN     "categoryId" INTEGER,
ADD COLUMN     "productEmbeddingId" INTEGER;

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "cartId" INTEGER;

-- CreateTable
CREATE TABLE "product_embeddings" (
    "productEmbeddingId" SERIAL NOT NULL,
    "embedding" VECTOR NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_embeddings_pkey" PRIMARY KEY ("productEmbeddingId")
);

-- CreateTable
CREATE TABLE "categories" (
    "categoryId" SERIAL NOT NULL,
    "categoryName" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("categoryId")
);

-- CreateTable
CREATE TABLE "reviews" (
    "reviewId" SERIAL NOT NULL,
    "comment" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "productId" INTEGER,
    "parentReviewId" INTEGER,

    CONSTRAINT "reviews_pkey" PRIMARY KEY ("reviewId")
);

-- CreateTable
CREATE TABLE "product_informations" (
    "productInforId" SERIAL NOT NULL,
    "productInfoName" TEXT NOT NULL,
    "productInfoValue" TEXT NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_informations_pkey" PRIMARY KEY ("productInforId")
);

-- CreateTable
CREATE TABLE "carts" (
    "cartId" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "carts_pkey" PRIMARY KEY ("cartId")
);

-- CreateTable
CREATE TABLE "cart_details" (
    "quantity" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "cartId" INTEGER NOT NULL,

    CONSTRAINT "cart_details_pkey" PRIMARY KEY ("productId","cartId")
);

-- CreateTable
CREATE TABLE "orders" (
    "orderId" SERIAL NOT NULL,
    "totalPrice" DOUBLE PRECISION NOT NULL,
    "totalDiscount" DOUBLE PRECISION NOT NULL,
    "shippingFee" DOUBLE PRECISION NOT NULL,
    "finalPrice" DOUBLE PRECISION NOT NULL,
    "paymentStatus" BOOLEAN NOT NULL,
    "paidDate" TIMESTAMP(3),
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "userId" INTEGER NOT NULL,
    "orderAdressId" INTEGER,
    "orderStatusId" INTEGER NOT NULL,
    "paymentMethodId" INTEGER NOT NULL,
    "voucherId" INTEGER,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderId")
);

-- CreateTable
CREATE TABLE "order_details" (
    "price" DOUBLE PRECISION NOT NULL,
    "discountPrice" DOUBLE PRECISION NOT NULL,
    "quantity" INTEGER NOT NULL,
    "orderId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "order_details_pkey" PRIMARY KEY ("orderId","productId")
);

-- CreateTable
CREATE TABLE "order_addresses" (
    "orderAddressId" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "contactName" TEXT NOT NULL,
    "contactPhone" TEXT NOT NULL,
    "orderId" INTEGER NOT NULL,

    CONSTRAINT "order_addresses_pkey" PRIMARY KEY ("orderAddressId")
);

-- CreateTable
CREATE TABLE "order_statuses" (
    "orderStatusId" SERIAL NOT NULL,
    "statusName" TEXT NOT NULL,

    CONSTRAINT "order_statuses_pkey" PRIMARY KEY ("orderStatusId")
);

-- CreateTable
CREATE TABLE "payment_methods" (
    "paymentMethodId" SERIAL NOT NULL,
    "paymentMethodName" TEXT NOT NULL,

    CONSTRAINT "payment_methods_pkey" PRIMARY KEY ("paymentMethodId")
);

-- CreateTable
CREATE TABLE "vouchers" (
    "voucherId" SERIAL NOT NULL,
    "voucherCode" TEXT NOT NULL,
    "discountType" TEXT NOT NULL,
    "discountValue" DOUBLE PRECISION NOT NULL,
    "minOrderPrice" DOUBLE PRECISION NOT NULL,
    "maxPriceDiscount" DOUBLE PRECISION NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "colectedQuantity" INTEGER NOT NULL,
    "currentUsedQuantity" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "vouchers_pkey" PRIMARY KEY ("voucherId")
);

-- CreateTable
CREATE TABLE "discounts" (
    "discountId" SERIAL NOT NULL,
    "discountType" TEXT NOT NULL,
    "discountValue" DOUBLE PRECISION NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "discounts_pkey" PRIMARY KEY ("discountId")
);

-- CreateTable
CREATE TABLE "_user_voucher" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_user_voucher_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_product_discount" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_product_discount_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "product_embeddings_productId_key" ON "product_embeddings"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "categories_categoryName_key" ON "categories"("categoryName");

-- CreateIndex
CREATE UNIQUE INDEX "carts_userId_key" ON "carts"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "order_addresses_orderId_key" ON "order_addresses"("orderId");

-- CreateIndex
CREATE UNIQUE INDEX "vouchers_voucherCode_key" ON "vouchers"("voucherCode");

-- CreateIndex
CREATE INDEX "_user_voucher_B_index" ON "_user_voucher"("B");

-- CreateIndex
CREATE INDEX "_product_discount_B_index" ON "_product_discount"("B");

-- AddForeignKey
ALTER TABLE "product_embeddings" ADD CONSTRAINT "product_embeddings_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("categoryId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_parentReviewId_fkey" FOREIGN KEY ("parentReviewId") REFERENCES "reviews"("reviewId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_informations" ADD CONSTRAINT "product_informations_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "carts" ADD CONSTRAINT "carts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart_details" ADD CONSTRAINT "cart_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart_details" ADD CONSTRAINT "cart_details_cartId_fkey" FOREIGN KEY ("cartId") REFERENCES "carts"("cartId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_orderStatusId_fkey" FOREIGN KEY ("orderStatusId") REFERENCES "order_statuses"("orderStatusId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES "payment_methods"("paymentMethodId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_voucherId_fkey" FOREIGN KEY ("voucherId") REFERENCES "vouchers"("voucherId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "orders"("orderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_addresses" ADD CONSTRAINT "order_addresses_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "orders"("orderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_user_voucher" ADD CONSTRAINT "_user_voucher_A_fkey" FOREIGN KEY ("A") REFERENCES "users"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_user_voucher" ADD CONSTRAINT "_user_voucher_B_fkey" FOREIGN KEY ("B") REFERENCES "vouchers"("voucherId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_product_discount" ADD CONSTRAINT "_product_discount_A_fkey" FOREIGN KEY ("A") REFERENCES "discounts"("discountId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_product_discount" ADD CONSTRAINT "_product_discount_B_fkey" FOREIGN KEY ("B") REFERENCES "products"("productId") ON DELETE CASCADE ON UPDATE CASCADE;
