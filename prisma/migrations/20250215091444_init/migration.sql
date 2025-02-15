CREATE EXTENSION IF NOT EXISTS vector;

-- CreateTable
CREATE TABLE "roles" (
    "roleId" SERIAL NOT NULL,
    "roleName" TEXT NOT NULL,
    "roleDesc" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("roleId")
);

-- CreateTable
CREATE TABLE "permissions" (
    "permissionId" SERIAL NOT NULL,
    "permissionName" TEXT NOT NULL,
    "apiPath" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "module" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("permissionId")
);

-- CreateTable
CREATE TABLE "conversations" (
    "conversationId" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "isRead" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "imageId" INTEGER NOT NULL,
    "senderId" INTEGER NOT NULL,
    "receiverId" INTEGER NOT NULL,

    CONSTRAINT "conversations_pkey" PRIMARY KEY ("conversationId")
);

-- CreateTable
CREATE TABLE "upload_images" (
    "uploadImageId" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "upload_images_pkey" PRIMARY KEY ("uploadImageId")
);

-- CreateTable
CREATE TABLE "banners" (
    "bannerId" SERIAL NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "imageId" INTEGER NOT NULL,
    "systemConfigId" INTEGER NOT NULL,

    CONSTRAINT "banners_pkey" PRIMARY KEY ("bannerId")
);

-- CreateTable
CREATE TABLE "system_configurations" (
    "systemConfigId" SERIAL NOT NULL,
    "shopName" TEXT NOT NULL,
    "shopEmail" TEXT NOT NULL,
    "shopPhone" TEXT NOT NULL,
    "shopLogoId" INTEGER NOT NULL,

    CONSTRAINT "system_configurations_pkey" PRIMARY KEY ("systemConfigId")
);

-- CreateTable
CREATE TABLE "price_filters" (
    "priceFilterId" SERIAL NOT NULL,
    "minPrice" DOUBLE PRECISION NOT NULL,
    "maxPrice" DOUBLE PRECISION NOT NULL,
    "systemConfigId" INTEGER NOT NULL,

    CONSTRAINT "price_filters_pkey" PRIMARY KEY ("priceFilterId")
);

-- CreateTable
CREATE TABLE "newses" (
    "newsId" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL,
    "publishedAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "newses_pkey" PRIMARY KEY ("newsId")
);

-- CreateTable
CREATE TABLE "blog_images" (
    "newsImageId" SERIAL NOT NULL,
    "newsId" INTEGER NOT NULL,
    "imageId" INTEGER NOT NULL,

    CONSTRAINT "blog_images_pkey" PRIMARY KEY ("newsImageId")
);

-- CreateTable
CREATE TABLE "product_image_embeddings" (
    "productImageEmbeddingId" SERIAL NOT NULL,
    "embedding" vector NOT NULL,
    "upload_image_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "product_image_embeddings_pkey" PRIMARY KEY ("productImageEmbeddingId")
);

-- CreateTable
CREATE TABLE "product_images" (
    "productImageId" SERIAL NOT NULL,
    "uploadImageId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_images_pkey" PRIMARY KEY ("productImageId")
);

-- CreateTable
CREATE TABLE "product_embeddings" (
    "product_embedding_id" SERIAL NOT NULL,
    "embedding" vector NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "product_embeddings_pkey" PRIMARY KEY ("product_embedding_id")
);

-- CreateTable
CREATE TABLE "products" (
    "productId" SERIAL NOT NULL,
    "productName" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "slug" TEXT NOT NULL,
    "visible" BOOLEAN NOT NULL,
    "quantity" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "soldNumber" INTEGER,
    "avgRating" DOUBLE PRECISION,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "brandId" INTEGER,
    "categoryId" INTEGER,
    "productEmbeddingId" INTEGER,

    CONSTRAINT "products_pkey" PRIMARY KEY ("productId")
);

-- CreateTable
CREATE TABLE "brands" (
    "brandId" SERIAL NOT NULL,
    "brandName" TEXT NOT NULL,
    "brandDesc" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "brands_pkey" PRIMARY KEY ("brandId")
);

-- CreateTable
CREATE TABLE "categories" (
    "categoryId" SERIAL NOT NULL,
    "categoryName" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "categoryThumbnailId" INTEGER NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("categoryId")
);

-- CreateTable
CREATE TABLE "reviews" (
    "reviewId" SERIAL NOT NULL,
    "comment" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "userId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "parentReviewId" INTEGER,

    CONSTRAINT "reviews_pkey" PRIMARY KEY ("reviewId")
);

-- CreateTable
CREATE TABLE "product_informations" (
    "productInfoId" SERIAL NOT NULL,
    "productInfoName" TEXT NOT NULL,

    CONSTRAINT "product_informations_pkey" PRIMARY KEY ("productInfoId")
);

-- CreateTable
CREATE TABLE "product_info_values" (
    "value" TEXT NOT NULL,
    "productInfoId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_info_values_pkey" PRIMARY KEY ("productId","productInfoId")
);

-- CreateTable
CREATE TABLE "users" (
    "userId" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "phone" TEXT,
    "gender" BOOLEAN,
    "birthday" TIMESTAMP(3),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "avatarId" INTEGER,
    "roleId" INTEGER,
    "cartId" INTEGER,

    CONSTRAINT "users_pkey" PRIMARY KEY ("userId")
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
CREATE TABLE "addresses" (
    "addressId" SERIAL NOT NULL,
    "addressName" TEXT NOT NULL,
    "provinceId" INTEGER NOT NULL,
    "districtId" INTEGER NOT NULL,
    "wardCode" TEXT NOT NULL,
    "provinceName" TEXT NOT NULL,
    "districtName" TEXT NOT NULL,
    "wardName" TEXT NOT NULL,
    "detail" TEXT NOT NULL,
    "isDefault" BOOLEAN NOT NULL,
    "contactName" TEXT NOT NULL,
    "contactPhone" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("addressId")
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
    "orderAddressId" INTEGER,
    "orderStatusId" INTEGER NOT NULL,
    "paymentMethodId" INTEGER NOT NULL,
    "voucherId" INTEGER,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderId")
);

-- CreateTable
CREATE TABLE "order_details" (
    "price" DOUBLE PRECISION NOT NULL,
    "discountedPrice" DOUBLE PRECISION NOT NULL,
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
    "collectedQuantity" INTEGER NOT NULL DEFAULT 0,
    "currentUsedQuantity" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "vouchers_pkey" PRIMARY KEY ("voucherId")
);

-- CreateTable
CREATE TABLE "promotions" (
    "promotionId" SERIAL NOT NULL,
    "promotionName" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "discountType" TEXT NOT NULL,
    "discountValue" DOUBLE PRECISION NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "promotionThumbnailId" INTEGER NOT NULL,

    CONSTRAINT "promotions_pkey" PRIMARY KEY ("promotionId")
);

-- CreateTable
CREATE TABLE "_permission_roles" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_permission_roles_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_product_promotion" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_product_promotion_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_user_voucher" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_user_voucher_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "newses_title_key" ON "newses"("title");

-- CreateIndex
CREATE UNIQUE INDEX "newses_slug_key" ON "newses"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "product_embeddings_product_id_key" ON "product_embeddings"("product_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_productName_key" ON "products"("productName");

-- CreateIndex
CREATE UNIQUE INDEX "products_slug_key" ON "products"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "brands_brandName_key" ON "brands"("brandName");

-- CreateIndex
CREATE UNIQUE INDEX "categories_categoryName_key" ON "categories"("categoryName");

-- CreateIndex
CREATE UNIQUE INDEX "categories_slug_key" ON "categories"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "carts_userId_key" ON "carts"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "order_addresses_orderId_key" ON "order_addresses"("orderId");

-- CreateIndex
CREATE UNIQUE INDEX "vouchers_voucherCode_key" ON "vouchers"("voucherCode");

-- CreateIndex
CREATE INDEX "_permission_roles_B_index" ON "_permission_roles"("B");

-- CreateIndex
CREATE INDEX "_product_promotion_B_index" ON "_product_promotion"("B");

-- CreateIndex
CREATE INDEX "_user_voucher_B_index" ON "_user_voucher"("B");

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_receiverId_fkey" FOREIGN KEY ("receiverId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "banners" ADD CONSTRAINT "banners_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "banners" ADD CONSTRAINT "banners_systemConfigId_fkey" FOREIGN KEY ("systemConfigId") REFERENCES "system_configurations"("systemConfigId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "system_configurations" ADD CONSTRAINT "system_configurations_shopLogoId_fkey" FOREIGN KEY ("shopLogoId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "price_filters" ADD CONSTRAINT "price_filters_systemConfigId_fkey" FOREIGN KEY ("systemConfigId") REFERENCES "system_configurations"("systemConfigId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_images" ADD CONSTRAINT "blog_images_newsId_fkey" FOREIGN KEY ("newsId") REFERENCES "newses"("newsId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_images" ADD CONSTRAINT "blog_images_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image_embeddings" ADD CONSTRAINT "product_image_embeddings_upload_image_id_fkey" FOREIGN KEY ("upload_image_id") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image_embeddings" ADD CONSTRAINT "product_image_embeddings_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_embeddings" ADD CONSTRAINT "product_embeddings_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("brandId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("categoryId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_categoryThumbnailId_fkey" FOREIGN KEY ("categoryThumbnailId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_parentReviewId_fkey" FOREIGN KEY ("parentReviewId") REFERENCES "reviews"("reviewId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_info_values" ADD CONSTRAINT "product_info_values_productInfoId_fkey" FOREIGN KEY ("productInfoId") REFERENCES "product_informations"("productInfoId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_info_values" ADD CONSTRAINT "product_info_values_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_avatarId_fkey" FOREIGN KEY ("avatarId") REFERENCES "upload_images"("uploadImageId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roles"("roleId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "carts" ADD CONSTRAINT "carts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart_details" ADD CONSTRAINT "cart_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart_details" ADD CONSTRAINT "cart_details_cartId_fkey" FOREIGN KEY ("cartId") REFERENCES "carts"("cartId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

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
ALTER TABLE "promotions" ADD CONSTRAINT "promotions_promotionThumbnailId_fkey" FOREIGN KEY ("promotionThumbnailId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_permission_roles" ADD CONSTRAINT "_permission_roles_A_fkey" FOREIGN KEY ("A") REFERENCES "permissions"("permissionId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_permission_roles" ADD CONSTRAINT "_permission_roles_B_fkey" FOREIGN KEY ("B") REFERENCES "roles"("roleId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_product_promotion" ADD CONSTRAINT "_product_promotion_A_fkey" FOREIGN KEY ("A") REFERENCES "products"("productId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_product_promotion" ADD CONSTRAINT "_product_promotion_B_fkey" FOREIGN KEY ("B") REFERENCES "promotions"("promotionId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_user_voucher" ADD CONSTRAINT "_user_voucher_A_fkey" FOREIGN KEY ("A") REFERENCES "users"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_user_voucher" ADD CONSTRAINT "_user_voucher_B_fkey" FOREIGN KEY ("B") REFERENCES "vouchers"("voucherId") ON DELETE CASCADE ON UPDATE CASCADE;
