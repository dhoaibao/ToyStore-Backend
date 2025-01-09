-- CreateTable
CREATE EXTENSION IF NOT EXISTS vector;

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
    "medthod" TEXT NOT NULL,
    "module" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("permissionId")
);

-- CreateTable
CREATE TABLE "conversations" (
    "conversationid" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "isRead" BOOLEAN NOT NULL,
    "senderId" INTEGER NOT NULL,
    "receiverId" INTEGER NOT NULL,

    CONSTRAINT "conversations_pkey" PRIMARY KEY ("conversationid")
);

-- CreateTable
CREATE TABLE "upload_images" (
    "uploadImageId" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "publicId" TEXT NOT NULL,
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
CREATE TABLE "price_fillters" (
    "priceFillterId" SERIAL NOT NULL,
    "minPrice" DOUBLE PRECISION NOT NULL,
    "maxPrice" DOUBLE PRECISION NOT NULL,
    "systemConfigId" INTEGER NOT NULL,

    CONSTRAINT "price_fillters_pkey" PRIMARY KEY ("priceFillterId")
);

-- CreateTable
CREATE TABLE "blogs" (
    "blogId" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL,
    "publishedAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "blogs_pkey" PRIMARY KEY ("blogId")
);

-- CreateTable
CREATE TABLE "blog_images" (
    "blogImageId" SERIAL NOT NULL,
    "blogId" INTEGER NOT NULL,
    "imageId" INTEGER NOT NULL,

    CONSTRAINT "blog_images_pkey" PRIMARY KEY ("blogImageId")
);

-- CreateTable
CREATE TABLE "product_image_embeddings" (
    "productImageEmbeddingId" SERIAL NOT NULL,
    "embedding" VECTOR NOT NULL,
    "imageId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_image_embeddings_pkey" PRIMARY KEY ("productImageEmbeddingId")
);

-- CreateTable
CREATE TABLE "product_images" (
    "productImageId" SERIAL NOT NULL,
    "imageId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,

    CONSTRAINT "product_images_pkey" PRIMARY KEY ("productImageId")
);

-- CreateTable
CREATE TABLE "products" (
    "productId" SERIAL NOT NULL,
    "productName" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "slug" TEXT NOT NULL,
    "visible" BOOLEAN NOT NULL,
    "brandId" INTEGER,

    CONSTRAINT "products_pkey" PRIMARY KEY ("productId")
);

-- CreateTable
CREATE TABLE "brands" (
    "brandId" SERIAL NOT NULL,
    "brandName" TEXT NOT NULL,
    "brandDesc" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "brands_pkey" PRIMARY KEY ("brandId")
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

    CONSTRAINT "users_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "addresses" (
    "addressId" SERIAL NOT NULL,
    "addressName" TEXT NOT NULL,
    "provinceCode" TEXT NOT NULL,
    "districtCode" TEXT NOT NULL,
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
CREATE TABLE "_permission_roles" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_permission_roles_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "blogs_title_key" ON "blogs"("title");

-- CreateIndex
CREATE UNIQUE INDEX "products_productName_key" ON "products"("productName");

-- CreateIndex
CREATE UNIQUE INDEX "brands_brandName_key" ON "brands"("brandName");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE INDEX "_permission_roles_B_index" ON "_permission_roles"("B");

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
ALTER TABLE "price_fillters" ADD CONSTRAINT "price_fillters_systemConfigId_fkey" FOREIGN KEY ("systemConfigId") REFERENCES "system_configurations"("systemConfigId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_images" ADD CONSTRAINT "blog_images_blogId_fkey" FOREIGN KEY ("blogId") REFERENCES "blogs"("blogId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog_images" ADD CONSTRAINT "blog_images_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image_embeddings" ADD CONSTRAINT "product_image_embeddings_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image_embeddings" ADD CONSTRAINT "product_image_embeddings_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "upload_images"("uploadImageId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("brandId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_avatarId_fkey" FOREIGN KEY ("avatarId") REFERENCES "upload_images"("uploadImageId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roles"("roleId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_permission_roles" ADD CONSTRAINT "_permission_roles_A_fkey" FOREIGN KEY ("A") REFERENCES "permissions"("permissionId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_permission_roles" ADD CONSTRAINT "_permission_roles_B_fkey" FOREIGN KEY ("B") REFERENCES "roles"("roleId") ON DELETE CASCADE ON UPDATE CASCADE;
