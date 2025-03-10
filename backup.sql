--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _permission_roles; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public._permission_roles (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public._permission_roles OWNER TO dhoaibao;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO dhoaibao;

--
-- Name: _user_voucher; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public._user_voucher (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public._user_voucher OWNER TO dhoaibao;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.addresses (
    "addressId" integer NOT NULL,
    "addressName" text NOT NULL,
    "provinceId" integer NOT NULL,
    "districtId" integer NOT NULL,
    "wardCode" text NOT NULL,
    "provinceName" text NOT NULL,
    "districtName" text NOT NULL,
    "wardName" text NOT NULL,
    detail text NOT NULL,
    "contactName" text NOT NULL,
    "contactPhone" text NOT NULL,
    "isDefault" boolean NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.addresses OWNER TO dhoaibao;

--
-- Name: addresses_addressId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."addresses_addressId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."addresses_addressId_seq" OWNER TO dhoaibao;

--
-- Name: addresses_addressId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."addresses_addressId_seq" OWNED BY public.addresses."addressId";


--
-- Name: banners; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.banners (
    "bannerId" integer NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "uploadImageId" integer NOT NULL,
    "systemConfigId" integer NOT NULL
);


ALTER TABLE public.banners OWNER TO dhoaibao;

--
-- Name: banners_bannerId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."banners_bannerId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."banners_bannerId_seq" OWNER TO dhoaibao;

--
-- Name: banners_bannerId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."banners_bannerId_seq" OWNED BY public.banners."bannerId";


--
-- Name: brands; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.brands (
    "brandId" integer NOT NULL,
    "brandName" text NOT NULL,
    "brandDesc" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO dhoaibao;

--
-- Name: brands_brandId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."brands_brandId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."brands_brandId_seq" OWNER TO dhoaibao;

--
-- Name: brands_brandId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."brands_brandId_seq" OWNED BY public.brands."brandId";


--
-- Name: cart_details; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.cart_details (
    quantity integer NOT NULL,
    "productId" integer NOT NULL,
    "cartId" integer NOT NULL
);


ALTER TABLE public.cart_details OWNER TO dhoaibao;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.carts OWNER TO dhoaibao;

--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."carts_cartId_seq" OWNER TO dhoaibao;

--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: categories; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.categories (
    "categoryId" integer NOT NULL,
    "categoryName" text NOT NULL,
    slug text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "categoryThumbnailId" integer NOT NULL
);


ALTER TABLE public.categories OWNER TO dhoaibao;

--
-- Name: categories_categoryId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."categories_categoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."categories_categoryId_seq" OWNER TO dhoaibao;

--
-- Name: categories_categoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."categories_categoryId_seq" OWNED BY public.categories."categoryId";


--
-- Name: messages; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.messages (
    "messageId" integer NOT NULL,
    content text NOT NULL,
    "isRead" boolean DEFAULT false NOT NULL,
    "uploadImageId" integer,
    "senderId" integer NOT NULL,
    "receiverId" integer,
    "time" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO dhoaibao;

--
-- Name: messages_messageId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."messages_messageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."messages_messageId_seq" OWNER TO dhoaibao;

--
-- Name: messages_messageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."messages_messageId_seq" OWNED BY public.messages."messageId";


--
-- Name: newses; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.newses (
    "newsId" integer NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.newses OWNER TO dhoaibao;

--
-- Name: newses_newsId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."newses_newsId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."newses_newsId_seq" OWNER TO dhoaibao;

--
-- Name: newses_newsId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."newses_newsId_seq" OWNED BY public.newses."newsId";


--
-- Name: order_addresses; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.order_addresses (
    "orderAddressId" integer NOT NULL,
    address text NOT NULL,
    "contactName" text NOT NULL,
    "contactPhone" text NOT NULL
);


ALTER TABLE public.order_addresses OWNER TO dhoaibao;

--
-- Name: order_addresses_orderAddressId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."order_addresses_orderAddressId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."order_addresses_orderAddressId_seq" OWNER TO dhoaibao;

--
-- Name: order_addresses_orderAddressId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."order_addresses_orderAddressId_seq" OWNED BY public.order_addresses."orderAddressId";


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.order_details (
    "orderDetailId" integer NOT NULL,
    price double precision NOT NULL,
    "discountedPrice" double precision NOT NULL,
    quantity integer NOT NULL,
    "orderId" integer NOT NULL,
    "productId" integer NOT NULL
);


ALTER TABLE public.order_details OWNER TO dhoaibao;

--
-- Name: order_details_orderDetailId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."order_details_orderDetailId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."order_details_orderDetailId_seq" OWNER TO dhoaibao;

--
-- Name: order_details_orderDetailId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."order_details_orderDetailId_seq" OWNED BY public.order_details."orderDetailId";


--
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.order_statuses (
    "orderStatusId" integer NOT NULL,
    "statusName" text NOT NULL
);


ALTER TABLE public.order_statuses OWNER TO dhoaibao;

--
-- Name: order_statuses_orderStatusId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."order_statuses_orderStatusId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."order_statuses_orderStatusId_seq" OWNER TO dhoaibao;

--
-- Name: order_statuses_orderStatusId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."order_statuses_orderStatusId_seq" OWNED BY public.order_statuses."orderStatusId";


--
-- Name: order_trackings; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.order_trackings (
    "time" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "orderId" integer NOT NULL,
    "orderStatusId" integer NOT NULL
);


ALTER TABLE public.order_trackings OWNER TO dhoaibao;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "totalPrice" double precision NOT NULL,
    "totalDiscount" double precision NOT NULL,
    "shippingFee" double precision NOT NULL,
    "finalPrice" double precision NOT NULL,
    "paymentStatus" boolean NOT NULL,
    "paidDate" timestamp(3) without time zone,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer NOT NULL,
    "orderAddressId" integer,
    "paymentMethodId" integer NOT NULL,
    "voucherId" integer
);


ALTER TABLE public.orders OWNER TO dhoaibao;

--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."orders_orderId_seq" OWNER TO dhoaibao;

--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.payment_methods (
    "paymentMethodId" integer NOT NULL,
    "paymentMethodName" text NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO dhoaibao;

--
-- Name: payment_methods_paymentMethodId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."payment_methods_paymentMethodId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."payment_methods_paymentMethodId_seq" OWNER TO dhoaibao;

--
-- Name: payment_methods_paymentMethodId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."payment_methods_paymentMethodId_seq" OWNED BY public.payment_methods."paymentMethodId";


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.permissions (
    "permissionId" integer NOT NULL,
    "permissionName" text NOT NULL,
    "apiPath" text NOT NULL,
    method text NOT NULL,
    module text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO dhoaibao;

--
-- Name: permissions_permissionId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."permissions_permissionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."permissions_permissionId_seq" OWNER TO dhoaibao;

--
-- Name: permissions_permissionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."permissions_permissionId_seq" OWNED BY public.permissions."permissionId";


--
-- Name: price_filters; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.price_filters (
    "priceFilterId" integer NOT NULL,
    "minPrice" double precision NOT NULL,
    "maxPrice" double precision NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "systemConfigId" integer NOT NULL
);


ALTER TABLE public.price_filters OWNER TO dhoaibao;

--
-- Name: price_filters_priceFilterId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."price_filters_priceFilterId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."price_filters_priceFilterId_seq" OWNER TO dhoaibao;

--
-- Name: price_filters_priceFilterId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."price_filters_priceFilterId_seq" OWNED BY public.price_filters."priceFilterId";


--
-- Name: price_histories; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.price_histories (
    "priceHistoryId" integer NOT NULL,
    price double precision NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone,
    "productId" integer NOT NULL
);


ALTER TABLE public.price_histories OWNER TO dhoaibao;

--
-- Name: price_histories_priceHistoryId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."price_histories_priceHistoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."price_histories_priceHistoryId_seq" OWNER TO dhoaibao;

--
-- Name: price_histories_priceHistoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."price_histories_priceHistoryId_seq" OWNED BY public.price_histories."priceHistoryId";


--
-- Name: product_embeddings; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.product_embeddings (
    product_embedding_id integer NOT NULL,
    embedding public.vector NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.product_embeddings OWNER TO dhoaibao;

--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public.product_embeddings_product_embedding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_embeddings_product_embedding_id_seq OWNER TO dhoaibao;

--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public.product_embeddings_product_embedding_id_seq OWNED BY public.product_embeddings.product_embedding_id;


--
-- Name: product_image_embeddings; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.product_image_embeddings (
    "productImageEmbeddingId" integer NOT NULL,
    embedding public.vector NOT NULL,
    upload_image_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.product_image_embeddings OWNER TO dhoaibao;

--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."product_image_embeddings_productImageEmbeddingId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."product_image_embeddings_productImageEmbeddingId_seq" OWNER TO dhoaibao;

--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."product_image_embeddings_productImageEmbeddingId_seq" OWNED BY public.product_image_embeddings."productImageEmbeddingId";


--
-- Name: product_info_values; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.product_info_values (
    value text NOT NULL,
    "productInfoId" integer NOT NULL,
    "productId" integer NOT NULL
);


ALTER TABLE public.product_info_values OWNER TO dhoaibao;

--
-- Name: product_informations; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.product_informations (
    "productInfoId" integer NOT NULL,
    "productInfoName" text NOT NULL,
    "isActive" boolean NOT NULL,
    type text NOT NULL,
    options text[],
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.product_informations OWNER TO dhoaibao;

--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."product_informations_productInfoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."product_informations_productInfoId_seq" OWNER TO dhoaibao;

--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."product_informations_productInfoId_seq" OWNED BY public.product_informations."productInfoId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    "productName" text NOT NULL,
    slug text NOT NULL,
    quantity integer NOT NULL,
    description text NOT NULL,
    "soldNumber" integer DEFAULT 0 NOT NULL,
    "avgRating" double precision DEFAULT 0 NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "brandId" integer NOT NULL,
    "categoryId" integer NOT NULL,
    "promotionId" integer
);


ALTER TABLE public.products OWNER TO dhoaibao;

--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."products_productId_seq" OWNER TO dhoaibao;

--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: promotions; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.promotions (
    "promotionId" integer NOT NULL,
    "promotionName" text NOT NULL,
    description text NOT NULL,
    "discountType" text NOT NULL,
    "discountValue" double precision NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "promotionThumbnailId" integer NOT NULL
);


ALTER TABLE public.promotions OWNER TO dhoaibao;

--
-- Name: promotions_promotionId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."promotions_promotionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."promotions_promotionId_seq" OWNER TO dhoaibao;

--
-- Name: promotions_promotionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."promotions_promotionId_seq" OWNED BY public.promotions."promotionId";


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.reviews (
    "reviewId" integer NOT NULL,
    comment text NOT NULL,
    rating double precision,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "orderDetailId" integer,
    "userId" integer NOT NULL,
    "productId" integer,
    "parentReviewId" integer
);


ALTER TABLE public.reviews OWNER TO dhoaibao;

--
-- Name: reviews_reviewId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."reviews_reviewId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."reviews_reviewId_seq" OWNER TO dhoaibao;

--
-- Name: reviews_reviewId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."reviews_reviewId_seq" OWNED BY public.reviews."reviewId";


--
-- Name: roles; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.roles (
    "roleId" integer NOT NULL,
    "roleName" text NOT NULL,
    "roleDesc" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO dhoaibao;

--
-- Name: roles_roleId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."roles_roleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."roles_roleId_seq" OWNER TO dhoaibao;

--
-- Name: roles_roleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."roles_roleId_seq" OWNED BY public.roles."roleId";


--
-- Name: system_configurations; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.system_configurations (
    "systemConfigId" integer NOT NULL,
    "shopName" text NOT NULL,
    "shopEmail" text NOT NULL,
    "shopPhone" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "logoId" integer NOT NULL
);


ALTER TABLE public.system_configurations OWNER TO dhoaibao;

--
-- Name: system_configurations_systemConfigId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."system_configurations_systemConfigId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."system_configurations_systemConfigId_seq" OWNER TO dhoaibao;

--
-- Name: system_configurations_systemConfigId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."system_configurations_systemConfigId_seq" OWNED BY public.system_configurations."systemConfigId";


--
-- Name: upload_images; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.upload_images (
    "uploadImageId" integer NOT NULL,
    url text NOT NULL,
    "filePath" text NOT NULL,
    "reviewId" integer,
    "productId" integer
);


ALTER TABLE public.upload_images OWNER TO dhoaibao;

--
-- Name: upload_images_uploadImageId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."upload_images_uploadImageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."upload_images_uploadImageId_seq" OWNER TO dhoaibao;

--
-- Name: upload_images_uploadImageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."upload_images_uploadImageId_seq" OWNED BY public.upload_images."uploadImageId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    "fullName" text NOT NULL,
    email text NOT NULL,
    password text,
    phone text,
    gender boolean,
    birthday timestamp(3) without time zone,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "avatarId" integer,
    "roleId" integer
);


ALTER TABLE public.users OWNER TO dhoaibao;

--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."users_userId_seq" OWNER TO dhoaibao;

--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: vouchers; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.vouchers (
    "voucherId" integer NOT NULL,
    "voucherCode" text NOT NULL,
    "discountType" text NOT NULL,
    "discountValue" double precision NOT NULL,
    "minOrderPrice" double precision NOT NULL,
    "maxPriceDiscount" double precision NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone NOT NULL,
    quantity integer NOT NULL,
    "collectedQuantity" integer DEFAULT 0 NOT NULL,
    "currentUsedQuantity" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.vouchers OWNER TO dhoaibao;

--
-- Name: vouchers_voucherId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."vouchers_voucherId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."vouchers_voucherId_seq" OWNER TO dhoaibao;

--
-- Name: vouchers_voucherId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."vouchers_voucherId_seq" OWNED BY public.vouchers."voucherId";


--
-- Name: addresses addressId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.addresses ALTER COLUMN "addressId" SET DEFAULT nextval('public."addresses_addressId_seq"'::regclass);


--
-- Name: banners bannerId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.banners ALTER COLUMN "bannerId" SET DEFAULT nextval('public."banners_bannerId_seq"'::regclass);


--
-- Name: brands brandId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.brands ALTER COLUMN "brandId" SET DEFAULT nextval('public."brands_brandId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: categories categoryId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.categories ALTER COLUMN "categoryId" SET DEFAULT nextval('public."categories_categoryId_seq"'::regclass);


--
-- Name: messages messageId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.messages ALTER COLUMN "messageId" SET DEFAULT nextval('public."messages_messageId_seq"'::regclass);


--
-- Name: newses newsId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.newses ALTER COLUMN "newsId" SET DEFAULT nextval('public."newses_newsId_seq"'::regclass);


--
-- Name: order_addresses orderAddressId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_addresses ALTER COLUMN "orderAddressId" SET DEFAULT nextval('public."order_addresses_orderAddressId_seq"'::regclass);


--
-- Name: order_details orderDetailId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_details ALTER COLUMN "orderDetailId" SET DEFAULT nextval('public."order_details_orderDetailId_seq"'::regclass);


--
-- Name: order_statuses orderStatusId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN "orderStatusId" SET DEFAULT nextval('public."order_statuses_orderStatusId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: payment_methods paymentMethodId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN "paymentMethodId" SET DEFAULT nextval('public."payment_methods_paymentMethodId_seq"'::regclass);


--
-- Name: permissions permissionId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.permissions ALTER COLUMN "permissionId" SET DEFAULT nextval('public."permissions_permissionId_seq"'::regclass);


--
-- Name: price_filters priceFilterId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.price_filters ALTER COLUMN "priceFilterId" SET DEFAULT nextval('public."price_filters_priceFilterId_seq"'::regclass);


--
-- Name: price_histories priceHistoryId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.price_histories ALTER COLUMN "priceHistoryId" SET DEFAULT nextval('public."price_histories_priceHistoryId_seq"'::regclass);


--
-- Name: product_embeddings product_embedding_id; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_embeddings ALTER COLUMN product_embedding_id SET DEFAULT nextval('public.product_embeddings_product_embedding_id_seq'::regclass);


--
-- Name: product_image_embeddings productImageEmbeddingId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_image_embeddings ALTER COLUMN "productImageEmbeddingId" SET DEFAULT nextval('public."product_image_embeddings_productImageEmbeddingId_seq"'::regclass);


--
-- Name: product_informations productInfoId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_informations ALTER COLUMN "productInfoId" SET DEFAULT nextval('public."product_informations_productInfoId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Name: promotions promotionId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.promotions ALTER COLUMN "promotionId" SET DEFAULT nextval('public."promotions_promotionId_seq"'::regclass);


--
-- Name: reviews reviewId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.reviews ALTER COLUMN "reviewId" SET DEFAULT nextval('public."reviews_reviewId_seq"'::regclass);


--
-- Name: roles roleId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.roles ALTER COLUMN "roleId" SET DEFAULT nextval('public."roles_roleId_seq"'::regclass);


--
-- Name: system_configurations systemConfigId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.system_configurations ALTER COLUMN "systemConfigId" SET DEFAULT nextval('public."system_configurations_systemConfigId_seq"'::regclass);


--
-- Name: upload_images uploadImageId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.upload_images ALTER COLUMN "uploadImageId" SET DEFAULT nextval('public."upload_images_uploadImageId_seq"'::regclass);


--
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);


--
-- Name: vouchers voucherId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.vouchers ALTER COLUMN "voucherId" SET DEFAULT nextval('public."vouchers_voucherId_seq"'::regclass);


--
-- Data for Name: _permission_roles; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._permission_roles ("A", "B") FROM stdin;
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
10	2
11	2
12	2
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
15	1
17	1
18	1
20	1
21	1
3	3
4	3
5	3
6	3
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
18	3
19	3
20	3
21	3
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
dd47b4a8-3410-47de-84b7-b5bd7caf0536	a1eef4151db0725de230cfc3e4eef7c88ec66ef83e2550d6f9f0a3516f9eaeff	2025-03-09 09:10:57.190658+00	20250305095955_update	\N	\N	2025-03-09 09:10:56.97814+00	1
05111480-1e8a-480f-9515-4ba81fdba76e	ba5cbc88b8f8ebbf67316c183cc75ad355c28f133d25732502556ed7a291fbb4	2025-03-09 09:10:57.207511+00	20250305114317_update	\N	\N	2025-03-09 09:10:57.192152+00	1
5132b77f-16bb-4f78-9c47-455980d9a06e	e4783e02ca420bb36e37ae6467422fe3e798fba0801ff4c3682e8472ea42dbf5	2025-03-09 09:10:57.225941+00	20250305115635_update	\N	\N	2025-03-09 09:10:57.208992+00	1
b4a93ff4-1395-47db-8bb4-188a335ca4b9	6b8d1e2212ee7e381e5aa2f423abe1b4598a5892ac0f6ccad1822d0a2563eaeb	2025-03-09 09:10:57.232339+00	20250306093044_update	\N	\N	2025-03-09 09:10:57.227452+00	1
53883ac7-75af-4705-b1bd-f3c82b39e553	c31edd8f528991e911763ce460c73b3b1dcf1cc28fea4e98cadc25f7762c76d9	2025-03-09 09:10:57.239435+00	20250306093201_update	\N	\N	2025-03-09 09:10:57.23394+00	1
1f99f48f-5c14-4477-a177-c0dabad645fb	171ad6f32257feabc8e5789c8de89bbc982505f91b392c758fb93af1396c0839	2025-03-09 09:10:57.246218+00	20250306093356_update	\N	\N	2025-03-09 09:10:57.241042+00	1
8cff60f2-ed19-49f1-8deb-189b87493fdc	57eddc2f75863a97836205f926b23f243da49838079af5dea2c2474e19551545	2025-03-09 09:10:57.254052+00	20250306093457_update	\N	\N	2025-03-09 09:10:57.248088+00	1
\.


--
-- Data for Name: _user_voucher; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._user_voucher ("A", "B") FROM stdin;
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.addresses ("addressId", "addressName", "provinceId", "districtId", "wardCode", "provinceName", "districtName", "wardName", detail, "contactName", "contactPhone", "isDefault", "userId") FROM stdin;
1	Nhà riêng	220	1572	550113	Cần Thơ	Quận Ninh Kiều	Phường Xuân Khánh	3/2	Dương Bảo	0942463758	t	1
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.banners ("bannerId", "isActive", "createdAt", "updatedAt", "uploadImageId", "systemConfigId") FROM stdin;
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.brands ("brandId", "brandName", "brandDesc", "isActive", "createdAt", "updatedAt") FROM stdin;
1	LEGO NINJAGO	LEGO NINJAGO...	t	2025-03-10 02:31:05.688+00	2025-03-10 02:31:05.688+00
2	AVENGERS	AVENGERS...	t	2025-03-10 12:10:38.615+00	2025-03-10 12:10:38.615+00
\.


--
-- Data for Name: cart_details; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.cart_details (quantity, "productId", "cartId") FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.carts ("cartId", "userId") FROM stdin;
1	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.categories ("categoryId", "categoryName", slug, "isActive", "createdAt", "updatedAt", "categoryThumbnailId") FROM stdin;
1	LEGO	lego	t	2025-03-10 02:30:53.014+00	2025-03-10 02:30:53.014+00	2
2	 Super Hero	super-hero	t	2025-03-10 12:13:03.742+00	2025-03-10 12:13:03.742+00	308
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.messages ("messageId", content, "isRead", "uploadImageId", "senderId", "receiverId", "time") FROM stdin;
1	hello	t	\N	1	\N	2025-03-09 09:29:28.542
2	xin chao	t	\N	2	1	2025-03-09 09:29:34.048
3	hello	f	\N	2	1	2025-03-10 09:26:54.457
4	co gi khong	t	\N	1	\N	2025-03-10 09:27:03.413
\.


--
-- Data for Name: newses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.newses ("newsId", title, slug, content, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: order_addresses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_addresses ("orderAddressId", address, "contactName", "contactPhone") FROM stdin;
1	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Dương Bảo	0942463758
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_details ("orderDetailId", price, "discountedPrice", quantity, "orderId", "productId") FROM stdin;
1	419000	0	3	1	2
\.


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_statuses ("orderStatusId", "statusName") FROM stdin;
1	pending
2	confirmed
3	shipping
4	delivered
5	canceled
\.


--
-- Data for Name: order_trackings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_trackings ("time", "orderId", "orderStatusId") FROM stdin;
2025-03-10 02:35:30.439+00	1	1
2025-03-10 02:36:13.866+00	1	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.orders ("orderId", "totalPrice", "totalDiscount", "shippingFee", "finalPrice", "paymentStatus", "paidDate", "createdAt", "updatedAt", "userId", "orderAddressId", "paymentMethodId", "voucherId") FROM stdin;
1	1257000	0	22000	1279000	f	\N	2025-03-10 02:35:30.433+00	2025-03-10 02:35:30.433+00	1	1	1	\N
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.payment_methods ("paymentMethodId", "paymentMethodName") FROM stdin;
1	cod
2	vnpay
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.permissions ("permissionId", "permissionName", "apiPath", method, module, "createdAt", "updatedAt") FROM stdin;
1	Thêm quyền hạn	/api/v1/permission	POST	PERMISSION	2025-03-09 09:26:30.329+00	2025-03-09 09:26:30.329+00
2	Cập nhật vai trò	/api/v1/role/:id	PUT	ROLE	2025-03-09 09:27:20.802+00	2025-03-09 09:27:20.802+00
3	Thêm sản phẩm	/api/v1/product	POST	PRODUCT	2025-03-09 09:36:08.723+00	2025-03-09 09:36:08.723+00
4	Cập nhật sản phẩm	/api/v1/product/:id	PUT	PRODUCT	2025-03-09 09:36:26.75+00	2025-03-09 09:36:26.75+00
5	Thêm danh mục	/api/v1/category	POST	CATEGORY	2025-03-09 09:36:48.698+00	2025-03-09 09:36:48.698+00
6	Cập nhật danh mục	/api/v1/category/:id	PUT	CATEGORY	2025-03-09 09:37:05.696+00	2025-03-09 09:37:05.696+00
7	Thêm thương hiệu	/api/v1/brand	POST	BRAND	2025-03-09 09:37:21.819+00	2025-03-09 09:37:21.819+00
8	Cập nhật thương hiệu	/api/v1/brand/:id	PUT	BRAND	2025-03-09 09:37:34.769+00	2025-03-09 09:37:34.769+00
9	Thêm thông tin sản phẩm	/api/v1/product-information	POST	PRODUCT_INFORMATION	2025-03-09 09:37:54.129+00	2025-03-09 09:37:54.129+00
10	Cập nhật thông tin sản phẩm	/api/v1/product-information/:id	PUT	PRODUCT_INFORMATION	2025-03-09 09:38:11.129+00	2025-03-09 09:38:11.129+00
11	Thêm khuyến mãi	/api/v1/promotion	POST	PROMOTION	2025-03-09 09:38:29.066+00	2025-03-09 09:38:29.066+00
12	Cập nhật khuyến mãi	/api/v1/promotion/:id	PUT	PROMOTION	2025-03-09 09:38:50.112+00	2025-03-09 09:38:50.112+00
13	Thêm mã giảm giá	/api/v1/voucher	POST	VOUCHER	2025-03-09 09:39:04.913+00	2025-03-09 09:39:04.913+00
14	Cập nhật mã giảm giá	/api/v1/voucher/:id	PUT	VOUCHER	2025-03-09 09:39:18.233+00	2025-03-09 09:39:18.233+00
15	Thêm đơn hàng	/api/v1/order	POST	ORDER	2025-03-09 09:39:35.065+00	2025-03-09 09:39:35.065+00
16	Cập nhật trạng thái đơn hàng	/api/v1/order/:id	PUT	ORDER	2025-03-09 09:39:51.857+00	2025-03-09 09:39:51.857+00
17	Hủy đơn hàng	/api/v1/order/cancel/:id	PUT	ORDER	2025-03-09 09:40:15.243+00	2025-03-09 09:40:15.243+00
18	Thêm đánh giá	/api/v1/review	POST	REVIEW	2025-03-09 09:40:42.053+00	2025-03-09 09:40:42.053+00
19	Thêm người dùng	/api/v1/user	POST	USER	2025-03-09 09:41:10.03+00	2025-03-09 09:41:10.03+00
20	Cập nhật thông tin người dùng	/api/v1/user/:id	PUT	USER	2025-03-09 09:41:33.217+00	2025-03-09 09:41:33.217+00
21	Đổi mật khẩu	/api/v1/user/change-password	PUT	USER	2025-03-09 09:41:56.9+00	2025-03-09 09:41:56.9+00
22	Thêm vai trò	/api/v1/role	POST	ROLE	2025-03-09 09:42:11.209+00	2025-03-09 09:42:11.209+00
23	Cập nhật quyền hạn	/api/v1/permission/:id	PUT	PERMISSION	2025-03-09 09:42:33.038+00	2025-03-09 09:42:33.038+00
\.


--
-- Data for Name: price_filters; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.price_filters ("priceFilterId", "minPrice", "maxPrice", "createdAt", "updatedAt", "systemConfigId") FROM stdin;
\.


--
-- Data for Name: price_histories; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.price_histories ("priceHistoryId", price, "startDate", "endDate", "productId") FROM stdin;
2	419000	2025-03-10 02:34:14.808	\N	2
7	419000	2025-03-10 03:02:02.09	\N	7
9	419000	2025-03-10 03:11:02.266	\N	9
11	234234	2025-03-10 04:00:19.479	2025-03-10 12:15:30.696	11
12	299000	2025-03-10 12:15:30.696	\N	11
\.


--
-- Data for Name: product_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_embeddings (product_embedding_id, embedding, product_id) FROM stdin;
1	[-0.14032274,0.08137949,-0.06672361,-0.08262005,-0.08643784,0.063144915,0.05825789,0.08227816,0.024162311,0.009078785,0.050576106,-0.10809407,0.014301802,-0.04430322,0.006828288,-0.017812472,0.0051751113,0.08794678,-0.0027738898,-0.10820216,-0.07787232,-0.10346034,0.015363736,0.0042474167,-0.09441402,0.02072956,0.067364685,0.081995144,0.023175469,-0.10323763,0.0099070715,0.13584027,-0.0034798344,0.018757658,0.084237255,-0.012919431,-0.021836946,-0.05656527,0.007669918,-0.07319395,-0.017911451,0.02161834,-0.0015307446,-0.079212405,0.11116544,0.024624433,-0.04659042,-0.018468738,-0.005000101,-0.060107,-0.014358983,0.018394653,0.070379406,0.03738084,0.034004103,-0.020059858,0.067664355,0.022381822,0.057503305,0.020430403,0.010980407,0.01584895,-0.025006698,-0.025894407,-0.008971424,-0.070689976,-0.05448114,0.031556685,-0.0323514,0.047796372,0.090806246,-0.02284834,0.015505601,0.024999738,-0.015991028,-0.015882336,-0.0030399882,0.007936993,0.001727377,-0.028448168,-0.034482736,0.017487464,0.018252548,-0.05029222,0.003800525,0.039063208,-0.04835027,0.024257615,0.036417764,0.04540123,0.0038628117,0.057151083,0.0072327,-0.010993074,-0.05770137,-0.0011504298,0.013387715,-0.08366697,-0.066225275,0.10297073,0.052658007,0.100011945,0.05716872,-0.0066069555,0.006832943,0.0014397041,0.103624605,0.029932445,0.020972947,0.019632682,-0.036038358,-0.0344033,-0.042215344,-0.072101735,0.012973017,-0.07997316,0.0059429808,0.018969713,-0.022112593,0.019425662,0.050051894,-0.023785397,-0.089286156,-0.033008423,-0.030518807,-0.005829953,0.052292995,7.7759025e-33,-0.021569224,-0.043991294,-0.009573026,-0.0122970035,0.010820713,-0.036968164,-0.03322846,-0.050219018,-0.025400762,0.005067481,0.006983559,-0.11316958,-0.05490345,0.0004807657,0.013476501,0.066428065,-0.048268095,-0.03243088,-0.04487109,0.007752334,-0.025874063,-0.016686495,0.01185801,-0.018546699,0.084509365,0.08972796,-0.0064052497,-0.11433138,0.048929792,0.053878304,0.009504186,0.016803209,-0.039993454,0.029280046,-0.05768656,-0.019502068,0.0048963963,-0.060986318,-0.005622807,-0.018859109,0.16319852,-0.07823191,-0.09221617,-0.028602762,-0.018446812,0.039395962,0.06332911,-0.016570691,0.06070505,-0.03675034,-0.011816463,-0.013220271,-0.1197511,-0.04229134,0.043270346,-0.06450499,0.015087789,-0.029085608,0.051982407,0.016685816,0.037046846,-0.01047099,-0.09938834,0.032432653,0.021200025,-0.062253144,0.021798275,-0.08045897,0.036762487,-0.065818906,-0.02910193,-0.13482976,0.014274891,0.022637784,-0.03590385,-0.022213716,0.0026995116,-0.012783397,-0.040243577,0.070466764,-0.010453609,0.022846308,-0.043807276,-0.025492884,0.05509435,0.096604474,0.025765736,-0.091570444,0.06540924,0.08825706,-0.016263,0.011589778,0.03573884,0.01944857,-0.0253814,-7.3957785e-33,0.00040684416,0.02728872,0.02845548,0.04826448,0.049494773,-0.0761396,-0.028212935,0.036603756,0.08616551,-0.033506557,-0.00082115916,-0.034155287,-0.0057462873,-0.026286246,0.09653122,0.116689876,0.044788405,0.09083456,-0.026749194,0.012583161,-0.04039354,0.018770583,0.026861103,0.102623135,-0.0861043,0.035850897,0.043137502,0.056352325,0.014511016,0.077929944,-0.012165685,-0.09293137,-0.025561476,0.10159324,-0.03206936,-0.07352057,0.010308894,0.016070185,-0.009047237,0.03899083,-0.023416258,0.014223027,-0.02908581,0.04708443,-0.02775774,-0.07825016,0.042310346,0.014203949,-0.017989088,-0.038624935,0.07179981,0.058900423,-0.064850554,-0.023978263,0.016979733,-0.006295097,0.027548002,-0.11865122,0.018332867,-0.026662903,0.06558608,0.028369302,-0.00094752095,0.009868677,0.013099144,0.03147723,0.04226912,0.03244583,0.005954192,-0.049972627,0.004673832,0.036211073,0.047319543,0.01613225,-0.08296477,0.043890137,-0.0815136,0.13579959,0.074559316,-0.019345712,-0.057503555,-0.0133741535,-0.058419857,0.049362242,-0.01526514,0.009583733,-0.030779984,0.015384168,0.04718965,-0.03907273,0.059814814,0.023375588,0.042467367,0.07091181,-0.04478625,-2.507825e-08,0.014447688,-0.10227071,-0.026691347,-0.047351558,0.059620235,0.0023950438,-0.030322388,-0.04935589,0.050834883,0.03690656,0.066337086,0.067161575,-0.01413752,0.039851923,-0.07596339,0.104812376,0.00045886377,0.03951182,0.021272847,0.012809279,0.041521717,0.015783563,0.0017111244,-0.053622622,-0.026729116,0.020187633,-0.1060537,0.04983921,0.01280494,-0.014900383,0.045789033,-0.0050579696,0.04416571,-0.042332627,0.08441008,-0.046021506,0.056356847,-0.03209738,-0.028797906,-0.029684206,0.061767112,-0.008286551,0.040190645,-0.042620685,-0.1021894,-0.041643895,0.028769737,-0.08315849,-0.037041306,-0.04360979,-0.1025196,-0.04173199,0.019985283,-0.0139082605,0.018819936,0.025135808,-0.014159196,-0.006768756,-0.044596456,-0.025902169,0.027803048,0.014622826,-0.02731011,0.0019187944]	2
2	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	2
3	[-0.09827544,0.09303674,-0.029625857,-0.017355638,-0.011681179,-0.009462471,0.06748801,0.023728164,-0.040336642,0.0052385307,0.022070969,-0.03889043,0.061557975,0.022150595,-0.03268522,0.0013568699,0.08429478,0.06360428,0.016069323,-0.03431002,-0.031276226,-0.08857678,0.023733467,0.023057897,0.016996829,0.054095164,0.017371703,0.034347028,-0.020051228,-0.074071005,-0.043624073,0.0652183,-0.044605263,0.018676989,0.06599975,-0.03435378,-0.007205227,-0.054991625,-0.042118795,-0.14209783,-0.07434835,0.037262496,0.014696364,0.01662975,0.0829086,0.0713407,-0.0061183716,-0.038249794,0.039520714,-0.0034175029,-0.013982302,-0.040037647,0.046694536,-0.0014953464,0.057544593,-0.02092082,-0.0016433143,-0.016924758,0.08308719,0.029372066,0.011957733,-0.03577737,0.0016420963,0.032200437,0.0620571,-0.06849083,-0.029804464,0.05334548,-0.06285714,-0.010217747,0.034291014,0.018599432,0.14109915,0.00038827836,-0.008828522,-0.04222801,0.014267948,-0.034415003,-0.038267367,0.058671746,-0.04015427,-0.053363353,-0.061538134,-0.018274883,0.039022446,0.067107394,0.020510387,0.02817956,-0.036193024,0.07166771,-0.041188788,-0.00020629291,0.07495697,0.08739441,-0.11207683,-0.006411679,0.059784967,-0.056080084,-0.06268937,0.15880741,-0.021678641,0.039591353,0.08795227,-0.09144471,0.06667628,-0.00028005496,0.0003011122,-0.011356985,0.044036265,0.044317067,-0.040925547,-0.066600405,-0.059889965,0.013636884,-0.022037288,-0.0335378,-0.0067780884,0.018601548,-0.01163749,0.07637762,0.12955937,0.012876062,-0.000120527875,-0.000111656416,0.032687455,-0.057173572,-0.019154279,-1.348699e-33,0.0033165524,-0.033061232,-0.005123491,-0.008273544,0.013674392,-0.045722373,0.058292948,-0.031009465,-0.09605738,0.068176076,-0.028032534,-0.011474978,-0.1100953,0.031188773,0.04337745,-0.0025755626,-0.105162956,-0.07222215,0.005860601,0.075504296,0.018939668,0.04382437,0.0043016453,-0.00029048062,-0.009351579,0.05044981,0.019408787,-0.061440095,0.007577983,0.07156393,-0.00815664,0.028591443,-0.04781461,0.038726762,0.06888241,-0.046313614,0.013360318,-0.101246975,-0.029394902,-0.015994398,0.05157015,-0.046221174,-0.13945678,0.02346582,0.056833856,-0.023857227,0.07795232,0.014607467,0.0060551306,0.014558596,-0.059540536,-0.0071259006,-0.012103413,-0.049884595,-0.033696346,-0.08036131,0.0135260215,-0.05464764,0.0036065737,0.0036574882,-0.026036397,0.058422543,-0.051742367,0.05007792,-0.027497046,-0.010624109,0.04023994,-0.009290568,0.02209697,-0.028308121,0.03317922,-0.042250425,0.03985175,0.0016728386,-0.008244159,-0.06818084,-0.04925681,0.07450638,-0.10155803,-0.0010938223,0.03598998,0.033200968,-0.06300854,0.033944108,0.059192188,0.09053526,0.012393187,-0.04281042,0.0042702667,0.022377387,-0.03723395,-0.07072021,0.033034537,-0.010021275,-0.0033456422,8.944859e-34,-0.006029618,-0.059041668,0.05261347,0.03744077,0.062057458,-0.057505537,-0.05180287,0.042259976,-0.009836575,0.04146707,-0.017696511,0.015603022,0.016988354,-0.0108179385,0.06757751,0.043149423,0.04975376,-0.0150701655,0.033146862,-0.04361591,-0.03482867,-0.06991729,-0.084592074,0.05089638,0.008246458,0.060587578,-0.016055137,0.0018400295,0.0029994855,0.072697446,-0.021964297,-0.041800708,0.044339456,0.07956006,0.031641744,-0.010985639,-0.08624953,0.021823434,-0.017979745,-0.100025676,-0.009955682,0.0049527837,-0.07597141,0.08108456,0.026371103,-0.049392555,0.003961026,0.054374535,0.10018386,0.015730482,0.011471342,0.05574394,-0.004604418,-0.16433202,0.022969568,-0.006818107,-0.021630937,-0.033208504,0.07656342,0.030798744,0.101969264,-0.023974037,-0.004282637,0.08164342,-0.04560824,0.0045159045,0.048907384,-0.0035452375,0.0010678956,-0.011575435,0.034407724,0.11143891,0.036293585,-0.048950102,-0.058268405,-0.027325893,-0.024859838,0.11554542,0.045733083,-0.039713968,0.018715777,0.012685542,0.016884074,0.10863647,0.016242262,0.032619808,-6.62162e-05,0.0690629,-0.03406012,-0.040645577,0.035071228,0.07488672,0.011366789,-2.698094e-05,-0.088215806,-1.2232051e-08,0.011119726,-0.0056268573,-0.0727456,-0.087459095,0.018379563,0.03264822,0.004843078,-0.0111700455,-0.009801305,0.007942927,0.10773784,0.08115572,0.011871368,0.075018734,-0.016355863,0.035931863,-0.009257952,0.024545003,-0.0023730367,0.040239453,0.014085671,-0.0043399422,-0.028273555,0.007147099,-0.07052259,-0.0044658408,-0.06614919,0.014284706,0.09038641,0.010216353,-0.010362612,-0.027296873,-0.020479042,-0.060221948,-0.017531047,-0.033140127,-0.058325384,0.028063819,0.015687061,-0.08056592,0.02168462,-0.06024712,0.06727091,-0.041032754,-0.15504733,-0.029841747,-0.022060921,-0.15340942,-0.030300193,-0.06534832,-0.009789156,-0.017551757,-0.07642398,0.028984945,0.08727048,0.08975481,0.030751878,-0.030184854,-0.042832814,-0.043810356,0.039569344,-0.023486124,0.005733708,0.08794368]	2
4	[-0.076538,0.0104834,0.010868099,-0.076737456,-0.0837952,0.024007007,0.027276838,-0.02008493,0.057172675,0.013169113,0.1474641,-0.0709511,0.060671203,-0.04677215,0.020233767,-0.0061218413,0.0059214314,0.09288506,-0.08387128,-0.08605412,-0.03176352,-0.024864316,-0.00622182,0.037826695,-0.05865595,0.0813499,-0.034125812,0.08221457,-0.0412101,-0.06788683,-0.034658782,0.15959391,-0.025069866,-0.020428909,0.011031206,0.005856743,-0.016385447,-0.029420141,0.013577797,0.008296346,-0.03733352,0.029635182,-0.014031731,-0.046725858,0.10281427,-0.022442177,-0.055099618,-0.05206276,0.055113453,-0.08628885,-0.028418312,0.07355081,0.02164768,0.12289431,-0.07168304,-0.05386159,0.015517131,0.029404307,0.12743957,0.013392841,-0.05233119,0.015190638,0.00939516,-0.009334607,0.012504083,-0.031064594,-0.10991081,-0.07121367,-0.028132694,0.08853727,-0.008914356,-0.027534213,-0.087894954,0.079791225,-0.053627804,0.031102886,-0.024526387,-0.015219885,-0.028044714,-0.0340299,-0.014863908,0.020365868,0.08358517,-0.063066274,-0.036493044,0.058234394,-0.006702857,-0.004836956,-0.00094852725,0.00061874505,0.041482218,0.088613525,0.007878935,-0.018906776,-0.011184229,-0.07360489,0.026920976,0.010556921,-0.03270746,0.04419521,0.09456178,0.023234116,0.0039828867,-0.02820453,-0.016911667,0.005825175,0.13693622,-0.0049757264,0.026178539,-0.01316943,-0.07748045,0.014099862,-0.006262679,-0.12436647,-0.014525677,0.040985063,0.030364368,-0.015280648,0.0057334197,0.09216767,0.0206228,-0.009492998,-0.05713372,-0.0064150095,-0.0032347152,-0.06388261,0.03076169,1.8156223e-32,0.0031203858,0.020192947,0.028750964,-0.08788213,0.0905328,-0.030585775,-0.03245205,-0.049688414,-0.05282726,-0.0010707772,0.02275687,-0.079352535,-0.08048038,-0.025232144,0.046577387,-0.060646918,-0.014942732,-0.112800926,-0.0049083116,-0.00046490505,0.03702058,0.011327443,0.029025873,0.003607132,-0.004694647,-0.000977303,-0.037666,-0.04439562,0.0129952505,0.04345188,0.04070358,-0.0064249756,-0.04255921,-0.08552437,-0.10805938,-0.017927196,0.020744704,-0.031743802,0.002781477,-0.00047705875,0.043180544,-0.032431655,-0.07955707,0.0059517967,0.03794538,0.049178164,-0.0021364235,0.0033882167,0.024833689,-0.01710017,-0.0025000405,-0.011535325,-0.096823566,0.04017498,0.073931254,-0.013073673,0.034797546,0.008126119,0.028807834,0.034635536,0.0024013373,0.010752733,-0.016222129,0.032466345,-0.00068160397,-0.031360697,-0.008527273,-0.047928073,0.044472653,-0.108907945,-0.07902181,-0.075366065,0.025399135,0.03443719,-0.032990288,-0.088603966,0.0030937456,-0.014288062,0.010901794,-0.0065243794,0.036347687,0.0071324087,-0.03214319,-0.010192319,-0.016439205,0.032069422,0.06368575,-0.08940359,-0.040349793,0.023549562,-0.047560606,0.04728082,0.09024321,-0.0052046753,-0.05401842,-1.5146672e-32,0.027171748,0.06799657,0.018810686,0.065585755,0.03819618,-0.046679582,-0.01778219,0.0068131546,0.075081326,-0.06601187,-0.012527734,-0.019561945,-0.018785693,-0.00068982976,0.009359926,0.05973057,0.014892837,0.071869746,0.014592056,0.047230262,-0.05645645,-0.034166798,0.024413377,0.05396683,-0.047833398,0.07232153,0.059800755,0.054796893,0.090502486,0.06499228,-0.02619215,-0.06384298,-0.11597303,0.0716862,0.010252595,-0.048110083,0.005681871,0.010707489,-0.05566991,0.047027484,-0.040333774,-0.01744181,-0.026869215,-0.05214509,-0.021804798,-0.030962493,0.12973492,-0.0046612066,-0.06463706,-0.040403485,0.09801924,0.039662406,-0.078971975,0.04251122,0.011452819,-0.0039408854,0.020544425,-0.07578218,-0.05547334,-0.075462565,-0.021880671,0.062006943,-0.004994114,-0.055944424,0.08877964,0.013592508,0.045364466,0.04513128,0.057901382,-0.044799518,-0.11489287,-0.017070662,0.0057601887,-0.036325432,0.021587525,0.051175904,-0.039791964,0.034507636,0.00966945,-0.040641256,-0.13078459,0.034824573,-0.07973472,-0.0068503926,-0.010937755,0.08032837,-0.08422541,-0.010069389,0.054264504,0.02215345,0.05967759,0.013176312,0.050502747,0.04454339,-0.0041804938,-4.650671e-08,0.01150639,-0.05538959,-0.0015612383,0.022968808,0.11984655,0.005130147,0.01476832,-0.081665695,-0.01419138,-0.004719084,0.11607247,0.11061516,-0.0107163,0.011479381,-0.09751108,0.10329094,0.05260684,0.039100535,0.034239985,-0.021279927,0.016205387,0.03816241,0.044128846,-0.038886648,-0.07379974,0.017921729,-0.08193087,0.05173467,-0.062679,0.016323084,0.05460262,-0.019259999,-0.02498964,-0.09566183,0.12485122,-0.059599414,-0.022629151,-0.005717888,-0.034317717,0.043379407,0.04630904,0.001936489,0.045845043,-0.025058003,-0.018995373,-0.0008190975,0.04335363,-0.012062941,0.023173593,-0.05169345,-0.02931601,-0.04098224,0.06102243,-0.011188543,-0.0072361804,0.044630595,0.0277613,0.019575093,-0.017979646,-0.027018972,0.041891374,0.020979485,-0.025873896,-0.009805436]	2
9	[-0.047852788,0.0027863365,-0.06854074,0.0543419,-0.008924599,-0.085722715,0.13492604,0.0516296,-0.042300995,-0.038814202,0.070779435,-0.0554217,0.013991188,-0.010881248,-0.020146696,-0.017452879,-0.03084436,-0.084058896,-0.07252259,0.045973834,-0.023520999,-0.031774122,-0.04675514,0.068726175,0.03685443,-0.04379581,-0.03246842,0.07837305,0.028365152,-0.08226434,0.03250644,0.0065708435,0.013257501,0.024940392,0.047678083,-0.015960207,0.08283774,0.027726635,-0.04347369,0.036939215,0.015609382,-0.098373234,0.010018984,-0.050010055,0.0130471885,0.011348752,-0.006948599,0.10392853,-0.035181914,-0.024936158,-0.015816696,-0.04440278,-0.074385285,0.03448233,0.0072369874,0.013044594,-0.017362162,0.012184486,0.030686976,0.067126706,0.01024308,-0.016553475,0.0011392565,0.011506239,0.09867226,-0.06327733,-0.0034329705,-0.0252112,-0.030834384,-0.0052938946,-0.10775139,0.0055389223,-0.025894577,-0.0071120644,0.038894065,-0.006021478,-0.0604754,-0.04700279,0.045699507,-0.10223832,-0.07069948,-0.0660883,-0.08210333,-0.0047755176,-0.04343315,0.090587474,0.04070026,0.0227348,-0.052610457,0.036524102,0.04444849,0.05093812,0.03917007,0.023697222,-0.00604992,0.0101484535,0.06335793,0.018638067,0.01652197,0.1997118,0.010605619,0.061928812,0.00020286883,0.05472054,-0.07735073,-0.023101714,-0.004959033,-0.08402107,0.058824267,0.027736193,-0.037463665,-0.062224332,0.034222662,0.0239117,0.022327578,0.0056795203,-0.024522785,0.08726254,-0.012887878,0.02153897,0.055279624,-0.03698355,-0.008155777,-0.028402051,-0.037312828,-0.007866961,0.05926143,-1.85021e-33,0.03773305,-0.13029745,-0.011391853,0.12071322,0.023875179,0.031278744,-0.011179629,0.08389931,-0.050432276,-0.021155266,-0.046624973,-0.024010977,-0.04942843,-0.021249546,0.040128578,0.042508096,0.05030148,0.03614746,-0.05274787,0.016681073,0.02582252,0.049404826,0.0092141535,-0.027930848,-0.05856701,-0.015385683,-0.008718959,-0.0637189,0.032213733,0.009556388,-0.06443164,-0.00842688,-0.14533295,0.093345456,-0.011187168,0.05136739,0.044539936,-0.07048022,-0.020210024,-0.042440493,-0.071298674,0.0087359175,-0.020158553,0.036709286,0.07488397,-0.084470734,-0.031492766,0.029380435,0.07156735,-0.006992513,-0.032820877,0.032617018,-0.06817291,-0.03711438,-0.059275653,-0.0041894903,0.057543274,-0.066933796,-0.03381055,0.04400597,-0.005341268,0.050109424,-0.026355764,0.071557656,-0.025822649,-0.0047874586,-0.0676713,-0.07058322,0.041793134,0.017536208,-0.045467257,-0.029032553,0.054375157,0.00370849,0.04282266,-0.040595714,-0.00047390003,0.087561175,-0.06643097,-0.062032275,0.01230344,-0.06970013,-0.01397775,0.007294753,-0.08497722,0.029760223,0.026234958,-0.109246165,0.017282326,-0.059841596,-0.03992021,0.0536505,0.034222294,-0.05037654,0.0840114,1.4181766e-33,-0.053303078,0.04669545,-0.024950547,0.074688606,0.039483804,0.013621255,0.10160611,-0.023469793,-0.06895616,0.095745,0.028938584,-0.03877052,-0.005545421,-0.03632517,-0.0058530937,-0.054230176,0.05586185,-0.07152922,-0.051651813,0.023015013,-0.025924983,0.07581184,-0.035214934,0.010256594,-0.13928159,0.055885706,0.0964537,0.05269137,0.02302402,-0.00037001094,0.051013682,0.049715634,-0.01404819,0.053945806,0.017437933,0.0053450232,0.10465394,-0.02619044,-0.02098092,0.052790053,0.077966124,0.08740502,0.033034313,0.1202236,0.006686659,0.049309928,0.019511549,-0.004153106,0.016284714,0.014051409,-0.079824455,0.040669326,-0.016810948,0.02284043,-0.011995206,-0.03900808,-0.020821776,0.025972366,0.0013863523,0.030242203,-0.02492674,0.055934887,-0.029787663,0.104163125,-0.038443677,-0.013484115,-0.03289056,0.04195123,0.04370117,0.022351468,0.015534221,0.024737583,0.023945678,-0.059084103,0.041340496,0.034498245,-0.092140734,0.02415261,0.014123885,-0.036567755,-0.06318005,-0.019693019,-0.06722279,0.05733357,-0.0068007754,0.042483807,0.10326177,0.097320355,0.0028998267,0.021284312,0.016878236,0.04874733,-0.00015911406,-0.02734414,0.012702706,-1.5515448e-08,-0.006025133,-0.03232683,0.03199288,0.04472404,-0.016520435,0.057475913,-0.07913823,0.009792409,-0.018164782,0.020691328,-0.0022630051,0.0464599,0.03544973,0.013883806,-0.009981935,-0.05060005,-0.102128975,-0.025615271,-0.03061602,-0.013648715,-0.06697953,-0.033730455,-0.019245196,-0.015422074,-0.024163064,0.04706924,-0.007939062,0.13639148,-0.024411427,-0.014354648,0.10706389,0.046138037,-0.0020673561,-0.07142619,0.025510987,0.060090777,0.027526276,0.04588682,0.016712228,0.061828803,0.015831113,-0.005814148,-0.026182309,-0.045523975,-0.032885883,-0.03862685,-0.034553118,-0.078053005,-0.038626686,-0.114766635,-0.07456323,-0.0016954636,0.027576486,0.006355924,0.030459382,0.011049454,-0.0043188296,0.025953788,-0.0962883,0.09535715,0.12443859,-0.004699764,0.0010870418,-0.024251342]	9
10	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	9
11	[-0.09827544,0.09303674,-0.029625857,-0.017355638,-0.011681179,-0.009462471,0.06748801,0.023728164,-0.040336642,0.0052385307,0.022070969,-0.03889043,0.061557975,0.022150595,-0.03268522,0.0013568699,0.08429478,0.06360428,0.016069323,-0.03431002,-0.031276226,-0.08857678,0.023733467,0.023057897,0.016996829,0.054095164,0.017371703,0.034347028,-0.020051228,-0.074071005,-0.043624073,0.0652183,-0.044605263,0.018676989,0.06599975,-0.03435378,-0.007205227,-0.054991625,-0.042118795,-0.14209783,-0.07434835,0.037262496,0.014696364,0.01662975,0.0829086,0.0713407,-0.0061183716,-0.038249794,0.039520714,-0.0034175029,-0.013982302,-0.040037647,0.046694536,-0.0014953464,0.057544593,-0.02092082,-0.0016433143,-0.016924758,0.08308719,0.029372066,0.011957733,-0.03577737,0.0016420963,0.032200437,0.0620571,-0.06849083,-0.029804464,0.05334548,-0.06285714,-0.010217747,0.034291014,0.018599432,0.14109915,0.00038827836,-0.008828522,-0.04222801,0.014267948,-0.034415003,-0.038267367,0.058671746,-0.04015427,-0.053363353,-0.061538134,-0.018274883,0.039022446,0.067107394,0.020510387,0.02817956,-0.036193024,0.07166771,-0.041188788,-0.00020629291,0.07495697,0.08739441,-0.11207683,-0.006411679,0.059784967,-0.056080084,-0.06268937,0.15880741,-0.021678641,0.039591353,0.08795227,-0.09144471,0.06667628,-0.00028005496,0.0003011122,-0.011356985,0.044036265,0.044317067,-0.040925547,-0.066600405,-0.059889965,0.013636884,-0.022037288,-0.0335378,-0.0067780884,0.018601548,-0.01163749,0.07637762,0.12955937,0.012876062,-0.000120527875,-0.000111656416,0.032687455,-0.057173572,-0.019154279,-1.348699e-33,0.0033165524,-0.033061232,-0.005123491,-0.008273544,0.013674392,-0.045722373,0.058292948,-0.031009465,-0.09605738,0.068176076,-0.028032534,-0.011474978,-0.1100953,0.031188773,0.04337745,-0.0025755626,-0.105162956,-0.07222215,0.005860601,0.075504296,0.018939668,0.04382437,0.0043016453,-0.00029048062,-0.009351579,0.05044981,0.019408787,-0.061440095,0.007577983,0.07156393,-0.00815664,0.028591443,-0.04781461,0.038726762,0.06888241,-0.046313614,0.013360318,-0.101246975,-0.029394902,-0.015994398,0.05157015,-0.046221174,-0.13945678,0.02346582,0.056833856,-0.023857227,0.07795232,0.014607467,0.0060551306,0.014558596,-0.059540536,-0.0071259006,-0.012103413,-0.049884595,-0.033696346,-0.08036131,0.0135260215,-0.05464764,0.0036065737,0.0036574882,-0.026036397,0.058422543,-0.051742367,0.05007792,-0.027497046,-0.010624109,0.04023994,-0.009290568,0.02209697,-0.028308121,0.03317922,-0.042250425,0.03985175,0.0016728386,-0.008244159,-0.06818084,-0.04925681,0.07450638,-0.10155803,-0.0010938223,0.03598998,0.033200968,-0.06300854,0.033944108,0.059192188,0.09053526,0.012393187,-0.04281042,0.0042702667,0.022377387,-0.03723395,-0.07072021,0.033034537,-0.010021275,-0.0033456422,8.944859e-34,-0.006029618,-0.059041668,0.05261347,0.03744077,0.062057458,-0.057505537,-0.05180287,0.042259976,-0.009836575,0.04146707,-0.017696511,0.015603022,0.016988354,-0.0108179385,0.06757751,0.043149423,0.04975376,-0.0150701655,0.033146862,-0.04361591,-0.03482867,-0.06991729,-0.084592074,0.05089638,0.008246458,0.060587578,-0.016055137,0.0018400295,0.0029994855,0.072697446,-0.021964297,-0.041800708,0.044339456,0.07956006,0.031641744,-0.010985639,-0.08624953,0.021823434,-0.017979745,-0.100025676,-0.009955682,0.0049527837,-0.07597141,0.08108456,0.026371103,-0.049392555,0.003961026,0.054374535,0.10018386,0.015730482,0.011471342,0.05574394,-0.004604418,-0.16433202,0.022969568,-0.006818107,-0.021630937,-0.033208504,0.07656342,0.030798744,0.101969264,-0.023974037,-0.004282637,0.08164342,-0.04560824,0.0045159045,0.048907384,-0.0035452375,0.0010678956,-0.011575435,0.034407724,0.11143891,0.036293585,-0.048950102,-0.058268405,-0.027325893,-0.024859838,0.11554542,0.045733083,-0.039713968,0.018715777,0.012685542,0.016884074,0.10863647,0.016242262,0.032619808,-6.62162e-05,0.0690629,-0.03406012,-0.040645577,0.035071228,0.07488672,0.011366789,-2.698094e-05,-0.088215806,-1.2232051e-08,0.011119726,-0.0056268573,-0.0727456,-0.087459095,0.018379563,0.03264822,0.004843078,-0.0111700455,-0.009801305,0.007942927,0.10773784,0.08115572,0.011871368,0.075018734,-0.016355863,0.035931863,-0.009257952,0.024545003,-0.0023730367,0.040239453,0.014085671,-0.0043399422,-0.028273555,0.007147099,-0.07052259,-0.0044658408,-0.06614919,0.014284706,0.09038641,0.010216353,-0.010362612,-0.027296873,-0.020479042,-0.060221948,-0.017531047,-0.033140127,-0.058325384,0.028063819,0.015687061,-0.08056592,0.02168462,-0.06024712,0.06727091,-0.041032754,-0.15504733,-0.029841747,-0.022060921,-0.15340942,-0.030300193,-0.06534832,-0.009789156,-0.017551757,-0.07642398,0.028984945,0.08727048,0.08975481,0.030751878,-0.030184854,-0.042832814,-0.043810356,0.039569344,-0.023486124,0.005733708,0.08794368]	9
12	[-0.076538,0.0104834,0.010868099,-0.076737456,-0.0837952,0.024007007,0.027276838,-0.02008493,0.057172675,0.013169113,0.1474641,-0.0709511,0.060671203,-0.04677215,0.020233767,-0.0061218413,0.0059214314,0.09288506,-0.08387128,-0.08605412,-0.03176352,-0.024864316,-0.00622182,0.037826695,-0.05865595,0.0813499,-0.034125812,0.08221457,-0.0412101,-0.06788683,-0.034658782,0.15959391,-0.025069866,-0.020428909,0.011031206,0.005856743,-0.016385447,-0.029420141,0.013577797,0.008296346,-0.03733352,0.029635182,-0.014031731,-0.046725858,0.10281427,-0.022442177,-0.055099618,-0.05206276,0.055113453,-0.08628885,-0.028418312,0.07355081,0.02164768,0.12289431,-0.07168304,-0.05386159,0.015517131,0.029404307,0.12743957,0.013392841,-0.05233119,0.015190638,0.00939516,-0.009334607,0.012504083,-0.031064594,-0.10991081,-0.07121367,-0.028132694,0.08853727,-0.008914356,-0.027534213,-0.087894954,0.079791225,-0.053627804,0.031102886,-0.024526387,-0.015219885,-0.028044714,-0.0340299,-0.014863908,0.020365868,0.08358517,-0.063066274,-0.036493044,0.058234394,-0.006702857,-0.004836956,-0.00094852725,0.00061874505,0.041482218,0.088613525,0.007878935,-0.018906776,-0.011184229,-0.07360489,0.026920976,0.010556921,-0.03270746,0.04419521,0.09456178,0.023234116,0.0039828867,-0.02820453,-0.016911667,0.005825175,0.13693622,-0.0049757264,0.026178539,-0.01316943,-0.07748045,0.014099862,-0.006262679,-0.12436647,-0.014525677,0.040985063,0.030364368,-0.015280648,0.0057334197,0.09216767,0.0206228,-0.009492998,-0.05713372,-0.0064150095,-0.0032347152,-0.06388261,0.03076169,1.8156223e-32,0.0031203858,0.020192947,0.028750964,-0.08788213,0.0905328,-0.030585775,-0.03245205,-0.049688414,-0.05282726,-0.0010707772,0.02275687,-0.079352535,-0.08048038,-0.025232144,0.046577387,-0.060646918,-0.014942732,-0.112800926,-0.0049083116,-0.00046490505,0.03702058,0.011327443,0.029025873,0.003607132,-0.004694647,-0.000977303,-0.037666,-0.04439562,0.0129952505,0.04345188,0.04070358,-0.0064249756,-0.04255921,-0.08552437,-0.10805938,-0.017927196,0.020744704,-0.031743802,0.002781477,-0.00047705875,0.043180544,-0.032431655,-0.07955707,0.0059517967,0.03794538,0.049178164,-0.0021364235,0.0033882167,0.024833689,-0.01710017,-0.0025000405,-0.011535325,-0.096823566,0.04017498,0.073931254,-0.013073673,0.034797546,0.008126119,0.028807834,0.034635536,0.0024013373,0.010752733,-0.016222129,0.032466345,-0.00068160397,-0.031360697,-0.008527273,-0.047928073,0.044472653,-0.108907945,-0.07902181,-0.075366065,0.025399135,0.03443719,-0.032990288,-0.088603966,0.0030937456,-0.014288062,0.010901794,-0.0065243794,0.036347687,0.0071324087,-0.03214319,-0.010192319,-0.016439205,0.032069422,0.06368575,-0.08940359,-0.040349793,0.023549562,-0.047560606,0.04728082,0.09024321,-0.0052046753,-0.05401842,-1.5146672e-32,0.027171748,0.06799657,0.018810686,0.065585755,0.03819618,-0.046679582,-0.01778219,0.0068131546,0.075081326,-0.06601187,-0.012527734,-0.019561945,-0.018785693,-0.00068982976,0.009359926,0.05973057,0.014892837,0.071869746,0.014592056,0.047230262,-0.05645645,-0.034166798,0.024413377,0.05396683,-0.047833398,0.07232153,0.059800755,0.054796893,0.090502486,0.06499228,-0.02619215,-0.06384298,-0.11597303,0.0716862,0.010252595,-0.048110083,0.005681871,0.010707489,-0.05566991,0.047027484,-0.040333774,-0.01744181,-0.026869215,-0.05214509,-0.021804798,-0.030962493,0.12973492,-0.0046612066,-0.06463706,-0.040403485,0.09801924,0.039662406,-0.078971975,0.04251122,0.011452819,-0.0039408854,0.020544425,-0.07578218,-0.05547334,-0.075462565,-0.021880671,0.062006943,-0.004994114,-0.055944424,0.08877964,0.013592508,0.045364466,0.04513128,0.057901382,-0.044799518,-0.11489287,-0.017070662,0.0057601887,-0.036325432,0.021587525,0.051175904,-0.039791964,0.034507636,0.00966945,-0.040641256,-0.13078459,0.034824573,-0.07973472,-0.0068503926,-0.010937755,0.08032837,-0.08422541,-0.010069389,0.054264504,0.02215345,0.05967759,0.013176312,0.050502747,0.04454339,-0.0041804938,-4.650671e-08,0.01150639,-0.05538959,-0.0015612383,0.022968808,0.11984655,0.005130147,0.01476832,-0.081665695,-0.01419138,-0.004719084,0.11607247,0.11061516,-0.0107163,0.011479381,-0.09751108,0.10329094,0.05260684,0.039100535,0.034239985,-0.021279927,0.016205387,0.03816241,0.044128846,-0.038886648,-0.07379974,0.017921729,-0.08193087,0.05173467,-0.062679,0.016323084,0.05460262,-0.019259999,-0.02498964,-0.09566183,0.12485122,-0.059599414,-0.022629151,-0.005717888,-0.034317717,0.043379407,0.04630904,0.001936489,0.045845043,-0.025058003,-0.018995373,-0.0008190975,0.04335363,-0.012062941,0.023173593,-0.05169345,-0.02931601,-0.04098224,0.06102243,-0.011188543,-0.0072361804,0.044630595,0.0277613,0.019575093,-0.017979646,-0.027018972,0.041891374,0.020979485,-0.025873896,-0.009805436]	9
5	[-0.07548863,0.011177989,0.00572841,-0.07071798,-0.077409685,0.019836275,0.027032282,-0.019018551,0.055090558,0.017659614,0.14376761,-0.07165169,0.065250285,-0.04756786,0.024996728,-0.01109366,0.016791105,0.09036219,-0.08030801,-0.097621016,-0.02716974,-0.02775606,-0.007211042,0.032124218,-0.055654325,0.076440945,-0.035714842,0.07537087,-0.04480246,-0.070489,-0.0357589,0.16013137,-0.032435533,-0.018117223,0.0017332145,0.0020727196,-0.011408123,-0.028641408,0.01373567,0.0070076324,-0.04630225,0.022933567,-0.014024246,-0.051511344,0.09282976,-0.024071312,-0.055789843,-0.043552037,0.05891809,-0.08485096,-0.031888988,0.07107989,0.018331788,0.121131875,-0.06981397,-0.049762316,0.014662415,0.028950071,0.124079585,0.021446183,-0.057234656,0.013550103,0.0057495628,-0.0043878113,0.022354448,-0.02306796,-0.115369454,-0.06898789,-0.021600667,0.08908525,-0.014537208,-0.028854184,-0.08486426,0.07643801,-0.05585171,0.042852223,-0.02858606,-0.014014243,-0.026593976,-0.04482209,-0.01421531,0.017059635,0.08316675,-0.06232596,-0.03169983,0.05666977,-0.0039443313,0.0050749136,-0.0050085755,0.0009221466,0.047286358,0.089183494,0.0057355473,-0.018565945,-0.00027003334,-0.074387275,0.02395373,0.018388227,-0.020999353,0.04191041,0.09451901,0.016699072,0.00050388236,-0.041362677,-0.028649889,0.0035935834,0.14646949,-0.009900524,0.038220916,-0.014763991,-0.09287437,0.022826161,-0.012024754,-0.13420044,-0.022637071,0.048169613,0.028223608,-0.011572923,-0.0050202934,0.090821,0.025731437,-0.009390844,-0.048966933,-0.008553502,-0.0023897279,-0.061128404,0.03589581,1.8789541e-32,-0.00078670034,0.009583963,0.029101975,-0.08966778,0.092153296,-0.018268922,-0.02071255,-0.04450541,-0.06093432,0.00092698453,0.022421978,-0.062368017,-0.08498625,-0.033683628,0.052194815,-0.057415985,-0.016821679,-0.11193185,-0.0052780965,-0.006761251,0.041846212,0.0027770204,0.022386946,0.016546203,-0.0014686115,-0.002729841,-0.031530965,-0.036510065,0.010271775,0.047046777,0.03704613,-0.0009741504,-0.048792046,-0.0827105,-0.10136573,-0.01324837,0.017017618,-0.025875188,0.002945729,-0.0059575383,0.042427894,-0.03444513,-0.07284009,0.009935748,0.031249529,0.05013758,-0.009714936,-0.0038637521,0.03157567,-0.008805047,-0.0033177626,-0.0107597355,-0.09699875,0.030934552,0.07187883,-0.008808838,0.03500191,0.0075237853,0.0329643,0.03425605,-0.011810878,0.013380308,-0.016848775,0.035022676,-0.013776624,-0.024545291,-0.019808242,-0.05799773,0.054074515,-0.10326217,-0.07613786,-0.07320227,0.027691843,0.0386971,-0.02898684,-0.08795964,0.00080410216,-0.012396252,0.00772922,-0.019206237,0.038812708,0.003869668,-0.03442758,-0.0006104921,-0.0123962965,0.030477481,0.066667706,-0.08731852,-0.048738144,0.011851239,-0.03932849,0.05039122,0.09270586,-0.006570667,-0.054589573,-1.5575528e-32,0.025075588,0.07241342,0.015218339,0.06740951,0.050507743,-0.048186354,-0.0013736133,0.0029528965,0.0704189,-0.06254013,0.0014184437,-0.030882338,-0.02191007,-0.0011236873,0.004348371,0.052932106,0.012129305,0.05835165,0.017020384,0.05338591,-0.054141324,-0.033009075,0.027013382,0.045145277,-0.05292551,0.071663275,0.050395723,0.05313953,0.093085326,0.061666027,-0.024117196,-0.054553214,-0.116268665,0.08070397,0.011171774,-0.060939517,0.017446436,0.009577005,-0.062023964,0.038382906,-0.03159182,-0.009869485,-0.038075194,-0.04469627,-0.022259258,-0.027367214,0.13715099,-0.010865164,-0.066892475,-0.040841788,0.09756239,0.03844231,-0.07428039,0.0420991,0.014535224,-0.0016587273,0.018941276,-0.08137345,-0.056554276,-0.06887763,-0.015455529,0.067699604,-0.00803541,-0.04249744,0.08527798,0.006127307,0.046099413,0.0589351,0.0575485,-0.03798533,-0.11831699,-0.024790175,0.010348993,-0.040473703,0.02195334,0.042708617,-0.046975415,0.030511618,0.008798622,-0.036962073,-0.13696343,0.030570831,-0.080081195,0.00061639084,-0.0048316484,0.0891388,-0.08591475,-0.0020068376,0.052223183,0.032219894,0.060087178,0.012841584,0.048217,0.04043493,-0.00030269034,-4.792927e-08,0.0050022607,-0.0627246,0.00032341725,0.019856816,0.118548185,-0.002588886,0.014018907,-0.07298329,-0.01907083,-0.0070124553,0.11479435,0.10648905,-0.012570349,0.013639126,-0.09284275,0.095965214,0.05293173,0.04307879,0.032048877,-0.01226563,0.0077401767,0.04589624,0.038950138,-0.035957437,-0.06981746,0.036553036,-0.080564044,0.053350966,-0.06445835,0.019872854,0.0599748,-0.020187767,-0.028841197,-0.10702171,0.11380651,-0.056042742,-0.021870667,0.0035105813,-0.035419803,0.042150334,0.037236534,0.004627972,0.042206988,-0.017483842,-0.0149020385,-0.0113371415,0.036833555,-0.019660931,0.021568125,-0.056967355,-0.027970998,-0.038644508,0.05588158,-0.015695002,0.00042326644,0.05005523,0.029205522,0.021738699,-0.032888155,-0.033737134,0.052930865,0.029059907,-0.025947731,-0.01056001]	7
6	[-0.07548863,0.011177989,0.00572841,-0.07071798,-0.077409685,0.019836275,0.027032282,-0.019018551,0.055090558,0.017659614,0.14376761,-0.07165169,0.065250285,-0.04756786,0.024996728,-0.01109366,0.016791105,0.09036219,-0.08030801,-0.097621016,-0.02716974,-0.02775606,-0.007211042,0.032124218,-0.055654325,0.076440945,-0.035714842,0.07537087,-0.04480246,-0.070489,-0.0357589,0.16013137,-0.032435533,-0.018117223,0.0017332145,0.0020727196,-0.011408123,-0.028641408,0.01373567,0.0070076324,-0.04630225,0.022933567,-0.014024246,-0.051511344,0.09282976,-0.024071312,-0.055789843,-0.043552037,0.05891809,-0.08485096,-0.031888988,0.07107989,0.018331788,0.121131875,-0.06981397,-0.049762316,0.014662415,0.028950071,0.124079585,0.021446183,-0.057234656,0.013550103,0.0057495628,-0.0043878113,0.022354448,-0.02306796,-0.115369454,-0.06898789,-0.021600667,0.08908525,-0.014537208,-0.028854184,-0.08486426,0.07643801,-0.05585171,0.042852223,-0.02858606,-0.014014243,-0.026593976,-0.04482209,-0.01421531,0.017059635,0.08316675,-0.06232596,-0.03169983,0.05666977,-0.0039443313,0.0050749136,-0.0050085755,0.0009221466,0.047286358,0.089183494,0.0057355473,-0.018565945,-0.00027003334,-0.074387275,0.02395373,0.018388227,-0.020999353,0.04191041,0.09451901,0.016699072,0.00050388236,-0.041362677,-0.028649889,0.0035935834,0.14646949,-0.009900524,0.038220916,-0.014763991,-0.09287437,0.022826161,-0.012024754,-0.13420044,-0.022637071,0.048169613,0.028223608,-0.011572923,-0.0050202934,0.090821,0.025731437,-0.009390844,-0.048966933,-0.008553502,-0.0023897279,-0.061128404,0.03589581,1.8789541e-32,-0.00078670034,0.009583963,0.029101975,-0.08966778,0.092153296,-0.018268922,-0.02071255,-0.04450541,-0.06093432,0.00092698453,0.022421978,-0.062368017,-0.08498625,-0.033683628,0.052194815,-0.057415985,-0.016821679,-0.11193185,-0.0052780965,-0.006761251,0.041846212,0.0027770204,0.022386946,0.016546203,-0.0014686115,-0.002729841,-0.031530965,-0.036510065,0.010271775,0.047046777,0.03704613,-0.0009741504,-0.048792046,-0.0827105,-0.10136573,-0.01324837,0.017017618,-0.025875188,0.002945729,-0.0059575383,0.042427894,-0.03444513,-0.07284009,0.009935748,0.031249529,0.05013758,-0.009714936,-0.0038637521,0.03157567,-0.008805047,-0.0033177626,-0.0107597355,-0.09699875,0.030934552,0.07187883,-0.008808838,0.03500191,0.0075237853,0.0329643,0.03425605,-0.011810878,0.013380308,-0.016848775,0.035022676,-0.013776624,-0.024545291,-0.019808242,-0.05799773,0.054074515,-0.10326217,-0.07613786,-0.07320227,0.027691843,0.0386971,-0.02898684,-0.08795964,0.00080410216,-0.012396252,0.00772922,-0.019206237,0.038812708,0.003869668,-0.03442758,-0.0006104921,-0.0123962965,0.030477481,0.066667706,-0.08731852,-0.048738144,0.011851239,-0.03932849,0.05039122,0.09270586,-0.006570667,-0.054589573,-1.5575528e-32,0.025075588,0.07241342,0.015218339,0.06740951,0.050507743,-0.048186354,-0.0013736133,0.0029528965,0.0704189,-0.06254013,0.0014184437,-0.030882338,-0.02191007,-0.0011236873,0.004348371,0.052932106,0.012129305,0.05835165,0.017020384,0.05338591,-0.054141324,-0.033009075,0.027013382,0.045145277,-0.05292551,0.071663275,0.050395723,0.05313953,0.093085326,0.061666027,-0.024117196,-0.054553214,-0.116268665,0.08070397,0.011171774,-0.060939517,0.017446436,0.009577005,-0.062023964,0.038382906,-0.03159182,-0.009869485,-0.038075194,-0.04469627,-0.022259258,-0.027367214,0.13715099,-0.010865164,-0.066892475,-0.040841788,0.09756239,0.03844231,-0.07428039,0.0420991,0.014535224,-0.0016587273,0.018941276,-0.08137345,-0.056554276,-0.06887763,-0.015455529,0.067699604,-0.00803541,-0.04249744,0.08527798,0.006127307,0.046099413,0.0589351,0.0575485,-0.03798533,-0.11831699,-0.024790175,0.010348993,-0.040473703,0.02195334,0.042708617,-0.046975415,0.030511618,0.008798622,-0.036962073,-0.13696343,0.030570831,-0.080081195,0.00061639084,-0.0048316484,0.0891388,-0.08591475,-0.0020068376,0.052223183,0.032219894,0.060087178,0.012841584,0.048217,0.04043493,-0.00030269034,-4.792927e-08,0.0050022607,-0.0627246,0.00032341725,0.019856816,0.118548185,-0.002588886,0.014018907,-0.07298329,-0.01907083,-0.0070124553,0.11479435,0.10648905,-0.012570349,0.013639126,-0.09284275,0.095965214,0.05293173,0.04307879,0.032048877,-0.01226563,0.0077401767,0.04589624,0.038950138,-0.035957437,-0.06981746,0.036553036,-0.080564044,0.053350966,-0.06445835,0.019872854,0.0599748,-0.020187767,-0.028841197,-0.10702171,0.11380651,-0.056042742,-0.021870667,0.0035105813,-0.035419803,0.042150334,0.037236534,0.004627972,0.042206988,-0.017483842,-0.0149020385,-0.0113371415,0.036833555,-0.019660931,0.021568125,-0.056967355,-0.027970998,-0.038644508,0.05588158,-0.015695002,0.00042326644,0.05005523,0.029205522,0.021738699,-0.032888155,-0.033737134,0.052930865,0.029059907,-0.025947731,-0.01056001]	7
7	[-0.07548863,0.011177989,0.00572841,-0.07071798,-0.077409685,0.019836275,0.027032282,-0.019018551,0.055090558,0.017659614,0.14376761,-0.07165169,0.065250285,-0.04756786,0.024996728,-0.01109366,0.016791105,0.09036219,-0.08030801,-0.097621016,-0.02716974,-0.02775606,-0.007211042,0.032124218,-0.055654325,0.076440945,-0.035714842,0.07537087,-0.04480246,-0.070489,-0.0357589,0.16013137,-0.032435533,-0.018117223,0.0017332145,0.0020727196,-0.011408123,-0.028641408,0.01373567,0.0070076324,-0.04630225,0.022933567,-0.014024246,-0.051511344,0.09282976,-0.024071312,-0.055789843,-0.043552037,0.05891809,-0.08485096,-0.031888988,0.07107989,0.018331788,0.121131875,-0.06981397,-0.049762316,0.014662415,0.028950071,0.124079585,0.021446183,-0.057234656,0.013550103,0.0057495628,-0.0043878113,0.022354448,-0.02306796,-0.115369454,-0.06898789,-0.021600667,0.08908525,-0.014537208,-0.028854184,-0.08486426,0.07643801,-0.05585171,0.042852223,-0.02858606,-0.014014243,-0.026593976,-0.04482209,-0.01421531,0.017059635,0.08316675,-0.06232596,-0.03169983,0.05666977,-0.0039443313,0.0050749136,-0.0050085755,0.0009221466,0.047286358,0.089183494,0.0057355473,-0.018565945,-0.00027003334,-0.074387275,0.02395373,0.018388227,-0.020999353,0.04191041,0.09451901,0.016699072,0.00050388236,-0.041362677,-0.028649889,0.0035935834,0.14646949,-0.009900524,0.038220916,-0.014763991,-0.09287437,0.022826161,-0.012024754,-0.13420044,-0.022637071,0.048169613,0.028223608,-0.011572923,-0.0050202934,0.090821,0.025731437,-0.009390844,-0.048966933,-0.008553502,-0.0023897279,-0.061128404,0.03589581,1.8789541e-32,-0.00078670034,0.009583963,0.029101975,-0.08966778,0.092153296,-0.018268922,-0.02071255,-0.04450541,-0.06093432,0.00092698453,0.022421978,-0.062368017,-0.08498625,-0.033683628,0.052194815,-0.057415985,-0.016821679,-0.11193185,-0.0052780965,-0.006761251,0.041846212,0.0027770204,0.022386946,0.016546203,-0.0014686115,-0.002729841,-0.031530965,-0.036510065,0.010271775,0.047046777,0.03704613,-0.0009741504,-0.048792046,-0.0827105,-0.10136573,-0.01324837,0.017017618,-0.025875188,0.002945729,-0.0059575383,0.042427894,-0.03444513,-0.07284009,0.009935748,0.031249529,0.05013758,-0.009714936,-0.0038637521,0.03157567,-0.008805047,-0.0033177626,-0.0107597355,-0.09699875,0.030934552,0.07187883,-0.008808838,0.03500191,0.0075237853,0.0329643,0.03425605,-0.011810878,0.013380308,-0.016848775,0.035022676,-0.013776624,-0.024545291,-0.019808242,-0.05799773,0.054074515,-0.10326217,-0.07613786,-0.07320227,0.027691843,0.0386971,-0.02898684,-0.08795964,0.00080410216,-0.012396252,0.00772922,-0.019206237,0.038812708,0.003869668,-0.03442758,-0.0006104921,-0.0123962965,0.030477481,0.066667706,-0.08731852,-0.048738144,0.011851239,-0.03932849,0.05039122,0.09270586,-0.006570667,-0.054589573,-1.5575528e-32,0.025075588,0.07241342,0.015218339,0.06740951,0.050507743,-0.048186354,-0.0013736133,0.0029528965,0.0704189,-0.06254013,0.0014184437,-0.030882338,-0.02191007,-0.0011236873,0.004348371,0.052932106,0.012129305,0.05835165,0.017020384,0.05338591,-0.054141324,-0.033009075,0.027013382,0.045145277,-0.05292551,0.071663275,0.050395723,0.05313953,0.093085326,0.061666027,-0.024117196,-0.054553214,-0.116268665,0.08070397,0.011171774,-0.060939517,0.017446436,0.009577005,-0.062023964,0.038382906,-0.03159182,-0.009869485,-0.038075194,-0.04469627,-0.022259258,-0.027367214,0.13715099,-0.010865164,-0.066892475,-0.040841788,0.09756239,0.03844231,-0.07428039,0.0420991,0.014535224,-0.0016587273,0.018941276,-0.08137345,-0.056554276,-0.06887763,-0.015455529,0.067699604,-0.00803541,-0.04249744,0.08527798,0.006127307,0.046099413,0.0589351,0.0575485,-0.03798533,-0.11831699,-0.024790175,0.010348993,-0.040473703,0.02195334,0.042708617,-0.046975415,0.030511618,0.008798622,-0.036962073,-0.13696343,0.030570831,-0.080081195,0.00061639084,-0.0048316484,0.0891388,-0.08591475,-0.0020068376,0.052223183,0.032219894,0.060087178,0.012841584,0.048217,0.04043493,-0.00030269034,-4.792927e-08,0.0050022607,-0.0627246,0.00032341725,0.019856816,0.118548185,-0.002588886,0.014018907,-0.07298329,-0.01907083,-0.0070124553,0.11479435,0.10648905,-0.012570349,0.013639126,-0.09284275,0.095965214,0.05293173,0.04307879,0.032048877,-0.01226563,0.0077401767,0.04589624,0.038950138,-0.035957437,-0.06981746,0.036553036,-0.080564044,0.053350966,-0.06445835,0.019872854,0.0599748,-0.020187767,-0.028841197,-0.10702171,0.11380651,-0.056042742,-0.021870667,0.0035105813,-0.035419803,0.042150334,0.037236534,0.004627972,0.042206988,-0.017483842,-0.0149020385,-0.0113371415,0.036833555,-0.019660931,0.021568125,-0.056967355,-0.027970998,-0.038644508,0.05588158,-0.015695002,0.00042326644,0.05005523,0.029205522,0.021738699,-0.032888155,-0.033737134,0.052930865,0.029059907,-0.025947731,-0.01056001]	7
8	[-0.07548863,0.011177989,0.00572841,-0.07071798,-0.077409685,0.019836275,0.027032282,-0.019018551,0.055090558,0.017659614,0.14376761,-0.07165169,0.065250285,-0.04756786,0.024996728,-0.01109366,0.016791105,0.09036219,-0.08030801,-0.097621016,-0.02716974,-0.02775606,-0.007211042,0.032124218,-0.055654325,0.076440945,-0.035714842,0.07537087,-0.04480246,-0.070489,-0.0357589,0.16013137,-0.032435533,-0.018117223,0.0017332145,0.0020727196,-0.011408123,-0.028641408,0.01373567,0.0070076324,-0.04630225,0.022933567,-0.014024246,-0.051511344,0.09282976,-0.024071312,-0.055789843,-0.043552037,0.05891809,-0.08485096,-0.031888988,0.07107989,0.018331788,0.121131875,-0.06981397,-0.049762316,0.014662415,0.028950071,0.124079585,0.021446183,-0.057234656,0.013550103,0.0057495628,-0.0043878113,0.022354448,-0.02306796,-0.115369454,-0.06898789,-0.021600667,0.08908525,-0.014537208,-0.028854184,-0.08486426,0.07643801,-0.05585171,0.042852223,-0.02858606,-0.014014243,-0.026593976,-0.04482209,-0.01421531,0.017059635,0.08316675,-0.06232596,-0.03169983,0.05666977,-0.0039443313,0.0050749136,-0.0050085755,0.0009221466,0.047286358,0.089183494,0.0057355473,-0.018565945,-0.00027003334,-0.074387275,0.02395373,0.018388227,-0.020999353,0.04191041,0.09451901,0.016699072,0.00050388236,-0.041362677,-0.028649889,0.0035935834,0.14646949,-0.009900524,0.038220916,-0.014763991,-0.09287437,0.022826161,-0.012024754,-0.13420044,-0.022637071,0.048169613,0.028223608,-0.011572923,-0.0050202934,0.090821,0.025731437,-0.009390844,-0.048966933,-0.008553502,-0.0023897279,-0.061128404,0.03589581,1.8789541e-32,-0.00078670034,0.009583963,0.029101975,-0.08966778,0.092153296,-0.018268922,-0.02071255,-0.04450541,-0.06093432,0.00092698453,0.022421978,-0.062368017,-0.08498625,-0.033683628,0.052194815,-0.057415985,-0.016821679,-0.11193185,-0.0052780965,-0.006761251,0.041846212,0.0027770204,0.022386946,0.016546203,-0.0014686115,-0.002729841,-0.031530965,-0.036510065,0.010271775,0.047046777,0.03704613,-0.0009741504,-0.048792046,-0.0827105,-0.10136573,-0.01324837,0.017017618,-0.025875188,0.002945729,-0.0059575383,0.042427894,-0.03444513,-0.07284009,0.009935748,0.031249529,0.05013758,-0.009714936,-0.0038637521,0.03157567,-0.008805047,-0.0033177626,-0.0107597355,-0.09699875,0.030934552,0.07187883,-0.008808838,0.03500191,0.0075237853,0.0329643,0.03425605,-0.011810878,0.013380308,-0.016848775,0.035022676,-0.013776624,-0.024545291,-0.019808242,-0.05799773,0.054074515,-0.10326217,-0.07613786,-0.07320227,0.027691843,0.0386971,-0.02898684,-0.08795964,0.00080410216,-0.012396252,0.00772922,-0.019206237,0.038812708,0.003869668,-0.03442758,-0.0006104921,-0.0123962965,0.030477481,0.066667706,-0.08731852,-0.048738144,0.011851239,-0.03932849,0.05039122,0.09270586,-0.006570667,-0.054589573,-1.5575528e-32,0.025075588,0.07241342,0.015218339,0.06740951,0.050507743,-0.048186354,-0.0013736133,0.0029528965,0.0704189,-0.06254013,0.0014184437,-0.030882338,-0.02191007,-0.0011236873,0.004348371,0.052932106,0.012129305,0.05835165,0.017020384,0.05338591,-0.054141324,-0.033009075,0.027013382,0.045145277,-0.05292551,0.071663275,0.050395723,0.05313953,0.093085326,0.061666027,-0.024117196,-0.054553214,-0.116268665,0.08070397,0.011171774,-0.060939517,0.017446436,0.009577005,-0.062023964,0.038382906,-0.03159182,-0.009869485,-0.038075194,-0.04469627,-0.022259258,-0.027367214,0.13715099,-0.010865164,-0.066892475,-0.040841788,0.09756239,0.03844231,-0.07428039,0.0420991,0.014535224,-0.0016587273,0.018941276,-0.08137345,-0.056554276,-0.06887763,-0.015455529,0.067699604,-0.00803541,-0.04249744,0.08527798,0.006127307,0.046099413,0.0589351,0.0575485,-0.03798533,-0.11831699,-0.024790175,0.010348993,-0.040473703,0.02195334,0.042708617,-0.046975415,0.030511618,0.008798622,-0.036962073,-0.13696343,0.030570831,-0.080081195,0.00061639084,-0.0048316484,0.0891388,-0.08591475,-0.0020068376,0.052223183,0.032219894,0.060087178,0.012841584,0.048217,0.04043493,-0.00030269034,-4.792927e-08,0.0050022607,-0.0627246,0.00032341725,0.019856816,0.118548185,-0.002588886,0.014018907,-0.07298329,-0.01907083,-0.0070124553,0.11479435,0.10648905,-0.012570349,0.013639126,-0.09284275,0.095965214,0.05293173,0.04307879,0.032048877,-0.01226563,0.0077401767,0.04589624,0.038950138,-0.035957437,-0.06981746,0.036553036,-0.080564044,0.053350966,-0.06445835,0.019872854,0.0599748,-0.020187767,-0.028841197,-0.10702171,0.11380651,-0.056042742,-0.021870667,0.0035105813,-0.035419803,0.042150334,0.037236534,0.004627972,0.042206988,-0.017483842,-0.0149020385,-0.0113371415,0.036833555,-0.019660931,0.021568125,-0.056967355,-0.027970998,-0.038644508,0.05588158,-0.015695002,0.00042326644,0.05005523,0.029205522,0.021738699,-0.032888155,-0.033737134,0.052930865,0.029059907,-0.025947731,-0.01056001]	7
13	[-0.024654932,-0.0117638325,0.01559913,-0.08493602,-0.10374555,0.043144833,0.03582733,-0.029909462,0.047083527,0.053018156,0.11598944,-0.06594617,0.010144059,-0.07565763,0.0045349183,-0.007047923,-0.04762662,0.08824178,-0.09929215,-0.07351097,-0.058206026,-0.04935528,-0.029966604,-0.0288529,-0.054795086,0.10351861,-0.032140024,0.04968679,-0.071484186,-0.001744206,-0.028651828,0.14920086,0.011410918,-0.008070921,0.021084806,0.038766358,-0.023239233,-0.009812065,0.0053772754,0.024553973,0.032836035,0.0021701653,0.0027100656,-0.06274118,0.032739665,-0.018586725,-0.0330607,-0.020538116,0.0638201,-0.05718129,-0.0434931,0.12176853,-0.025183167,0.101746246,-0.093625806,-0.012814074,0.03207364,0.06904943,0.043683827,0.02151695,-0.065635845,0.0028497975,-0.025218986,-0.019296903,0.04327939,-0.03619008,-0.08093218,-0.06691238,-0.030926062,0.118244484,0.0028867272,0.0108075095,-0.060723655,0.054987807,-0.059769202,0.057445273,0.026490163,-0.04592921,0.0085172625,-0.041263647,-0.007103025,0.0070303273,0.059675667,-0.07368979,-0.04204917,0.015768917,0.017434213,-0.008274711,-0.011066362,-0.038540598,0.026626665,0.066839494,-0.0721042,-0.056309965,0.031241355,-0.03987397,-0.0049061845,0.044262096,-0.056358498,-0.0055192984,0.101592526,0.02829621,-0.009373086,-0.06328029,-0.050288405,0.0583189,0.09507706,0.036886007,0.032576177,-0.015600421,-0.08644009,0.0034680294,0.0015596695,-0.06705856,-0.017711453,0.013143384,0.019340819,-0.02724758,-0.021441074,0.095211715,-0.024915794,-0.04687782,-0.047371592,-0.00431054,-0.056883596,-0.11615925,0.03719014,1.6193158e-32,-0.0103395535,0.049117234,0.06244295,-0.10396049,0.09168359,-0.037850387,-0.026286919,-0.00031795536,-0.043972224,0.013774436,0.035601683,-0.08813983,-0.052635465,-0.021790594,0.009195201,-0.053915318,-0.019828008,-0.08524324,-0.013909372,-0.011282899,0.027171183,0.044254996,0.03144416,-0.02957451,0.005563434,-0.00037625618,-0.013915763,-0.030514624,0.02517297,0.044515863,0.0146077275,-0.013669978,-0.0066663204,-0.056273863,-0.13584018,-0.017776974,-0.0094268145,-0.018742025,-0.0056755324,-0.01866047,0.026994934,-0.014974822,-0.017340878,0.024982894,-0.019179784,0.06715644,-0.023784097,-0.029042594,0.03356775,0.012278895,0.018836973,-0.041654866,-0.07754806,0.04077909,0.06684489,-0.03657575,0.0496657,0.012874001,0.039679047,0.04072808,0.010970192,-0.0029011557,-0.0136584025,0.0521883,-0.009103051,-0.016292984,-0.011115933,-0.06193306,0.06491434,-0.11425967,-0.09605533,-0.05078479,0.019474762,0.037752375,-0.03925188,-0.045488417,0.020133633,-0.034858886,0.021952713,0.008122741,0.059010725,0.020861488,-0.035896923,-0.043433722,-0.022483593,-0.029164704,0.037896745,-0.07723209,-0.10025437,-0.009356247,0.012719473,0.06532956,0.08130479,-0.032961007,-0.05477499,-1.4005815e-32,0.007785748,0.08144579,0.020027384,0.07918192,0.019167714,-0.010055617,0.047357056,0.015502046,0.0613077,-0.061145186,-7.008301e-05,-0.091805406,-0.019482158,0.012486248,0.037829284,0.025232669,0.017517012,0.095713325,0.03784206,0.04892571,-0.0049034865,-0.02500773,0.01944908,0.075281605,-0.038263693,0.030302795,0.03310306,0.043014333,0.057625443,0.048272192,-0.023057587,-0.08364338,-0.118230954,0.09433681,0.024746919,-0.06583903,0.050509024,0.0045564305,-0.08065163,0.064711474,-0.042550385,-0.012198248,-0.027753817,-0.006728797,-0.027356181,-0.034339786,0.10525463,0.049535744,-0.09371465,-0.021093206,0.08274347,-0.0051175645,-0.08265435,0.040492117,0.017763345,0.018974625,0.012399944,-0.06329728,-0.06941555,-0.054771695,-0.0476747,0.04278843,-0.016980466,-0.08995736,0.07964829,0.04729311,0.08724365,0.018229356,0.02836276,-0.025109915,-0.15911353,-0.040899355,-0.053897858,-0.014276418,-0.003265439,0.039420225,-0.029632423,0.045457587,-0.016031917,-0.023417694,-0.13584714,-0.016046237,-0.06174004,0.0008265143,0.027720867,0.09963072,-0.004376926,-0.063894995,0.033598356,0.035367347,0.08026363,0.0544773,0.060729258,0.051927682,-0.030979676,-4.280987e-08,0.015826188,-0.014943127,-0.011272572,0.0031098716,0.12681638,-0.023116976,0.031236863,-0.03600273,0.017829478,-0.007995061,0.102974884,0.033482473,0.0013404158,-0.001457083,-0.072422035,0.07985238,0.015560735,-0.002224828,0.020840857,-0.013852952,0.031968597,0.051218633,0.034782384,-0.0026490323,-0.052258767,0.04313412,-0.06837175,0.04862814,-0.06965893,0.005848434,0.0685871,-0.027260486,-0.023962222,-0.06902813,0.074171394,-0.061737828,0.04689412,-0.043755397,-0.04034527,0.03398142,0.085737884,0.08802798,0.024552172,0.010107583,0.05392901,0.019393606,0.06885878,-0.012228623,-0.022217862,-0.035180807,-0.074553445,0.024091398,0.019703668,-0.030867727,-0.009693498,-0.014886609,-0.011093179,0.071607046,-0.020795394,0.021818554,0.044565596,0.065208666,-0.0898086,-0.028901737]	11
14	[-0.024654932,-0.0117638325,0.01559913,-0.08493602,-0.10374555,0.043144833,0.03582733,-0.029909462,0.047083527,0.053018156,0.11598944,-0.06594617,0.010144059,-0.07565763,0.0045349183,-0.007047923,-0.04762662,0.08824178,-0.09929215,-0.07351097,-0.058206026,-0.04935528,-0.029966604,-0.0288529,-0.054795086,0.10351861,-0.032140024,0.04968679,-0.071484186,-0.001744206,-0.028651828,0.14920086,0.011410918,-0.008070921,0.021084806,0.038766358,-0.023239233,-0.009812065,0.0053772754,0.024553973,0.032836035,0.0021701653,0.0027100656,-0.06274118,0.032739665,-0.018586725,-0.0330607,-0.020538116,0.0638201,-0.05718129,-0.0434931,0.12176853,-0.025183167,0.101746246,-0.093625806,-0.012814074,0.03207364,0.06904943,0.043683827,0.02151695,-0.065635845,0.0028497975,-0.025218986,-0.019296903,0.04327939,-0.03619008,-0.08093218,-0.06691238,-0.030926062,0.118244484,0.0028867272,0.0108075095,-0.060723655,0.054987807,-0.059769202,0.057445273,0.026490163,-0.04592921,0.0085172625,-0.041263647,-0.007103025,0.0070303273,0.059675667,-0.07368979,-0.04204917,0.015768917,0.017434213,-0.008274711,-0.011066362,-0.038540598,0.026626665,0.066839494,-0.0721042,-0.056309965,0.031241355,-0.03987397,-0.0049061845,0.044262096,-0.056358498,-0.0055192984,0.101592526,0.02829621,-0.009373086,-0.06328029,-0.050288405,0.0583189,0.09507706,0.036886007,0.032576177,-0.015600421,-0.08644009,0.0034680294,0.0015596695,-0.06705856,-0.017711453,0.013143384,0.019340819,-0.02724758,-0.021441074,0.095211715,-0.024915794,-0.04687782,-0.047371592,-0.00431054,-0.056883596,-0.11615925,0.03719014,1.6193158e-32,-0.0103395535,0.049117234,0.06244295,-0.10396049,0.09168359,-0.037850387,-0.026286919,-0.00031795536,-0.043972224,0.013774436,0.035601683,-0.08813983,-0.052635465,-0.021790594,0.009195201,-0.053915318,-0.019828008,-0.08524324,-0.013909372,-0.011282899,0.027171183,0.044254996,0.03144416,-0.02957451,0.005563434,-0.00037625618,-0.013915763,-0.030514624,0.02517297,0.044515863,0.0146077275,-0.013669978,-0.0066663204,-0.056273863,-0.13584018,-0.017776974,-0.0094268145,-0.018742025,-0.0056755324,-0.01866047,0.026994934,-0.014974822,-0.017340878,0.024982894,-0.019179784,0.06715644,-0.023784097,-0.029042594,0.03356775,0.012278895,0.018836973,-0.041654866,-0.07754806,0.04077909,0.06684489,-0.03657575,0.0496657,0.012874001,0.039679047,0.04072808,0.010970192,-0.0029011557,-0.0136584025,0.0521883,-0.009103051,-0.016292984,-0.011115933,-0.06193306,0.06491434,-0.11425967,-0.09605533,-0.05078479,0.019474762,0.037752375,-0.03925188,-0.045488417,0.020133633,-0.034858886,0.021952713,0.008122741,0.059010725,0.020861488,-0.035896923,-0.043433722,-0.022483593,-0.029164704,0.037896745,-0.07723209,-0.10025437,-0.009356247,0.012719473,0.06532956,0.08130479,-0.032961007,-0.05477499,-1.4005815e-32,0.007785748,0.08144579,0.020027384,0.07918192,0.019167714,-0.010055617,0.047357056,0.015502046,0.0613077,-0.061145186,-7.008301e-05,-0.091805406,-0.019482158,0.012486248,0.037829284,0.025232669,0.017517012,0.095713325,0.03784206,0.04892571,-0.0049034865,-0.02500773,0.01944908,0.075281605,-0.038263693,0.030302795,0.03310306,0.043014333,0.057625443,0.048272192,-0.023057587,-0.08364338,-0.118230954,0.09433681,0.024746919,-0.06583903,0.050509024,0.0045564305,-0.08065163,0.064711474,-0.042550385,-0.012198248,-0.027753817,-0.006728797,-0.027356181,-0.034339786,0.10525463,0.049535744,-0.09371465,-0.021093206,0.08274347,-0.0051175645,-0.08265435,0.040492117,0.017763345,0.018974625,0.012399944,-0.06329728,-0.06941555,-0.054771695,-0.0476747,0.04278843,-0.016980466,-0.08995736,0.07964829,0.04729311,0.08724365,0.018229356,0.02836276,-0.025109915,-0.15911353,-0.040899355,-0.053897858,-0.014276418,-0.003265439,0.039420225,-0.029632423,0.045457587,-0.016031917,-0.023417694,-0.13584714,-0.016046237,-0.06174004,0.0008265143,0.027720867,0.09963072,-0.004376926,-0.063894995,0.033598356,0.035367347,0.08026363,0.0544773,0.060729258,0.051927682,-0.030979676,-4.280987e-08,0.015826188,-0.014943127,-0.011272572,0.0031098716,0.12681638,-0.023116976,0.031236863,-0.03600273,0.017829478,-0.007995061,0.102974884,0.033482473,0.0013404158,-0.001457083,-0.072422035,0.07985238,0.015560735,-0.002224828,0.020840857,-0.013852952,0.031968597,0.051218633,0.034782384,-0.0026490323,-0.052258767,0.04313412,-0.06837175,0.04862814,-0.06965893,0.005848434,0.0685871,-0.027260486,-0.023962222,-0.06902813,0.074171394,-0.061737828,0.04689412,-0.043755397,-0.04034527,0.03398142,0.085737884,0.08802798,0.024552172,0.010107583,0.05392901,0.019393606,0.06885878,-0.012228623,-0.022217862,-0.035180807,-0.074553445,0.024091398,0.019703668,-0.030867727,-0.009693498,-0.014886609,-0.011093179,0.071607046,-0.020795394,0.021818554,0.044565596,0.065208666,-0.0898086,-0.028901737]	11
15	[-0.024654932,-0.0117638325,0.01559913,-0.08493602,-0.10374555,0.043144833,0.03582733,-0.029909462,0.047083527,0.053018156,0.11598944,-0.06594617,0.010144059,-0.07565763,0.0045349183,-0.007047923,-0.04762662,0.08824178,-0.09929215,-0.07351097,-0.058206026,-0.04935528,-0.029966604,-0.0288529,-0.054795086,0.10351861,-0.032140024,0.04968679,-0.071484186,-0.001744206,-0.028651828,0.14920086,0.011410918,-0.008070921,0.021084806,0.038766358,-0.023239233,-0.009812065,0.0053772754,0.024553973,0.032836035,0.0021701653,0.0027100656,-0.06274118,0.032739665,-0.018586725,-0.0330607,-0.020538116,0.0638201,-0.05718129,-0.0434931,0.12176853,-0.025183167,0.101746246,-0.093625806,-0.012814074,0.03207364,0.06904943,0.043683827,0.02151695,-0.065635845,0.0028497975,-0.025218986,-0.019296903,0.04327939,-0.03619008,-0.08093218,-0.06691238,-0.030926062,0.118244484,0.0028867272,0.0108075095,-0.060723655,0.054987807,-0.059769202,0.057445273,0.026490163,-0.04592921,0.0085172625,-0.041263647,-0.007103025,0.0070303273,0.059675667,-0.07368979,-0.04204917,0.015768917,0.017434213,-0.008274711,-0.011066362,-0.038540598,0.026626665,0.066839494,-0.0721042,-0.056309965,0.031241355,-0.03987397,-0.0049061845,0.044262096,-0.056358498,-0.0055192984,0.101592526,0.02829621,-0.009373086,-0.06328029,-0.050288405,0.0583189,0.09507706,0.036886007,0.032576177,-0.015600421,-0.08644009,0.0034680294,0.0015596695,-0.06705856,-0.017711453,0.013143384,0.019340819,-0.02724758,-0.021441074,0.095211715,-0.024915794,-0.04687782,-0.047371592,-0.00431054,-0.056883596,-0.11615925,0.03719014,1.6193158e-32,-0.0103395535,0.049117234,0.06244295,-0.10396049,0.09168359,-0.037850387,-0.026286919,-0.00031795536,-0.043972224,0.013774436,0.035601683,-0.08813983,-0.052635465,-0.021790594,0.009195201,-0.053915318,-0.019828008,-0.08524324,-0.013909372,-0.011282899,0.027171183,0.044254996,0.03144416,-0.02957451,0.005563434,-0.00037625618,-0.013915763,-0.030514624,0.02517297,0.044515863,0.0146077275,-0.013669978,-0.0066663204,-0.056273863,-0.13584018,-0.017776974,-0.0094268145,-0.018742025,-0.0056755324,-0.01866047,0.026994934,-0.014974822,-0.017340878,0.024982894,-0.019179784,0.06715644,-0.023784097,-0.029042594,0.03356775,0.012278895,0.018836973,-0.041654866,-0.07754806,0.04077909,0.06684489,-0.03657575,0.0496657,0.012874001,0.039679047,0.04072808,0.010970192,-0.0029011557,-0.0136584025,0.0521883,-0.009103051,-0.016292984,-0.011115933,-0.06193306,0.06491434,-0.11425967,-0.09605533,-0.05078479,0.019474762,0.037752375,-0.03925188,-0.045488417,0.020133633,-0.034858886,0.021952713,0.008122741,0.059010725,0.020861488,-0.035896923,-0.043433722,-0.022483593,-0.029164704,0.037896745,-0.07723209,-0.10025437,-0.009356247,0.012719473,0.06532956,0.08130479,-0.032961007,-0.05477499,-1.4005815e-32,0.007785748,0.08144579,0.020027384,0.07918192,0.019167714,-0.010055617,0.047357056,0.015502046,0.0613077,-0.061145186,-7.008301e-05,-0.091805406,-0.019482158,0.012486248,0.037829284,0.025232669,0.017517012,0.095713325,0.03784206,0.04892571,-0.0049034865,-0.02500773,0.01944908,0.075281605,-0.038263693,0.030302795,0.03310306,0.043014333,0.057625443,0.048272192,-0.023057587,-0.08364338,-0.118230954,0.09433681,0.024746919,-0.06583903,0.050509024,0.0045564305,-0.08065163,0.064711474,-0.042550385,-0.012198248,-0.027753817,-0.006728797,-0.027356181,-0.034339786,0.10525463,0.049535744,-0.09371465,-0.021093206,0.08274347,-0.0051175645,-0.08265435,0.040492117,0.017763345,0.018974625,0.012399944,-0.06329728,-0.06941555,-0.054771695,-0.0476747,0.04278843,-0.016980466,-0.08995736,0.07964829,0.04729311,0.08724365,0.018229356,0.02836276,-0.025109915,-0.15911353,-0.040899355,-0.053897858,-0.014276418,-0.003265439,0.039420225,-0.029632423,0.045457587,-0.016031917,-0.023417694,-0.13584714,-0.016046237,-0.06174004,0.0008265143,0.027720867,0.09963072,-0.004376926,-0.063894995,0.033598356,0.035367347,0.08026363,0.0544773,0.060729258,0.051927682,-0.030979676,-4.280987e-08,0.015826188,-0.014943127,-0.011272572,0.0031098716,0.12681638,-0.023116976,0.031236863,-0.03600273,0.017829478,-0.007995061,0.102974884,0.033482473,0.0013404158,-0.001457083,-0.072422035,0.07985238,0.015560735,-0.002224828,0.020840857,-0.013852952,0.031968597,0.051218633,0.034782384,-0.0026490323,-0.052258767,0.04313412,-0.06837175,0.04862814,-0.06965893,0.005848434,0.0685871,-0.027260486,-0.023962222,-0.06902813,0.074171394,-0.061737828,0.04689412,-0.043755397,-0.04034527,0.03398142,0.085737884,0.08802798,0.024552172,0.010107583,0.05392901,0.019393606,0.06885878,-0.012228623,-0.022217862,-0.035180807,-0.074553445,0.024091398,0.019703668,-0.030867727,-0.009693498,-0.014886609,-0.011093179,0.071607046,-0.020795394,0.021818554,0.044565596,0.065208666,-0.0898086,-0.028901737]	11
16	[-0.024654932,-0.0117638325,0.01559913,-0.08493602,-0.10374555,0.043144833,0.03582733,-0.029909462,0.047083527,0.053018156,0.11598944,-0.06594617,0.010144059,-0.07565763,0.0045349183,-0.007047923,-0.04762662,0.08824178,-0.09929215,-0.07351097,-0.058206026,-0.04935528,-0.029966604,-0.0288529,-0.054795086,0.10351861,-0.032140024,0.04968679,-0.071484186,-0.001744206,-0.028651828,0.14920086,0.011410918,-0.008070921,0.021084806,0.038766358,-0.023239233,-0.009812065,0.0053772754,0.024553973,0.032836035,0.0021701653,0.0027100656,-0.06274118,0.032739665,-0.018586725,-0.0330607,-0.020538116,0.0638201,-0.05718129,-0.0434931,0.12176853,-0.025183167,0.101746246,-0.093625806,-0.012814074,0.03207364,0.06904943,0.043683827,0.02151695,-0.065635845,0.0028497975,-0.025218986,-0.019296903,0.04327939,-0.03619008,-0.08093218,-0.06691238,-0.030926062,0.118244484,0.0028867272,0.0108075095,-0.060723655,0.054987807,-0.059769202,0.057445273,0.026490163,-0.04592921,0.0085172625,-0.041263647,-0.007103025,0.0070303273,0.059675667,-0.07368979,-0.04204917,0.015768917,0.017434213,-0.008274711,-0.011066362,-0.038540598,0.026626665,0.066839494,-0.0721042,-0.056309965,0.031241355,-0.03987397,-0.0049061845,0.044262096,-0.056358498,-0.0055192984,0.101592526,0.02829621,-0.009373086,-0.06328029,-0.050288405,0.0583189,0.09507706,0.036886007,0.032576177,-0.015600421,-0.08644009,0.0034680294,0.0015596695,-0.06705856,-0.017711453,0.013143384,0.019340819,-0.02724758,-0.021441074,0.095211715,-0.024915794,-0.04687782,-0.047371592,-0.00431054,-0.056883596,-0.11615925,0.03719014,1.6193158e-32,-0.0103395535,0.049117234,0.06244295,-0.10396049,0.09168359,-0.037850387,-0.026286919,-0.00031795536,-0.043972224,0.013774436,0.035601683,-0.08813983,-0.052635465,-0.021790594,0.009195201,-0.053915318,-0.019828008,-0.08524324,-0.013909372,-0.011282899,0.027171183,0.044254996,0.03144416,-0.02957451,0.005563434,-0.00037625618,-0.013915763,-0.030514624,0.02517297,0.044515863,0.0146077275,-0.013669978,-0.0066663204,-0.056273863,-0.13584018,-0.017776974,-0.0094268145,-0.018742025,-0.0056755324,-0.01866047,0.026994934,-0.014974822,-0.017340878,0.024982894,-0.019179784,0.06715644,-0.023784097,-0.029042594,0.03356775,0.012278895,0.018836973,-0.041654866,-0.07754806,0.04077909,0.06684489,-0.03657575,0.0496657,0.012874001,0.039679047,0.04072808,0.010970192,-0.0029011557,-0.0136584025,0.0521883,-0.009103051,-0.016292984,-0.011115933,-0.06193306,0.06491434,-0.11425967,-0.09605533,-0.05078479,0.019474762,0.037752375,-0.03925188,-0.045488417,0.020133633,-0.034858886,0.021952713,0.008122741,0.059010725,0.020861488,-0.035896923,-0.043433722,-0.022483593,-0.029164704,0.037896745,-0.07723209,-0.10025437,-0.009356247,0.012719473,0.06532956,0.08130479,-0.032961007,-0.05477499,-1.4005815e-32,0.007785748,0.08144579,0.020027384,0.07918192,0.019167714,-0.010055617,0.047357056,0.015502046,0.0613077,-0.061145186,-7.008301e-05,-0.091805406,-0.019482158,0.012486248,0.037829284,0.025232669,0.017517012,0.095713325,0.03784206,0.04892571,-0.0049034865,-0.02500773,0.01944908,0.075281605,-0.038263693,0.030302795,0.03310306,0.043014333,0.057625443,0.048272192,-0.023057587,-0.08364338,-0.118230954,0.09433681,0.024746919,-0.06583903,0.050509024,0.0045564305,-0.08065163,0.064711474,-0.042550385,-0.012198248,-0.027753817,-0.006728797,-0.027356181,-0.034339786,0.10525463,0.049535744,-0.09371465,-0.021093206,0.08274347,-0.0051175645,-0.08265435,0.040492117,0.017763345,0.018974625,0.012399944,-0.06329728,-0.06941555,-0.054771695,-0.0476747,0.04278843,-0.016980466,-0.08995736,0.07964829,0.04729311,0.08724365,0.018229356,0.02836276,-0.025109915,-0.15911353,-0.040899355,-0.053897858,-0.014276418,-0.003265439,0.039420225,-0.029632423,0.045457587,-0.016031917,-0.023417694,-0.13584714,-0.016046237,-0.06174004,0.0008265143,0.027720867,0.09963072,-0.004376926,-0.063894995,0.033598356,0.035367347,0.08026363,0.0544773,0.060729258,0.051927682,-0.030979676,-4.280987e-08,0.015826188,-0.014943127,-0.011272572,0.0031098716,0.12681638,-0.023116976,0.031236863,-0.03600273,0.017829478,-0.007995061,0.102974884,0.033482473,0.0013404158,-0.001457083,-0.072422035,0.07985238,0.015560735,-0.002224828,0.020840857,-0.013852952,0.031968597,0.051218633,0.034782384,-0.0026490323,-0.052258767,0.04313412,-0.06837175,0.04862814,-0.06965893,0.005848434,0.0685871,-0.027260486,-0.023962222,-0.06902813,0.074171394,-0.061737828,0.04689412,-0.043755397,-0.04034527,0.03398142,0.085737884,0.08802798,0.024552172,0.010107583,0.05392901,0.019393606,0.06885878,-0.012228623,-0.022217862,-0.035180807,-0.074553445,0.024091398,0.019703668,-0.030867727,-0.009693498,-0.014886609,-0.011093179,0.071607046,-0.020795394,0.021818554,0.044565596,0.065208666,-0.0898086,-0.028901737]	11
\.


--
-- Data for Name: product_image_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_image_embeddings ("productImageEmbeddingId", embedding, upload_image_id, product_id) FROM stdin;
1	[0.24945346,0.3950606,0.029074073,0.06791985,0.4705719,-0.3515502,0.4905999,-0.18265274,0.17261532,-0.19652894,-0.23843162,0.29169542,0.54558736,0.24833228,-0.028533041,-0.2183239,0.97577494,0.35100934,-0.022106018,-0.34926632,-0.0938003,-0.023198362,0.14287326,0.5388903,0.10140409,0.25053492,0.449231,-0.22710812,0.07477601,-0.18150067,-0.28913155,-0.05370797,-0.13274571,0.018514948,-0.38128746,-0.81730264,0.009814507,-0.19759022,-0.43188933,-0.4123036,-0.1885105,0.21174772,-0.33788323,-0.10009808,0.17913797,-0.031982504,0.23638794,-0.47653958,-0.32633233,-0.034140334,0.26066175,0.015374285,-0.059053775,0.063914604,-0.34462285,-0.64712864,0.018939322,0.09030875,0.6452124,-0.051492352,0.42855057,-0.08603327,-0.05448678,0.026582912,0.16746145,-0.05505759,-0.5093072,0.11805088,0.19454871,-0.14818974,-0.15351687,-0.29677445,0.13086754,-0.42346725,0.3374287,0.5591285,-0.17358185,0.068037786,0.4233346,-0.09707704,0.11810451,-0.42119598,-0.4266806,0.060327027,0.0665154,-0.36534053,-1.1157484,0.37937897,0.12983027,0.07911786,-0.008589944,-0.21066152,-4.969574,-0.08603952,0.26759857,1.0100917,0.43394235,0.2618362,0.063972235,0.4184238,0.44593006,-0.19239397,0.21687844,0.34664237,-0.38634133,0.14962102,-2.1879659,0.031086534,0.37386373,0.02482097,0.09656745,-0.06417904,0.30666554,-0.01926975,0.24042693,0.27113962,-0.030043812,-0.28303602,-0.715648,-0.4751971,0.013001166,0.30480832,-0.44350317,0.32467103,0.36017734,0.02048139,-0.2967266,0.5535787,0.08127849,0.08008355,0.35890046,-0.32724878,-0.40533593,0.79822505,0.14993455,0.13913757,0.10255293,-0.058681075,-0.16775244,-0.10441611,-0.2560895,0.17054893,-0.153921,0.04528886,-0.62626386,-0.31649518,-0.3444224,0.02146068,-0.2610363,-0.11245976,0.041045822,0.21892463,-0.8794255,-0.021017786,0.044995327,-0.516422,-0.33082628,0.13281967,0.71977127,0.45978242,-0.028719045,0.27815574,0.017655747,0.1438664,0.2410665,-0.07864085,0.105295554,0.20750871,0.048422437,-0.36002162,0.20449223,0.24747802,0.35783768,0.24770382,-0.094248,0.5115937,-1.4205407,0.12860121,0.005923807,-0.12672545,0.35839757,0.13516735,0.12605296,-0.24954303,-0.25394842,0.16481142,0.14825849,-0.11556944,-0.14818548,-0.20096959,0.270424,-0.40941912,0.48396835,0.2301137,-0.8153119,0.2620504,-0.5149065,-0.16261798,-0.014722687,0.2962438,0.25866598,0.1858511,-0.17627546,-0.26407933,0.013281314,0.1265141,0.4035742,0.45234314,-0.30262336,0.49188828,-0.070534065,-0.325259,-0.21160445,-0.45089737,-0.4050579,0.03717022,0.032788936,-0.20130268,0.05376307,-0.026849324,0.0061051743,-0.26759073,0.36409545,0.06165134,-0.06046031,-0.064521015,-0.10108072,-0.5244121,-0.25020784,-0.19785105,-0.06300605,0.6738394,-0.22933987,0.07127157,0.4519022,0.16655406,-0.13547257,0.51395595,-0.31629726,-0.055179823,-0.35890266,-0.23855639,0.07755013,-0.19174983,0.14827947,0.13947259,-0.014416407,-0.026140481,-0.42236504,-0.5807442,0.14443694,-0.06561995,0.07778938,0.14683238,0.40733698,0.352983,-0.23144846,-0.056741845,-2.0402253,0.14148834,0.123571835,0.069311514,-0.20202778,-1.3194648,0.35894123,-0.14195016,0.28349406,0.27022657,-0.13626604,0.28618202,-0.059457563,0.18348597,-0.08822946,-0.21895874,-0.035158016,-0.27216238,0.4463274,0.2737776,-0.09760035,0.49830166,0.32938576,0.04338191,-0.11205183,0.15246072,0.28021452,0.015919652,1.7816908,0.009854968,0.10026035,0.056664344,0.25085065,0.038580876,-0.17740768,0.1660444,-0.65073365,0.21995746,-0.026678411,-0.23345654,0.4628609,0.43269372,-0.5268932,0.15420172,0.38743553,-0.28292108,-0.0340613,-0.42194128,-0.053300478,-0.027818732,0.3486157,-0.035159685,0.06430567,-0.2120943,0.79311705,-0.28668496,-0.1327908,-0.08891857,0.32637224,0.18446231,0.1365088,0.3694505,0.4840881,1.9118174,0.20896128,-0.4482512,0.38160518,-0.18490858,0.1407972,-0.061823037,-0.108526476,-0.56747746,-0.3156308,0.3664081,0.14169984,0.045757357,0.2685966,0.47875065,-0.020384157,0.3327079,0.4054548,0.04161816,0.0808438,0.03113777,-0.104710214,-0.0569889,0.1485381,-0.06699986,0.57855356,-0.22503333,0.27816394,-0.10611381,-0.31807035,-0.032991197,0.59553707,-0.15432665,0.03332843,-0.15445383,-0.7617136,0.73072,-0.11775583,-0.6411415,0.25888664,-0.74459827,-0.19778219,0.21458806,-0.3181461,-0.16175976,0.260581,0.2713323,0.2498131,-0.09491109,0.120281994,0.11439968,-0.08408535,0.24802077,0.18971938,0.16824514,1.0069597,0.0043312144,0.1441944,0.11887162,0.31131178,-0.009600072,0.3779546,-0.1827684,0.22571714,0.15620326,0.17890507,-0.28594893,0.20873392,-0.53581464,-0.23114358,-0.5035792,0.3810111,-0.5004123,-0.04768717,0.3252574,-0.14530434,0.5411804,-0.3757386,-1.070852,-0.19560872,0.060256653,-0.113393106,0.11721445,-0.11723443,-0.26455992,0.3289829,-0.25210533,-0.12586907,0.36050743,0.45456138,0.2266935,0.72942173,0.38193417,-0.43868983,0.19500731,-0.12733264,0.48714516,-0.33343855,-0.5639275,0.18274939,0.13218296,-0.03516177,-0.07162696,0.29673874,0.4270275,-0.23854256,0.39347667,0.7475887,-0.21280368,-0.22470854,0.026377589,-0.18863812,-0.863966,0.26120934,-0.6025376,-0.337755,-0.2498703,0.2936687,-0.49062952,0.119994536,0.19605635,0.3599173,0.21304883,-0.07724286,-0.38860187,-0.0024920935,0.2513339,0.026629383,-0.24332596,-0.22767866,0.24194686,0.32526588,-0.1880292,0.5688964,-0.36631486,-0.8932083,-0.0021394426,-0.3540724,-0.10653713,-0.19766605,0.30727068,0.685029,-0.33194226,-0.15184347,0.078184575,-0.54537874,0.095202506,0.08662382,-0.021208223,-0.012909169,-0.033080757,0.07981541,-0.7019079,0.11818349,0.20146301,0.31169817,-0.13241638,-0.004034414,-0.30080366,0.0661923,-0.72727257,0.27191147,-0.2304296,0.17324376,0.04397022,0.21421212,-0.16415703,-0.31013164,-0.23309255,0.5765459,0.28046548,-0.006738383,-0.10607964,0.09528742,0.2403662,0.16985855,0.39837328,0.07370617,-0.2577519,0.67152286,-0.39505705,0.029276207,0.13574739,0.00062151096,-0.38967687,-0.5066487,-0.35718146,-0.34945518,-0.39250803,0.21655317,-0.060212947]	11	2
2	[-0.078544304,0.38041753,0.14655426,0.39381474,0.59480804,-0.35112303,0.23109126,0.18657392,-0.21789312,-0.76970506,0.2854521,0.14204836,0.51065356,-0.062399425,0.22539008,-0.14885631,1.227036,0.277664,-0.1688313,-0.49096996,0.16743901,0.12316566,0.43417445,0.2751742,0.067389734,0.16396105,0.30069077,-0.26825944,-0.08640299,-0.22529426,-0.0016832382,-0.12978905,-0.047113176,-0.26340356,-0.22547533,-0.48369306,-0.110619806,-5.542956e-05,-0.22572972,-0.20878044,-0.48527464,-0.07821335,0.05730647,-0.1036243,0.11873217,-0.54939884,0.36255965,-0.5924521,-0.21799216,-0.20694624,-0.06139662,-0.5110314,0.019095795,0.15983912,-0.31491002,-0.004698814,0.1719251,0.35593966,0.41350973,0.007290737,0.66675407,-0.36148095,-0.18260881,-0.044235677,0.30657765,-0.66134727,-0.2639198,-0.118760474,-0.032782406,-0.09479214,0.031500995,-0.41865882,0.23383191,-0.745808,0.37202463,0.25988463,-0.02510476,-0.0887389,0.50871116,-0.20789571,0.012168671,-0.12920478,0.07601646,0.49515963,-0.22100908,-0.026926715,-1.3766454,0.1918084,-0.22692472,-0.3778183,0.4674484,-0.14925088,-5.4991827,-0.17743175,0.0727823,0.47675005,0.54965836,0.3002937,-0.08415853,0.906342,0.15067393,-0.2180672,-0.09677099,0.4905521,0.0027663475,-0.334179,-1.8835329,0.12389125,0.66190857,-0.47629482,0.012319556,0.058209784,0.32441133,-0.13190013,0.37822273,-0.035921562,-0.2109975,-0.06586634,-0.5805911,-0.48616138,0.06349134,0.11883454,-0.15005712,-0.2244535,0.17240413,0.19251592,-0.23731804,0.28781277,0.06490183,0.047907107,0.36922166,-0.37020028,-0.23440693,0.76799315,0.54271513,-0.10926073,-0.26494595,-0.33813152,-0.048881117,-0.3601594,-0.19474803,0.15033093,0.08007533,-0.18213229,-0.7470932,0.1567565,-0.08136025,0.16299997,-0.34390423,-0.39605555,-0.12291984,0.15276505,-0.8191578,-0.16736127,-0.39235568,-0.3900326,0.0003033416,0.09091453,0.46037883,0.10302773,-0.18634112,0.14932683,-0.11405316,0.03406549,0.35531488,0.0630796,0.021498892,-0.22584477,0.09262518,-0.062063206,-0.048164904,0.37964284,0.07406407,0.72795373,-0.09921852,0.21961446,-1.725841,-0.25878018,-0.19574977,-0.21071579,0.17642763,0.17238905,0.09245415,-0.23605828,-0.23080327,0.3873374,0.33763638,0.062288072,0.055292916,-0.34807158,0.32955107,-0.23147537,0.10727935,0.23885947,-0.7434236,-0.09416806,-0.1614999,-0.10273509,-0.5927105,0.039255206,0.0031339908,0.10075972,0.08825385,0.1209801,-0.13022263,0.052255448,0.5656944,0.13927892,-0.34518117,0.5890218,0.2884847,0.04957517,-0.0011720116,-0.2985784,-0.6231844,0.047589,0.36562893,-0.06780123,-0.40684515,0.070359275,-0.14078277,-0.15447323,0.2065522,-0.04386619,-0.012220865,0.13812591,-0.5676051,-0.67216545,-0.04627221,-0.12057782,0.14535323,0.6095924,0.23032068,0.49118704,0.40583235,-0.1713661,-0.119336486,0.24718118,0.04469698,0.2766913,-0.05267226,0.056842454,0.044385653,-0.3355421,0.13237391,0.021130575,0.024091095,-0.14416598,-0.53168297,-0.3595469,-0.31243628,0.4573094,-0.11329095,-0.05484093,0.11144938,0.31709737,-0.50038916,0.055514593,-1.8025801,0.17494959,0.07654698,0.23263018,0.08482894,-1.9801043,0.22203761,0.121608526,0.3969123,-0.26993036,-0.32011774,0.02565752,-0.2585422,0.15163481,-0.14064033,0.08491112,0.12296026,-0.1908644,0.59331936,0.18619934,-0.28540233,-0.0058401898,0.004162648,-0.16162604,-0.43462807,0.12843092,0.24302125,-0.1511509,1.3101096,0.015827915,0.053549387,0.303577,0.1005655,0.017066134,-0.25150418,-0.03393183,-0.17129461,0.64353377,-0.3161984,-0.09825685,0.32583922,-0.039969884,-0.23897019,0.22883466,0.42671314,-0.108583964,-0.15824999,-0.5620362,-0.1817698,0.06295892,0.4880602,-0.11496504,0.09071486,-0.17792186,0.76073647,0.039558463,-0.17805634,-0.24536939,0.1390829,-0.46640074,0.2068138,0.044737555,0.57055396,1.9447765,0.08654058,-0.3749498,0.36458108,-0.5535924,0.30061626,0.19092017,-0.16536032,-0.61510557,-0.22194001,0.03987886,0.3676996,0.37126246,-0.16070014,0.17680845,0.039759357,0.36336154,0.15500768,-0.0933901,-0.21117423,-0.23433022,-0.24647625,-0.2656937,-0.019359304,-0.05783393,0.685498,-0.4211434,0.043851152,-0.0628217,-0.08128139,0.06940769,0.49039653,-0.00782223,0.23994252,-0.0416232,-0.5270998,0.28032315,0.21096773,-0.5708533,0.46629834,-0.3249635,0.103344634,0.21402459,0.4352144,-0.379803,0.06816724,0.20176488,0.28393596,0.1999877,0.18786176,0.18939342,0.13831948,0.1906656,-0.14421009,0.52738774,0.42005035,0.27077276,0.5978729,0.33011255,0.31385306,-0.59908664,0.35282454,0.18396613,0.18728304,-0.23533727,0.29007468,-0.15207744,0.0409672,-0.15719011,-0.25137013,-0.52391213,0.38301906,-0.6325401,-0.40062845,0.57513434,0.1755137,-0.0122477105,-0.0665866,-0.7176042,-0.26223427,0.23103821,-0.09722267,-0.07725876,-0.25881043,-0.17553957,0.08952026,-0.16924748,-0.082274504,0.19309431,0.13830687,0.5679734,0.79202706,0.0003535807,-0.14643808,0.13316633,0.03340104,0.3457973,-0.20719953,-0.41860998,0.39582515,0.12876675,0.019583821,-0.3616933,-0.017429518,0.32664472,-0.19245829,0.24560603,0.59989375,-0.34469742,-0.24880406,-0.030041734,-0.30671564,-0.69077814,0.44645318,-0.320912,-0.13604131,-0.34226966,0.070567355,-0.22538865,0.3338498,0.023221409,0.21806945,0.1046545,0.08422352,0.2814233,-0.11593994,0.24381055,-0.29448316,-0.2498698,0.0681887,0.671306,0.25852823,-0.10301713,0.20115636,-0.012590187,-0.58736247,-0.005841324,-0.046556193,-0.07039814,-0.46167704,0.13043039,0.88806033,-0.38876948,0.14024678,0.027134504,-0.58818674,0.06949924,0.0011069857,0.22022755,0.057183508,0.0665922,-0.06391822,-0.22306594,-0.16160086,-0.21176264,0.3992958,0.25860286,0.015783228,-0.44677296,-0.088949375,-0.5505587,-0.06708683,-0.24659394,-0.1076164,-0.3269241,0.4518471,-0.3393067,-0.041786615,-0.6818043,0.33098474,0.04523689,0.3996628,-0.4457635,0.038269028,0.27258444,-0.04572321,0.25999483,0.062279463,-0.07960572,0.79175967,-0.057991542,0.011166581,0.51291007,-0.089663826,-0.2196599,-0.4991468,-0.35995355,-0.10412285,-0.13400927,0.31594217,-0.04023432]	12	2
3	[0.2399012,0.25113094,-0.11609788,-0.035584256,0.49421364,-0.58806914,0.5655668,-0.011299283,0.38989508,-0.28595167,-0.015703432,0.3329509,0.5411457,-0.10009767,0.06637231,-0.34464842,0.96591806,0.07228507,-0.12906146,-0.118875496,0.24989282,-0.00062959275,-0.09431302,0.2797632,0.16104072,0.20511004,0.05406919,-0.06344843,-0.030592073,-0.3174643,-0.022670636,0.019109955,-0.011643429,0.025793683,-0.33918524,-0.71512175,-0.19820884,-0.172827,-0.26506314,-0.42654553,-0.2818553,0.15668356,-0.32494155,-0.11185247,0.21878079,-0.36764497,0.5302876,-0.7314341,-0.4800054,-0.09368106,-0.046862274,-0.18456803,-0.20149684,-0.064574,-0.34060314,-0.13180603,-0.13549927,-0.0220332,0.688753,-0.17697792,0.6110115,-0.08754149,-0.30211738,-0.06948467,0.27450958,0.0078763105,-0.47951084,-0.21311079,0.101287074,-0.25544783,-0.15461226,-0.3163649,0.23033138,-0.5365018,0.20421386,0.44986635,0.04454704,0.09224915,0.3780304,-0.40845358,0.054216865,-0.11483252,-0.34282705,0.5907817,-0.011941827,-0.27287143,-0.98676527,0.1889237,-0.15067846,-0.37532905,0.3376412,-0.07384177,-5.6114025,-0.14761059,0.0024281202,0.47147498,0.36230507,0.3701819,0.060440674,0.5289716,0.2279781,-0.109499246,0.24190322,0.43572867,-0.28571367,-0.15376353,-2.5432358,0.07320487,0.46781352,-0.46037012,0.08142942,-0.27834466,0.29851732,-0.080526456,0.25183845,0.12185752,-0.28881136,-0.15254271,-0.70744896,-0.45657444,-0.23913646,0.059654996,-0.06686075,0.0017898444,0.2505554,0.0011506627,-0.19755363,0.5819934,0.36822596,0.12743491,0.20883101,-0.7641786,-0.5879744,0.75596315,0.37084368,0.10673318,-0.12709133,-0.42788407,-0.27633646,-0.014345676,0.18654521,-0.17583238,-0.11157106,-0.3928367,-0.6309323,-0.324439,0.050395038,-0.046270587,-0.34093374,-0.20803988,-0.1986051,0.43898338,-0.8416273,0.11407081,-0.22495763,-0.38802618,0.056614663,0.47958744,0.63855594,0.09495843,0.16484132,0.11116338,-0.016963104,0.25256628,0.3159104,-0.0060709342,0.16075712,0.07446522,0.02430819,-0.18752769,0.037265576,0.26639932,-0.00022490225,0.25614685,-0.05872555,0.3540927,-1.7225839,-0.13168271,-0.35992506,-0.09881228,0.18064485,0.35810027,0.28224036,-0.12727489,-0.1978303,0.5215404,0.45721483,-0.11068044,-0.14230406,-0.23966362,0.31706408,-0.1312489,0.29397053,0.0007645726,-0.6009363,0.17099412,-0.4778312,0.0796489,-0.27960482,0.13442591,0.13063486,0.092563815,0.14162879,0.10878467,0.09469734,-0.014924538,0.5529892,0.20010658,-0.2831452,0.48989877,0.01910922,-0.20064227,-0.09079883,-0.4100264,-0.6071129,0.42964372,-0.045659117,-0.19903849,-0.024731698,0.034733597,-0.1763458,-0.24507353,0.20025721,0.021965057,-0.13997257,0.057330783,-0.1539071,-0.33093375,-0.30073324,-0.20588522,-0.19615681,0.76416624,-0.07051522,0.3109249,0.60299087,0.196971,-0.1934196,-0.002261702,-0.1984841,0.08541938,-0.33854476,-0.29925552,0.1498556,-0.22092722,0.16246647,-0.009650136,-0.040404066,-0.23817128,-0.24698108,-0.2707878,-0.032797735,0.16667385,0.1103615,0.03377365,0.2863735,0.17199959,-0.38516963,0.1541061,-1.9508438,0.047797855,0.3964873,0.21201152,-0.20280327,-1.7293595,0.22952114,-0.21905918,0.30987784,0.15126099,-0.13559857,0.10856414,-0.07018716,0.15118285,-0.43810853,-0.08698855,0.0021264052,-0.19357583,0.59938765,0.533401,-0.39423177,0.20029688,0.053882122,-0.035849683,-0.5054888,0.22374474,0.10462765,0.32126722,1.7155758,-0.08100747,0.411497,0.2878023,-0.12493986,0.08347438,-0.11489612,0.073283084,-0.75477827,0.35318017,-0.20081986,0.025752608,0.432381,0.26469636,-0.4671016,0.33280823,0.033634808,0.06707626,-0.23105396,-0.55561197,0.07636002,0.16579041,0.32552147,-0.033550773,0.14614399,-0.42944258,0.74984837,-0.13493611,-0.15166876,-0.015612468,0.15508927,-0.16082142,0.038020093,0.4242284,0.6160844,2.3725305,0.27228695,-0.3096417,0.38067392,-0.42133182,-0.023286598,-0.2479145,-0.18450552,-0.50262153,-0.1219347,0.084054485,0.27207014,0.26490274,0.18016753,0.056980222,-0.37189206,0.29309306,0.345037,0.15826349,-0.12678888,0.069215454,-0.19345032,-0.37179798,0.20958723,-0.34396064,0.6446639,-0.3147083,0.109797716,-0.2343285,-0.12853715,0.31942245,0.5240834,0.07936764,0.22180547,-0.22276346,-0.7370334,0.2059924,-0.16957913,-0.54962784,0.06182826,-0.43232536,-0.18075486,-0.02683289,-0.18994266,-0.22105451,0.21342945,-0.12488644,0.47771883,0.08750108,0.100575216,0.20250279,0.06873274,0.1647787,0.0105219865,0.46377176,0.755996,0.008382606,0.16505231,-0.037330512,0.17159443,-0.23883311,0.32680357,0.0072431406,0.37429538,0.12332441,0.29948518,-0.27898365,0.30725083,-0.7265638,-0.2398826,-0.65841824,0.2595215,-0.32884464,0.11139984,0.5864229,-0.08574618,0.34577534,-0.1630827,-0.5698264,0.13798924,-0.20135207,0.16856574,-0.065717906,-0.25808784,-0.13798799,0.030226361,-0.07949671,-0.19135915,0.3673857,0.516874,0.16127701,0.7668254,0.047890536,-0.1308925,-0.15177613,-0.18036813,0.467442,-0.15510108,-0.38522568,0.12281017,-0.075177126,-0.17033747,-0.39819995,0.138992,0.3154781,-0.06674655,0.42309314,1.2694632,-0.010694032,-0.19167286,0.09746879,-0.33987063,-0.5795507,0.060914934,-0.40613365,-0.13240784,-0.40132472,0.10886368,-0.52606344,0.12689078,0.11966896,0.30453643,0.09956485,-0.07459931,0.042907037,0.16591752,0.30390245,-0.12822418,-0.6203869,-0.1422726,0.22274676,-0.032100547,-0.004515106,0.4558211,-0.5606467,-1.2657574,0.073757455,-0.20611182,-0.04144206,-0.47499493,0.050733797,0.64392364,-0.15563273,0.2768555,-0.18964238,-0.23274814,0.11874665,0.27886993,-0.13238516,0.14483896,0.3061887,-0.0421203,-0.53493774,-0.12121216,0.061018474,0.44709614,0.0022071349,0.004988741,-0.28321925,-0.20776436,-0.57620907,0.40627474,-0.14876199,0.22090799,-0.19635507,0.3851785,-0.31519938,-0.29334375,-0.46107832,0.23432484,0.19810213,0.17543317,0.047628894,-0.059511334,0.13176104,0.13541576,0.2932504,-0.1356056,-0.00716155,0.47395775,-0.27144974,-0.08403808,0.2959401,0.09424589,-0.29969692,-0.69849306,-0.25870284,-0.26398954,0.0025279145,0.19527549,-0.23219958]	9	2
4	[-0.0072137816,0.12594031,0.08671458,0.11503262,0.601818,-0.11591022,0.036261197,0.13780208,-0.15638712,-0.50572765,0.2005095,0.11688652,0.32840416,-0.12966546,-0.13687637,-0.045218363,0.8276672,0.22755457,-0.0633583,-0.353174,-0.07233305,0.080376245,0.32417786,0.5311429,0.16331919,0.2253689,0.36247486,-0.13584068,-0.045263313,-0.29110768,-0.09880336,-0.15403906,0.19798204,-0.097944304,-0.2790071,-0.37184626,-0.062036198,-0.022306615,-0.19494939,0.37918666,-0.027843606,-0.13136958,-0.10334142,-0.30295002,-0.1604719,0.2513399,0.4313186,-0.60050863,-0.39094192,-0.16313031,-0.24571346,-0.5869497,-0.32741743,-0.050275236,-0.1559996,-0.082793355,-0.10817674,0.19254674,0.70094424,-0.019067727,0.80257463,-0.085347064,-0.05914862,0.11796947,0.43507853,-0.6452092,-0.12368259,-0.032463957,-0.21446224,-0.0897995,0.06864986,-0.39888218,0.09480774,-0.6645582,0.53378695,0.44277558,-0.12970892,-0.05898714,0.48819053,-0.08357404,-0.25148422,-0.07425081,-0.012086063,0.54983467,0.014425589,-0.17556143,-0.7327798,0.16810183,-0.48811713,-0.23668799,0.3174444,0.080925085,-5.73257,-0.20515534,0.029693142,0.39991418,0.4171323,0.4550591,-0.08498957,0.9960629,0.2220443,-0.03113336,-0.2824079,0.62381244,0.025377005,-0.62385917,-2.1835253,-0.025873255,0.5623622,-0.4390264,-0.028847266,0.19137006,0.29498443,0.20665798,0.19656567,0.15181588,-0.08970301,-0.12763816,-0.6400806,-0.22352323,-0.39364114,0.16254544,-0.3768609,0.09104508,0.132218,0.36764234,-0.25923604,0.40342158,0.053674784,-0.07598375,0.26649138,-0.54319674,-0.37433365,0.78805804,0.30925608,-0.3592185,-0.01099692,-0.12180479,0.051594906,-0.021755202,-0.24392888,0.05833842,-0.005243274,-0.2455384,-0.68321466,0.17458291,-0.2532337,-0.11755171,0.023091672,-0.38063985,-0.16142651,0.43172184,-0.9727049,-0.012390492,-0.29569894,-0.5484951,0.16678417,0.1625019,0.6091086,0.13673651,-0.22315739,0.1410886,0.041269634,0.13731155,0.16011867,-0.21191213,-0.30294216,-0.08035625,-0.22184616,-0.08456833,-0.029436786,0.3141308,0.2221387,0.54728043,0.0883844,0.041905634,-1.4615673,-0.25380838,-0.28288704,-0.13987446,-0.010002323,0.08475395,-0.007112054,-0.09731312,-0.044595495,0.22509235,0.5436202,-0.048013218,-0.004768178,-0.45829237,0.04256267,-0.18960992,0.22775564,-0.21100728,-0.7829697,-0.13093665,-0.13297474,-0.1167458,-0.0021973625,-0.17982893,0.19508767,0.18134396,0.18281038,0.08749251,-0.05820493,-0.06194477,0.7748041,0.14813322,-0.337619,0.44125122,0.19389068,-0.29436895,0.029088652,-0.13206583,-0.61595213,0.2225532,0.36117604,-0.18439941,-0.2121751,-0.06409951,-0.014925688,-0.1024908,0.19316569,0.10426639,-0.0857975,0.07574501,-0.5246126,-0.5469377,-0.38813785,-0.17103335,0.08954772,0.17028558,0.24401021,0.6906894,0.45298028,-0.26732886,-0.20980321,0.4096965,0.064386345,0.17068405,-0.058307804,0.067388535,0.15639356,-0.34692904,0.31080723,0.19539732,-0.04599545,-0.051221207,-0.46882188,-0.1341124,-0.25513098,0.5773067,0.09666961,-0.007543044,0.010741552,0.24754263,-0.4222821,0.1341335,-2.080946,0.24396974,0.10599501,0.21527967,0.120396465,-1.8300005,0.26358894,0.11450361,0.36041352,-0.16189232,-0.39328524,-0.12335455,-0.21739577,0.218164,-0.2895996,-0.025921198,-0.039641745,-0.34368363,0.8391895,0.114432685,-0.35317597,0.0013315441,0.07069578,-0.08002555,-0.4892362,0.015583709,0.2839625,-0.13244838,0.96904254,-0.011206756,0.09641299,0.3110878,0.20930205,-0.017032705,-0.19954653,0.12013616,0.060133543,0.62597996,-0.10190867,-0.13058543,0.31239277,0.29112208,-0.337513,0.40188015,0.49316236,-0.22296782,0.03399628,-0.38851744,-0.047817744,0.07844005,0.2982836,-0.07431133,0.1404613,-0.15226118,0.7811573,0.19664028,-0.1928204,-0.36263654,0.37599495,-0.32728824,0.11369868,0.47196323,0.06291862,1.6844906,0.30413502,-0.2302388,0.348447,-0.45000306,0.14664629,-0.110625476,-0.51629794,-0.6166113,-0.26131728,0.20812787,0.5648647,0.062368136,-0.04914822,0.24858026,-0.058612347,0.42921254,0.4045981,-0.02199952,-0.14325033,-0.006443935,-0.2895421,-0.15542816,0.06969143,-0.1937764,0.5082126,-0.26683453,0.2680191,-0.114061885,-0.44330886,0.2961213,0.41183114,0.024753569,0.23926018,0.08309844,-0.7313209,0.027317297,-0.15605652,-0.66765785,0.38650003,-0.11994469,0.21726453,0.24793331,0.32552347,-0.2364647,0.38052663,0.39790556,0.2945683,0.17781779,0.04417714,0.22892167,0.049656533,0.020881772,-0.2709872,0.44579944,0.4663207,0.1943843,0.70244396,0.44617367,0.12047275,-0.27498323,0.47617215,0.19153994,0.17404692,-0.08616209,0.32693115,-0.1157704,-0.06474737,-0.03573756,0.062239636,-0.5134093,0.48454326,-0.19962609,-0.21029487,0.823212,0.31531364,0.10643325,-0.3157434,-0.6426985,-0.29146695,0.08049857,-0.48371014,-0.0628742,-0.083683565,-0.20662333,0.093016766,-0.035387617,-0.24108748,0.2918495,0.35796636,0.13717331,0.8561083,-0.22774014,0.09075968,0.10630639,0.20280278,0.23992892,-0.2445713,-0.4082412,0.304136,0.18348698,-0.27093458,-0.31663752,0.1514061,0.45852947,-0.30258894,0.617371,0.12187714,-0.38171095,-0.15214439,-0.06999274,-0.50346106,-0.63863593,0.1689265,-0.4309766,-0.38597968,-0.074398026,0.09951652,-0.23608896,0.023537073,0.016652964,0.3117057,0.03338553,0.14355569,-0.04360087,0.020501167,0.22257617,-0.17114004,-0.037142523,0.15069962,0.51837337,0.04868044,-0.14088528,0.32724693,-0.25758767,-0.65290135,0.090789475,-0.024358798,-0.20076506,-0.35272247,0.071917355,0.9574769,-0.21667503,-0.023317762,-0.12927674,-0.4973266,0.07310506,-0.004478289,0.22376034,-0.21493782,0.11394721,-0.32957292,-0.32140058,-0.019304613,-0.23667869,0.3537026,0.23217942,-0.09788558,-0.35118887,-0.10029672,-0.2767794,-0.11422737,-0.26266858,-0.21609086,-0.19892783,0.5823519,-0.4974122,0.052546065,-0.6365688,0.42171305,0.06046105,0.23357289,-0.13366804,-0.078742474,0.40178213,-0.10759011,0.30207253,0.21650007,0.027356103,0.93764776,-0.085416324,-0.07804378,0.48937604,-0.3135893,-0.13126518,-0.35489252,0.055876788,-0.0565813,-0.51181835,0.10154301,-0.11812515]	10	2
5	[-0.356371,-0.05246858,0.05549423,0.34118104,0.26779994,-0.15815215,0.37422648,-0.21777183,-0.08647652,0.13006437,-0.1984607,0.501302,0.7576775,0.04328156,-0.0044017,-0.19355012,0.8393832,0.5647944,-0.20948185,-0.25266832,-0.6650503,0.049397755,-0.10901204,0.48705083,-0.04891119,0.28377613,0.14769693,0.33830082,0.039100047,-0.032637764,-0.23886684,-0.12183643,-0.109108396,-0.2642298,-0.2089512,-0.85610634,-0.22328976,0.1456509,-0.36005747,0.68274415,0.098931916,0.32138583,0.12919235,0.19713971,-0.12702836,-0.7957792,0.1658767,-0.7179398,-0.6545392,-0.30782625,-0.01428856,0.19721262,-0.21029142,-0.11266943,-0.4862416,-0.5757678,-0.6250202,-0.32402077,0.8976076,-0.19644554,0.1853043,-0.08970801,-0.35007587,0.20863605,0.2745871,-0.14556225,-0.50705445,-0.22812296,-0.032083802,-0.05005034,-0.06307852,-0.38665885,-0.035959426,-0.57129574,0.12868205,0.47415766,-0.4934547,-0.36221573,0.16760834,-0.07409503,0.15266766,0.28785676,-0.75475824,0.017557606,-0.23558502,0.05330009,-0.5709627,-0.34750453,-0.24186914,0.50196564,0.14246637,-0.28178003,-2.8939178,-0.619822,-0.05470181,0.86738414,0.37218574,-0.35773724,-0.16774595,0.12287237,0.4396887,-0.21222365,0.043283526,0.38168532,-0.28957084,0.26727635,-1.9842232,-0.1348358,0.059541117,0.37229267,0.08604902,0.24254785,-0.06339367,0.098255694,0.11260821,0.44391873,-0.48184854,0.07346481,-0.5922593,-0.020221977,0.122912124,-0.01955462,-0.2982162,-0.0067350734,0.26238704,0.27839306,0.24926431,0.5079881,-0.19439557,-0.2174093,0.07704339,0.07590203,-0.34202787,0.6796439,0.45902473,-0.013755652,0.4350115,0.069002,-0.6067569,0.13481176,-0.20063987,0.24480978,0.040981036,-0.16902952,-0.6163234,-0.03401513,-0.11430274,0.031533327,-0.24695298,-0.14057912,-0.15285155,-0.09675987,-1.0316379,-0.80779856,-0.27103207,-0.09828016,-0.39627576,-0.0640117,0.21722858,-0.111253515,0.10632538,-0.20447451,0.08334231,0.2941357,-0.015272948,0.02798841,0.27674443,0.18473905,0.01883575,-0.555321,0.3251421,0.056128528,0.38728744,0.15293846,0.71581143,0.13505901,-1.419762,-0.039633036,-0.24796848,-0.13291979,0.14272434,0.05002678,0.23119229,-0.44974303,-0.19099101,0.15316208,0.51154584,-0.33442864,0.22965354,0.5318579,0.16092317,-0.04401885,0.30375355,-0.1769169,0.20327544,0.24942687,-0.27837408,-0.267083,0.7096646,0.46089417,0.4077272,0.24653643,-0.3718702,-0.11291091,0.1331623,-0.20275262,-0.25701958,0.37547094,-0.43743053,0.15931523,-0.24059887,-0.23066899,-0.32195732,-0.28423876,-0.35570702,0.18137854,-0.29484126,-0.2431902,-0.22500645,0.17711383,0.19184077,-0.18188663,0.24724635,0.30717972,-0.35688043,0.03161805,0.0012377995,-0.6144375,-0.36950535,-0.3803542,0.35621506,-0.06734431,0.060990814,0.47709185,0.3391369,0.75482154,-0.056654237,0.5219438,0.083300576,0.28070107,-0.61991215,-0.6020152,0.12051875,-0.2363204,0.18636878,0.38946235,0.08395512,-0.035335686,-0.15006435,-0.3527809,0.003870682,0.060082022,0.1347116,0.13244396,-0.06611375,0.3080613,-0.46605036,0.063571565,-1.6387879,0.3030633,-0.41326958,0.25727102,-0.20826924,-1.1323903,0.49230456,-0.23895088,0.49131683,-0.15837145,-0.13691643,-0.04111111,0.0229217,0.06937559,-0.09481812,0.080448456,-0.53999054,-0.1996717,0.32812014,0.16959052,0.10682103,0.45079786,-0.048075516,0.23872618,0.091517895,-0.12598413,0.0021684533,0.1012955,0.6759376,0.21035764,0.61282337,-0.11087835,-0.028067049,0.15256989,0.11618593,0.13479182,-0.4431016,-0.0072829993,-0.1657697,0.1921454,0.37946355,0.04173328,-0.4674158,0.33396885,0.466032,-0.12538964,0.1515516,-0.26085708,0.15450107,-0.006633734,0.40665293,-0.21923302,0.11614156,-0.046134178,0.67594653,-0.1834664,-0.04944695,0.20765018,0.23871137,0.13956478,0.033026952,0.36282212,-0.13303329,1.7278776,0.30608246,-0.35580337,0.16458446,0.017776202,0.24210219,-0.18943174,0.19519469,-0.9094697,0.3816355,0.32092193,-0.013702652,0.21630368,0.64204824,0.23306848,-0.5395757,0.24436371,0.35151035,0.27596208,-0.36658385,0.1474445,0.043779317,-0.18060935,0.0742467,-0.03001187,0.49615714,-0.4096121,-0.088317506,-0.18870613,-0.3844956,0.39275154,0.42716554,0.30168384,0.1235337,-0.39354494,-0.4896631,1.4271793,-0.36466855,-0.5728176,-0.045516375,-0.5212187,-0.25342816,0.13652818,-1.1050416,-0.69040036,-0.056362543,0.36512518,0.3034746,0.56227535,-0.65257955,0.027499255,-0.38514256,0.2890248,0.19636343,-0.39950243,1.0028005,0.2488738,0.4493362,0.057552584,-0.07425169,-0.50513655,0.0495049,-0.06077494,-0.073863365,0.47363552,0.9345067,-0.09742463,-0.21885821,0.121878065,-0.3216998,-0.3094399,0.2963992,-0.076511666,-0.1791381,0.4106847,-0.11214691,0.27547747,-0.018922191,-0.55907226,-0.20283207,0.09242881,-0.5729145,-0.27205345,-0.32370505,-0.08052847,0.47139555,-0.3427317,0.5661756,0.4763979,0.39667726,-0.020066375,0.69222605,0.0872999,-0.39897087,0.103530735,-0.13261627,-0.026641756,0.061422333,-0.90523887,0.21446513,0.49939013,0.033485055,0.19145752,0.12279971,-0.0056122816,-0.5586088,0.34080434,-0.05251418,-0.50114965,0.3367891,0.27502388,-0.061794214,-0.4253226,-0.0367868,-0.64974,-0.07473659,-0.012301194,0.005974781,-0.10394519,-0.19795947,-0.28352255,0.4176857,0.022645876,0.20595607,-0.35155845,0.11890616,0.12471294,-0.021249078,0.37845486,-0.14827892,0.36416075,-0.05048195,-0.076422796,0.0791755,-0.5018752,-0.57192844,-0.046031497,-0.24707201,0.025434198,0.007144228,0.2251659,0.7969946,-0.31492913,0.059117876,-0.07776241,-0.6939525,0.44958848,-0.076215304,-0.18657969,-0.020094974,-0.16418155,0.49233767,-0.7732082,0.021132713,0.105670676,-0.067601845,0.0427228,-0.27692035,-0.30142653,0.5064678,-0.9277939,-0.09702792,0.17789115,-0.07259789,0.2694383,0.5372255,-0.43979397,0.1793604,-0.539625,0.56410164,0.1913158,-0.26842606,-0.32592818,0.40127912,0.048904523,0.10457254,-0.21120536,0.16545057,-0.28918484,0.47031948,0.04451647,-0.15971622,0.17646742,-0.23960796,0.060904592,-0.32897377,0.033073314,-0.15065421,0.031043055,0.14051807,-0.044482503]	8	2
6	[0.2399012,0.25113094,-0.11609788,-0.035584256,0.49421364,-0.58806914,0.5655668,-0.011299283,0.38989508,-0.28595167,-0.015703432,0.3329509,0.5411457,-0.10009767,0.06637231,-0.34464842,0.96591806,0.07228507,-0.12906146,-0.118875496,0.24989282,-0.00062959275,-0.09431302,0.2797632,0.16104072,0.20511004,0.05406919,-0.06344843,-0.030592073,-0.3174643,-0.022670636,0.019109955,-0.011643429,0.025793683,-0.33918524,-0.71512175,-0.19820884,-0.172827,-0.26506314,-0.42654553,-0.2818553,0.15668356,-0.32494155,-0.11185247,0.21878079,-0.36764497,0.5302876,-0.7314341,-0.4800054,-0.09368106,-0.046862274,-0.18456803,-0.20149684,-0.064574,-0.34060314,-0.13180603,-0.13549927,-0.0220332,0.688753,-0.17697792,0.6110115,-0.08754149,-0.30211738,-0.06948467,0.27450958,0.0078763105,-0.47951084,-0.21311079,0.101287074,-0.25544783,-0.15461226,-0.3163649,0.23033138,-0.5365018,0.20421386,0.44986635,0.04454704,0.09224915,0.3780304,-0.40845358,0.054216865,-0.11483252,-0.34282705,0.5907817,-0.011941827,-0.27287143,-0.98676527,0.1889237,-0.15067846,-0.37532905,0.3376412,-0.07384177,-5.6114025,-0.14761059,0.0024281202,0.47147498,0.36230507,0.3701819,0.060440674,0.5289716,0.2279781,-0.109499246,0.24190322,0.43572867,-0.28571367,-0.15376353,-2.5432358,0.07320487,0.46781352,-0.46037012,0.08142942,-0.27834466,0.29851732,-0.080526456,0.25183845,0.12185752,-0.28881136,-0.15254271,-0.70744896,-0.45657444,-0.23913646,0.059654996,-0.06686075,0.0017898444,0.2505554,0.0011506627,-0.19755363,0.5819934,0.36822596,0.12743491,0.20883101,-0.7641786,-0.5879744,0.75596315,0.37084368,0.10673318,-0.12709133,-0.42788407,-0.27633646,-0.014345676,0.18654521,-0.17583238,-0.11157106,-0.3928367,-0.6309323,-0.324439,0.050395038,-0.046270587,-0.34093374,-0.20803988,-0.1986051,0.43898338,-0.8416273,0.11407081,-0.22495763,-0.38802618,0.056614663,0.47958744,0.63855594,0.09495843,0.16484132,0.11116338,-0.016963104,0.25256628,0.3159104,-0.0060709342,0.16075712,0.07446522,0.02430819,-0.18752769,0.037265576,0.26639932,-0.00022490225,0.25614685,-0.05872555,0.3540927,-1.7225839,-0.13168271,-0.35992506,-0.09881228,0.18064485,0.35810027,0.28224036,-0.12727489,-0.1978303,0.5215404,0.45721483,-0.11068044,-0.14230406,-0.23966362,0.31706408,-0.1312489,0.29397053,0.0007645726,-0.6009363,0.17099412,-0.4778312,0.0796489,-0.27960482,0.13442591,0.13063486,0.092563815,0.14162879,0.10878467,0.09469734,-0.014924538,0.5529892,0.20010658,-0.2831452,0.48989877,0.01910922,-0.20064227,-0.09079883,-0.4100264,-0.6071129,0.42964372,-0.045659117,-0.19903849,-0.024731698,0.034733597,-0.1763458,-0.24507353,0.20025721,0.021965057,-0.13997257,0.057330783,-0.1539071,-0.33093375,-0.30073324,-0.20588522,-0.19615681,0.76416624,-0.07051522,0.3109249,0.60299087,0.196971,-0.1934196,-0.002261702,-0.1984841,0.08541938,-0.33854476,-0.29925552,0.1498556,-0.22092722,0.16246647,-0.009650136,-0.040404066,-0.23817128,-0.24698108,-0.2707878,-0.032797735,0.16667385,0.1103615,0.03377365,0.2863735,0.17199959,-0.38516963,0.1541061,-1.9508438,0.047797855,0.3964873,0.21201152,-0.20280327,-1.7293595,0.22952114,-0.21905918,0.30987784,0.15126099,-0.13559857,0.10856414,-0.07018716,0.15118285,-0.43810853,-0.08698855,0.0021264052,-0.19357583,0.59938765,0.533401,-0.39423177,0.20029688,0.053882122,-0.035849683,-0.5054888,0.22374474,0.10462765,0.32126722,1.7155758,-0.08100747,0.411497,0.2878023,-0.12493986,0.08347438,-0.11489612,0.073283084,-0.75477827,0.35318017,-0.20081986,0.025752608,0.432381,0.26469636,-0.4671016,0.33280823,0.033634808,0.06707626,-0.23105396,-0.55561197,0.07636002,0.16579041,0.32552147,-0.033550773,0.14614399,-0.42944258,0.74984837,-0.13493611,-0.15166876,-0.015612468,0.15508927,-0.16082142,0.038020093,0.4242284,0.6160844,2.3725305,0.27228695,-0.3096417,0.38067392,-0.42133182,-0.023286598,-0.2479145,-0.18450552,-0.50262153,-0.1219347,0.084054485,0.27207014,0.26490274,0.18016753,0.056980222,-0.37189206,0.29309306,0.345037,0.15826349,-0.12678888,0.069215454,-0.19345032,-0.37179798,0.20958723,-0.34396064,0.6446639,-0.3147083,0.109797716,-0.2343285,-0.12853715,0.31942245,0.5240834,0.07936764,0.22180547,-0.22276346,-0.7370334,0.2059924,-0.16957913,-0.54962784,0.06182826,-0.43232536,-0.18075486,-0.02683289,-0.18994266,-0.22105451,0.21342945,-0.12488644,0.47771883,0.08750108,0.100575216,0.20250279,0.06873274,0.1647787,0.0105219865,0.46377176,0.755996,0.008382606,0.16505231,-0.037330512,0.17159443,-0.23883311,0.32680357,0.0072431406,0.37429538,0.12332441,0.29948518,-0.27898365,0.30725083,-0.7265638,-0.2398826,-0.65841824,0.2595215,-0.32884464,0.11139984,0.5864229,-0.08574618,0.34577534,-0.1630827,-0.5698264,0.13798924,-0.20135207,0.16856574,-0.065717906,-0.25808784,-0.13798799,0.030226361,-0.07949671,-0.19135915,0.3673857,0.516874,0.16127701,0.7668254,0.047890536,-0.1308925,-0.15177613,-0.18036813,0.467442,-0.15510108,-0.38522568,0.12281017,-0.075177126,-0.17033747,-0.39819995,0.138992,0.3154781,-0.06674655,0.42309314,1.2694632,-0.010694032,-0.19167286,0.09746879,-0.33987063,-0.5795507,0.060914934,-0.40613365,-0.13240784,-0.40132472,0.10886368,-0.52606344,0.12689078,0.11966896,0.30453643,0.09956485,-0.07459931,0.042907037,0.16591752,0.30390245,-0.12822418,-0.6203869,-0.1422726,0.22274676,-0.032100547,-0.004515106,0.4558211,-0.5606467,-1.2657574,0.073757455,-0.20611182,-0.04144206,-0.47499493,0.050733797,0.64392364,-0.15563273,0.2768555,-0.18964238,-0.23274814,0.11874665,0.27886993,-0.13238516,0.14483896,0.3061887,-0.0421203,-0.53493774,-0.12121216,0.061018474,0.44709614,0.0022071349,0.004988741,-0.28321925,-0.20776436,-0.57620907,0.40627474,-0.14876199,0.22090799,-0.19635507,0.3851785,-0.31519938,-0.29334375,-0.46107832,0.23432484,0.19810213,0.17543317,0.047628894,-0.059511334,0.13176104,0.13541576,0.2932504,-0.1356056,-0.00716155,0.47395775,-0.27144974,-0.08403808,0.2959401,0.09424589,-0.29969692,-0.69849306,-0.25870284,-0.26398954,0.0025279145,0.19527549,-0.23219958]	33	7
7	[-0.0072137816,0.12594031,0.08671458,0.11503262,0.601818,-0.11591022,0.036261197,0.13780208,-0.15638712,-0.50572765,0.2005095,0.11688652,0.32840416,-0.12966546,-0.13687637,-0.045218363,0.8276672,0.22755457,-0.0633583,-0.353174,-0.07233305,0.080376245,0.32417786,0.5311429,0.16331919,0.2253689,0.36247486,-0.13584068,-0.045263313,-0.29110768,-0.09880336,-0.15403906,0.19798204,-0.097944304,-0.2790071,-0.37184626,-0.062036198,-0.022306615,-0.19494939,0.37918666,-0.027843606,-0.13136958,-0.10334142,-0.30295002,-0.1604719,0.2513399,0.4313186,-0.60050863,-0.39094192,-0.16313031,-0.24571346,-0.5869497,-0.32741743,-0.050275236,-0.1559996,-0.082793355,-0.10817674,0.19254674,0.70094424,-0.019067727,0.80257463,-0.085347064,-0.05914862,0.11796947,0.43507853,-0.6452092,-0.12368259,-0.032463957,-0.21446224,-0.0897995,0.06864986,-0.39888218,0.09480774,-0.6645582,0.53378695,0.44277558,-0.12970892,-0.05898714,0.48819053,-0.08357404,-0.25148422,-0.07425081,-0.012086063,0.54983467,0.014425589,-0.17556143,-0.7327798,0.16810183,-0.48811713,-0.23668799,0.3174444,0.080925085,-5.73257,-0.20515534,0.029693142,0.39991418,0.4171323,0.4550591,-0.08498957,0.9960629,0.2220443,-0.03113336,-0.2824079,0.62381244,0.025377005,-0.62385917,-2.1835253,-0.025873255,0.5623622,-0.4390264,-0.028847266,0.19137006,0.29498443,0.20665798,0.19656567,0.15181588,-0.08970301,-0.12763816,-0.6400806,-0.22352323,-0.39364114,0.16254544,-0.3768609,0.09104508,0.132218,0.36764234,-0.25923604,0.40342158,0.053674784,-0.07598375,0.26649138,-0.54319674,-0.37433365,0.78805804,0.30925608,-0.3592185,-0.01099692,-0.12180479,0.051594906,-0.021755202,-0.24392888,0.05833842,-0.005243274,-0.2455384,-0.68321466,0.17458291,-0.2532337,-0.11755171,0.023091672,-0.38063985,-0.16142651,0.43172184,-0.9727049,-0.012390492,-0.29569894,-0.5484951,0.16678417,0.1625019,0.6091086,0.13673651,-0.22315739,0.1410886,0.041269634,0.13731155,0.16011867,-0.21191213,-0.30294216,-0.08035625,-0.22184616,-0.08456833,-0.029436786,0.3141308,0.2221387,0.54728043,0.0883844,0.041905634,-1.4615673,-0.25380838,-0.28288704,-0.13987446,-0.010002323,0.08475395,-0.007112054,-0.09731312,-0.044595495,0.22509235,0.5436202,-0.048013218,-0.004768178,-0.45829237,0.04256267,-0.18960992,0.22775564,-0.21100728,-0.7829697,-0.13093665,-0.13297474,-0.1167458,-0.0021973625,-0.17982893,0.19508767,0.18134396,0.18281038,0.08749251,-0.05820493,-0.06194477,0.7748041,0.14813322,-0.337619,0.44125122,0.19389068,-0.29436895,0.029088652,-0.13206583,-0.61595213,0.2225532,0.36117604,-0.18439941,-0.2121751,-0.06409951,-0.014925688,-0.1024908,0.19316569,0.10426639,-0.0857975,0.07574501,-0.5246126,-0.5469377,-0.38813785,-0.17103335,0.08954772,0.17028558,0.24401021,0.6906894,0.45298028,-0.26732886,-0.20980321,0.4096965,0.064386345,0.17068405,-0.058307804,0.067388535,0.15639356,-0.34692904,0.31080723,0.19539732,-0.04599545,-0.051221207,-0.46882188,-0.1341124,-0.25513098,0.5773067,0.09666961,-0.007543044,0.010741552,0.24754263,-0.4222821,0.1341335,-2.080946,0.24396974,0.10599501,0.21527967,0.120396465,-1.8300005,0.26358894,0.11450361,0.36041352,-0.16189232,-0.39328524,-0.12335455,-0.21739577,0.218164,-0.2895996,-0.025921198,-0.039641745,-0.34368363,0.8391895,0.114432685,-0.35317597,0.0013315441,0.07069578,-0.08002555,-0.4892362,0.015583709,0.2839625,-0.13244838,0.96904254,-0.011206756,0.09641299,0.3110878,0.20930205,-0.017032705,-0.19954653,0.12013616,0.060133543,0.62597996,-0.10190867,-0.13058543,0.31239277,0.29112208,-0.337513,0.40188015,0.49316236,-0.22296782,0.03399628,-0.38851744,-0.047817744,0.07844005,0.2982836,-0.07431133,0.1404613,-0.15226118,0.7811573,0.19664028,-0.1928204,-0.36263654,0.37599495,-0.32728824,0.11369868,0.47196323,0.06291862,1.6844906,0.30413502,-0.2302388,0.348447,-0.45000306,0.14664629,-0.110625476,-0.51629794,-0.6166113,-0.26131728,0.20812787,0.5648647,0.062368136,-0.04914822,0.24858026,-0.058612347,0.42921254,0.4045981,-0.02199952,-0.14325033,-0.006443935,-0.2895421,-0.15542816,0.06969143,-0.1937764,0.5082126,-0.26683453,0.2680191,-0.114061885,-0.44330886,0.2961213,0.41183114,0.024753569,0.23926018,0.08309844,-0.7313209,0.027317297,-0.15605652,-0.66765785,0.38650003,-0.11994469,0.21726453,0.24793331,0.32552347,-0.2364647,0.38052663,0.39790556,0.2945683,0.17781779,0.04417714,0.22892167,0.049656533,0.020881772,-0.2709872,0.44579944,0.4663207,0.1943843,0.70244396,0.44617367,0.12047275,-0.27498323,0.47617215,0.19153994,0.17404692,-0.08616209,0.32693115,-0.1157704,-0.06474737,-0.03573756,0.062239636,-0.5134093,0.48454326,-0.19962609,-0.21029487,0.823212,0.31531364,0.10643325,-0.3157434,-0.6426985,-0.29146695,0.08049857,-0.48371014,-0.0628742,-0.083683565,-0.20662333,0.093016766,-0.035387617,-0.24108748,0.2918495,0.35796636,0.13717331,0.8561083,-0.22774014,0.09075968,0.10630639,0.20280278,0.23992892,-0.2445713,-0.4082412,0.304136,0.18348698,-0.27093458,-0.31663752,0.1514061,0.45852947,-0.30258894,0.617371,0.12187714,-0.38171095,-0.15214439,-0.06999274,-0.50346106,-0.63863593,0.1689265,-0.4309766,-0.38597968,-0.074398026,0.09951652,-0.23608896,0.023537073,0.016652964,0.3117057,0.03338553,0.14355569,-0.04360087,0.020501167,0.22257617,-0.17114004,-0.037142523,0.15069962,0.51837337,0.04868044,-0.14088528,0.32724693,-0.25758767,-0.65290135,0.090789475,-0.024358798,-0.20076506,-0.35272247,0.071917355,0.9574769,-0.21667503,-0.023317762,-0.12927674,-0.4973266,0.07310506,-0.004478289,0.22376034,-0.21493782,0.11394721,-0.32957292,-0.32140058,-0.019304613,-0.23667869,0.3537026,0.23217942,-0.09788558,-0.35118887,-0.10029672,-0.2767794,-0.11422737,-0.26266858,-0.21609086,-0.19892783,0.5823519,-0.4974122,0.052546065,-0.6365688,0.42171305,0.06046105,0.23357289,-0.13366804,-0.078742474,0.40178213,-0.10759011,0.30207253,0.21650007,0.027356103,0.93764776,-0.085416324,-0.07804378,0.48937604,-0.3135893,-0.13126518,-0.35489252,0.055876788,-0.0565813,-0.51181835,0.10154301,-0.11812515]	34	7
8	[-0.06685017,-0.27328494,0.17737252,0.27519527,0.4798738,-0.6735927,0.3438388,0.13812605,0.32271034,0.1700023,0.098795645,-0.21352835,0.24666305,-0.3693046,0.1284251,-0.09425499,0.3634605,0.08020387,0.28256002,0.015093814,0.28114316,0.19041117,0.27499476,-0.14795986,-0.5486163,-0.12207434,-0.14499843,-0.076767094,-0.4953291,0.43565148,-0.11121939,-0.41254553,-0.21793716,-0.061084207,-0.7083339,-0.37500456,0.42579973,-0.2029128,-0.111436985,0.34779415,-0.16617055,0.049179103,0.37463662,-0.27525356,0.16601254,0.24061474,0.23011784,-0.6081687,0.05228235,-0.14690623,0.05053655,0.20598903,-0.08949094,-0.19527467,-0.096060224,-0.30722833,-0.117007166,0.36341938,0.29923666,-0.25229314,0.030126072,-0.30044132,-0.046517704,0.05762368,0.01110232,-0.13671577,0.2544533,-0.49726638,-0.14266135,0.2987257,-0.017612778,-0.40503877,-0.082178496,-0.7293813,0.038634915,0.3993263,0.14983086,-0.1610606,0.1251382,0.06846297,-0.17884777,-0.7676418,-0.1961023,0.56419253,0.045388352,-0.008506194,-0.75180703,-0.02480974,-0.39071223,0.05770229,0.19751705,0.08252289,-4.267789,0.3978077,0.18198664,0.055999678,0.5619344,0.05651142,-0.31344983,0.9932428,0.5101659,-0.15604788,-0.048497025,0.47533792,0.13652271,-0.08498991,-1.3953668,0.3076203,0.3376581,-0.06329957,0.6798303,0.051569495,0.37433255,-0.26436567,-0.093221925,0.25529015,-0.28457305,0.066158764,-0.537862,-0.10428268,0.15951633,0.72126937,-0.23010948,0.58075583,0.18295036,0.07136124,0.21906783,0.5843143,-0.25693002,0.089858316,-0.24318625,-0.18741871,-0.73826915,0.69973314,0.28281352,-0.14843586,-0.1879716,-0.038767055,-0.2698179,0.30061778,-0.16859502,0.20781894,0.29368776,-0.62794805,-0.55298334,-0.065506846,0.2464754,-0.34644216,-0.016811136,0.22706284,-0.163334,0.22439697,-1.1138965,-0.039264534,-0.2474383,-0.31472588,-0.40948308,-0.070126444,0.9193461,-0.060402382,0.15022534,-0.19207826,0.13992572,0.018211093,0.26144716,0.18503085,0.30725476,-0.054327894,-0.024547474,0.23154621,-0.3845277,-0.10483193,-0.066244476,-0.28477392,0.19343965,0.351655,-1.4071146,-0.4758312,-0.80969447,-0.34266666,0.43274134,0.18046854,0.136988,-0.059110068,-0.45379514,0.5604536,0.64971125,0.00021360411,-0.17622736,-0.41212392,0.23892468,-0.38932252,0.31738234,0.18985957,-0.6002271,-0.32076335,-0.06334414,0.0068932483,-0.6625335,0.37468347,0.35110542,0.3081343,0.03473955,-0.15737344,-0.52918243,0.15257329,0.06947419,-0.093523234,0.021484023,-0.029409077,-0.43168268,-0.12419337,0.17440215,-0.46950457,-0.42705464,-0.062991194,0.24775296,-0.16066167,-0.0823289,-0.40304068,-0.32969087,-0.2683903,-0.1367496,0.263269,-0.12197007,0.17380694,-0.12647511,0.14110714,-0.21257177,-0.75492793,-0.35783988,0.18934947,-0.017014954,0.50995994,0.065770775,0.36431506,-0.17319283,0.04864548,0.24974814,0.38005614,-0.3055085,-0.31877446,0.22957031,-0.29957238,0.059254803,0.10044652,0.1399307,-0.06925139,-0.07548116,-0.22753134,-0.22144783,0.15716465,0.09229459,0.06954527,0.20234418,-0.037879523,-0.14375176,0.114360064,-2.1241148,-0.32081884,0.18764527,0.07531697,0.03318924,-2.4651406,0.5563432,0.0061481344,0.27209324,0.019455925,-0.3315827,-0.01084497,-0.20467141,-0.098764926,0.30298692,-0.17357297,-0.010153836,0.077345565,0.049063064,0.6711203,-0.2652611,0.24702518,-0.15328306,-0.12347726,-0.35857916,0.0789944,0.2520025,-0.073684044,1.8742791,0.042058937,0.027711364,0.579832,0.47442767,0.24988191,0.026476424,-0.18681696,0.057019003,-0.14204514,0.30159757,0.14708471,0.3239511,0.35954973,-0.3152435,0.053994633,0.16867056,0.27985993,0.02173558,-0.16078946,-0.32995632,-0.19797908,0.46836692,-0.118053265,0.04839641,0.13867652,0.6931755,0.5045047,0.4591399,0.05721638,0.60494894,-0.2899157,0.037068468,0.865852,-0.27039996,1.8473295,0.5915291,-0.49160406,0.47646338,-0.42289242,0.24029875,-0.37821922,0.12886885,-0.8580951,0.30880237,-0.37428376,0.049558733,0.21468838,-0.051391352,0.1254328,-0.33747852,-0.34100562,-0.4447404,0.7051469,-0.05023515,-0.24554802,-0.20040554,0.045115195,-0.06745532,-0.15607806,0.5022941,0.012977457,-0.30596045,-0.20796253,-0.215645,-0.5306059,0.42520857,-0.3361659,0.10552281,-0.10652015,-0.31141993,0.74574536,-0.26332852,-0.14497304,0.46137264,0.35637528,0.24846861,-0.2139885,0.3370459,-0.6025172,0.4796692,0.45391005,0.5327801,-0.20064569,0.20405652,0.07363904,0.4393355,0.03706815,-0.28316167,-0.12336977,0.52248234,0.50715655,0.34561718,0.7195704,0.25670817,-0.8975626,-0.14298497,-0.30027556,0.28777272,0.034930315,0.14544716,-0.0051950132,-0.19291742,0.17026442,-0.169251,-0.72202724,0.073238,-0.29980847,-0.18258986,0.44258296,-0.23498976,0.050108448,0.22424966,-0.27160344,-0.236156,0.17343691,-1.2640495,-0.017737584,-0.26449025,0.2666202,0.05392569,-0.014926912,0.49947035,-0.15595092,-0.0045079277,0.38289276,0.47473788,-0.04276745,-0.20086232,0.33710966,0.16711871,0.16481806,0.010106415,-0.18173702,0.08237998,-0.08312866,-0.13442804,0.1854333,0.30240998,0.28993306,0.1368564,0.35769442,0.16492286,-0.24488994,0.09937373,0.07675755,-0.7032436,0.1404002,0.027730994,-0.18289384,0.16168557,0.12647745,0.23675366,0.09780673,0.0770268,0.16509634,-0.28040096,0.4219721,-0.39651042,-0.47552866,-0.10234075,0.41968513,0.023418665,-0.5206549,-0.11345925,0.5676593,-0.3410975,0.10532683,0.019999675,0.25789654,-0.8803196,-0.10613196,-0.035315882,-0.06500858,-0.17757966,0.0032696654,0.23342541,-0.3014407,-0.018234005,0.16254221,-0.25735965,0.053602286,0.25075802,0.17610133,-0.2176718,0.6751231,0.2528137,-0.09870561,-0.24642897,-0.08805477,0.20000659,0.102219045,0.005840901,-0.16731273,0.10194324,-0.83215,-0.031357486,-0.34857327,-0.13840975,-0.12994133,0.35015926,-0.21874523,0.19713807,-0.3524619,0.42345718,0.15564384,0.4186133,-0.32733762,0.32704344,0.07086632,0.20709243,0.4668789,0.091277204,-0.054854013,0.67748135,0.53703046,-0.030171301,0.47356164,-0.42182192,-0.12667258,-0.4703288,-0.6159018,-0.1289272,-0.013350023,0.32671744,0.08133228]	35	7
9	[0.24945346,0.3950606,0.029074073,0.06791985,0.4705719,-0.3515502,0.4905999,-0.18265274,0.17261532,-0.19652894,-0.23843162,0.29169542,0.54558736,0.24833228,-0.028533041,-0.2183239,0.97577494,0.35100934,-0.022106018,-0.34926632,-0.0938003,-0.023198362,0.14287326,0.5388903,0.10140409,0.25053492,0.449231,-0.22710812,0.07477601,-0.18150067,-0.28913155,-0.05370797,-0.13274571,0.018514948,-0.38128746,-0.81730264,0.009814507,-0.19759022,-0.43188933,-0.4123036,-0.1885105,0.21174772,-0.33788323,-0.10009808,0.17913797,-0.031982504,0.23638794,-0.47653958,-0.32633233,-0.034140334,0.26066175,0.015374285,-0.059053775,0.063914604,-0.34462285,-0.64712864,0.018939322,0.09030875,0.6452124,-0.051492352,0.42855057,-0.08603327,-0.05448678,0.026582912,0.16746145,-0.05505759,-0.5093072,0.11805088,0.19454871,-0.14818974,-0.15351687,-0.29677445,0.13086754,-0.42346725,0.3374287,0.5591285,-0.17358185,0.068037786,0.4233346,-0.09707704,0.11810451,-0.42119598,-0.4266806,0.060327027,0.0665154,-0.36534053,-1.1157484,0.37937897,0.12983027,0.07911786,-0.008589944,-0.21066152,-4.969574,-0.08603952,0.26759857,1.0100917,0.43394235,0.2618362,0.063972235,0.4184238,0.44593006,-0.19239397,0.21687844,0.34664237,-0.38634133,0.14962102,-2.1879659,0.031086534,0.37386373,0.02482097,0.09656745,-0.06417904,0.30666554,-0.01926975,0.24042693,0.27113962,-0.030043812,-0.28303602,-0.715648,-0.4751971,0.013001166,0.30480832,-0.44350317,0.32467103,0.36017734,0.02048139,-0.2967266,0.5535787,0.08127849,0.08008355,0.35890046,-0.32724878,-0.40533593,0.79822505,0.14993455,0.13913757,0.10255293,-0.058681075,-0.16775244,-0.10441611,-0.2560895,0.17054893,-0.153921,0.04528886,-0.62626386,-0.31649518,-0.3444224,0.02146068,-0.2610363,-0.11245976,0.041045822,0.21892463,-0.8794255,-0.021017786,0.044995327,-0.516422,-0.33082628,0.13281967,0.71977127,0.45978242,-0.028719045,0.27815574,0.017655747,0.1438664,0.2410665,-0.07864085,0.105295554,0.20750871,0.048422437,-0.36002162,0.20449223,0.24747802,0.35783768,0.24770382,-0.094248,0.5115937,-1.4205407,0.12860121,0.005923807,-0.12672545,0.35839757,0.13516735,0.12605296,-0.24954303,-0.25394842,0.16481142,0.14825849,-0.11556944,-0.14818548,-0.20096959,0.270424,-0.40941912,0.48396835,0.2301137,-0.8153119,0.2620504,-0.5149065,-0.16261798,-0.014722687,0.2962438,0.25866598,0.1858511,-0.17627546,-0.26407933,0.013281314,0.1265141,0.4035742,0.45234314,-0.30262336,0.49188828,-0.070534065,-0.325259,-0.21160445,-0.45089737,-0.4050579,0.03717022,0.032788936,-0.20130268,0.05376307,-0.026849324,0.0061051743,-0.26759073,0.36409545,0.06165134,-0.06046031,-0.064521015,-0.10108072,-0.5244121,-0.25020784,-0.19785105,-0.06300605,0.6738394,-0.22933987,0.07127157,0.4519022,0.16655406,-0.13547257,0.51395595,-0.31629726,-0.055179823,-0.35890266,-0.23855639,0.07755013,-0.19174983,0.14827947,0.13947259,-0.014416407,-0.026140481,-0.42236504,-0.5807442,0.14443694,-0.06561995,0.07778938,0.14683238,0.40733698,0.352983,-0.23144846,-0.056741845,-2.0402253,0.14148834,0.123571835,0.069311514,-0.20202778,-1.3194648,0.35894123,-0.14195016,0.28349406,0.27022657,-0.13626604,0.28618202,-0.059457563,0.18348597,-0.08822946,-0.21895874,-0.035158016,-0.27216238,0.4463274,0.2737776,-0.09760035,0.49830166,0.32938576,0.04338191,-0.11205183,0.15246072,0.28021452,0.015919652,1.7816908,0.009854968,0.10026035,0.056664344,0.25085065,0.038580876,-0.17740768,0.1660444,-0.65073365,0.21995746,-0.026678411,-0.23345654,0.4628609,0.43269372,-0.5268932,0.15420172,0.38743553,-0.28292108,-0.0340613,-0.42194128,-0.053300478,-0.027818732,0.3486157,-0.035159685,0.06430567,-0.2120943,0.79311705,-0.28668496,-0.1327908,-0.08891857,0.32637224,0.18446231,0.1365088,0.3694505,0.4840881,1.9118174,0.20896128,-0.4482512,0.38160518,-0.18490858,0.1407972,-0.061823037,-0.108526476,-0.56747746,-0.3156308,0.3664081,0.14169984,0.045757357,0.2685966,0.47875065,-0.020384157,0.3327079,0.4054548,0.04161816,0.0808438,0.03113777,-0.104710214,-0.0569889,0.1485381,-0.06699986,0.57855356,-0.22503333,0.27816394,-0.10611381,-0.31807035,-0.032991197,0.59553707,-0.15432665,0.03332843,-0.15445383,-0.7617136,0.73072,-0.11775583,-0.6411415,0.25888664,-0.74459827,-0.19778219,0.21458806,-0.3181461,-0.16175976,0.260581,0.2713323,0.2498131,-0.09491109,0.120281994,0.11439968,-0.08408535,0.24802077,0.18971938,0.16824514,1.0069597,0.0043312144,0.1441944,0.11887162,0.31131178,-0.009600072,0.3779546,-0.1827684,0.22571714,0.15620326,0.17890507,-0.28594893,0.20873392,-0.53581464,-0.23114358,-0.5035792,0.3810111,-0.5004123,-0.04768717,0.3252574,-0.14530434,0.5411804,-0.3757386,-1.070852,-0.19560872,0.060256653,-0.113393106,0.11721445,-0.11723443,-0.26455992,0.3289829,-0.25210533,-0.12586907,0.36050743,0.45456138,0.2266935,0.72942173,0.38193417,-0.43868983,0.19500731,-0.12733264,0.48714516,-0.33343855,-0.5639275,0.18274939,0.13218296,-0.03516177,-0.07162696,0.29673874,0.4270275,-0.23854256,0.39347667,0.7475887,-0.21280368,-0.22470854,0.026377589,-0.18863812,-0.863966,0.26120934,-0.6025376,-0.337755,-0.2498703,0.2936687,-0.49062952,0.119994536,0.19605635,0.3599173,0.21304883,-0.07724286,-0.38860187,-0.0024920935,0.2513339,0.026629383,-0.24332596,-0.22767866,0.24194686,0.32526588,-0.1880292,0.5688964,-0.36631486,-0.8932083,-0.0021394426,-0.3540724,-0.10653713,-0.19766605,0.30727068,0.685029,-0.33194226,-0.15184347,0.078184575,-0.54537874,0.095202506,0.08662382,-0.021208223,-0.012909169,-0.033080757,0.07981541,-0.7019079,0.11818349,0.20146301,0.31169817,-0.13241638,-0.004034414,-0.30080366,0.0661923,-0.72727257,0.27191147,-0.2304296,0.17324376,0.04397022,0.21421212,-0.16415703,-0.31013164,-0.23309255,0.5765459,0.28046548,-0.006738383,-0.10607964,0.09528742,0.2403662,0.16985855,0.39837328,0.07370617,-0.2577519,0.67152286,-0.39505705,0.029276207,0.13574739,0.00062151096,-0.38967687,-0.5066487,-0.35718146,-0.34945518,-0.39250803,0.21655317,-0.060212947]	36	7
10	[-0.078544304,0.38041753,0.14655426,0.39381474,0.59480804,-0.35112303,0.23109126,0.18657392,-0.21789312,-0.76970506,0.2854521,0.14204836,0.51065356,-0.062399425,0.22539008,-0.14885631,1.227036,0.277664,-0.1688313,-0.49096996,0.16743901,0.12316566,0.43417445,0.2751742,0.067389734,0.16396105,0.30069077,-0.26825944,-0.08640299,-0.22529426,-0.0016832382,-0.12978905,-0.047113176,-0.26340356,-0.22547533,-0.48369306,-0.110619806,-5.542956e-05,-0.22572972,-0.20878044,-0.48527464,-0.07821335,0.05730647,-0.1036243,0.11873217,-0.54939884,0.36255965,-0.5924521,-0.21799216,-0.20694624,-0.06139662,-0.5110314,0.019095795,0.15983912,-0.31491002,-0.004698814,0.1719251,0.35593966,0.41350973,0.007290737,0.66675407,-0.36148095,-0.18260881,-0.044235677,0.30657765,-0.66134727,-0.2639198,-0.118760474,-0.032782406,-0.09479214,0.031500995,-0.41865882,0.23383191,-0.745808,0.37202463,0.25988463,-0.02510476,-0.0887389,0.50871116,-0.20789571,0.012168671,-0.12920478,0.07601646,0.49515963,-0.22100908,-0.026926715,-1.3766454,0.1918084,-0.22692472,-0.3778183,0.4674484,-0.14925088,-5.4991827,-0.17743175,0.0727823,0.47675005,0.54965836,0.3002937,-0.08415853,0.906342,0.15067393,-0.2180672,-0.09677099,0.4905521,0.0027663475,-0.334179,-1.8835329,0.12389125,0.66190857,-0.47629482,0.012319556,0.058209784,0.32441133,-0.13190013,0.37822273,-0.035921562,-0.2109975,-0.06586634,-0.5805911,-0.48616138,0.06349134,0.11883454,-0.15005712,-0.2244535,0.17240413,0.19251592,-0.23731804,0.28781277,0.06490183,0.047907107,0.36922166,-0.37020028,-0.23440693,0.76799315,0.54271513,-0.10926073,-0.26494595,-0.33813152,-0.048881117,-0.3601594,-0.19474803,0.15033093,0.08007533,-0.18213229,-0.7470932,0.1567565,-0.08136025,0.16299997,-0.34390423,-0.39605555,-0.12291984,0.15276505,-0.8191578,-0.16736127,-0.39235568,-0.3900326,0.0003033416,0.09091453,0.46037883,0.10302773,-0.18634112,0.14932683,-0.11405316,0.03406549,0.35531488,0.0630796,0.021498892,-0.22584477,0.09262518,-0.062063206,-0.048164904,0.37964284,0.07406407,0.72795373,-0.09921852,0.21961446,-1.725841,-0.25878018,-0.19574977,-0.21071579,0.17642763,0.17238905,0.09245415,-0.23605828,-0.23080327,0.3873374,0.33763638,0.062288072,0.055292916,-0.34807158,0.32955107,-0.23147537,0.10727935,0.23885947,-0.7434236,-0.09416806,-0.1614999,-0.10273509,-0.5927105,0.039255206,0.0031339908,0.10075972,0.08825385,0.1209801,-0.13022263,0.052255448,0.5656944,0.13927892,-0.34518117,0.5890218,0.2884847,0.04957517,-0.0011720116,-0.2985784,-0.6231844,0.047589,0.36562893,-0.06780123,-0.40684515,0.070359275,-0.14078277,-0.15447323,0.2065522,-0.04386619,-0.012220865,0.13812591,-0.5676051,-0.67216545,-0.04627221,-0.12057782,0.14535323,0.6095924,0.23032068,0.49118704,0.40583235,-0.1713661,-0.119336486,0.24718118,0.04469698,0.2766913,-0.05267226,0.056842454,0.044385653,-0.3355421,0.13237391,0.021130575,0.024091095,-0.14416598,-0.53168297,-0.3595469,-0.31243628,0.4573094,-0.11329095,-0.05484093,0.11144938,0.31709737,-0.50038916,0.055514593,-1.8025801,0.17494959,0.07654698,0.23263018,0.08482894,-1.9801043,0.22203761,0.121608526,0.3969123,-0.26993036,-0.32011774,0.02565752,-0.2585422,0.15163481,-0.14064033,0.08491112,0.12296026,-0.1908644,0.59331936,0.18619934,-0.28540233,-0.0058401898,0.004162648,-0.16162604,-0.43462807,0.12843092,0.24302125,-0.1511509,1.3101096,0.015827915,0.053549387,0.303577,0.1005655,0.017066134,-0.25150418,-0.03393183,-0.17129461,0.64353377,-0.3161984,-0.09825685,0.32583922,-0.039969884,-0.23897019,0.22883466,0.42671314,-0.108583964,-0.15824999,-0.5620362,-0.1817698,0.06295892,0.4880602,-0.11496504,0.09071486,-0.17792186,0.76073647,0.039558463,-0.17805634,-0.24536939,0.1390829,-0.46640074,0.2068138,0.044737555,0.57055396,1.9447765,0.08654058,-0.3749498,0.36458108,-0.5535924,0.30061626,0.19092017,-0.16536032,-0.61510557,-0.22194001,0.03987886,0.3676996,0.37126246,-0.16070014,0.17680845,0.039759357,0.36336154,0.15500768,-0.0933901,-0.21117423,-0.23433022,-0.24647625,-0.2656937,-0.019359304,-0.05783393,0.685498,-0.4211434,0.043851152,-0.0628217,-0.08128139,0.06940769,0.49039653,-0.00782223,0.23994252,-0.0416232,-0.5270998,0.28032315,0.21096773,-0.5708533,0.46629834,-0.3249635,0.103344634,0.21402459,0.4352144,-0.379803,0.06816724,0.20176488,0.28393596,0.1999877,0.18786176,0.18939342,0.13831948,0.1906656,-0.14421009,0.52738774,0.42005035,0.27077276,0.5978729,0.33011255,0.31385306,-0.59908664,0.35282454,0.18396613,0.18728304,-0.23533727,0.29007468,-0.15207744,0.0409672,-0.15719011,-0.25137013,-0.52391213,0.38301906,-0.6325401,-0.40062845,0.57513434,0.1755137,-0.0122477105,-0.0665866,-0.7176042,-0.26223427,0.23103821,-0.09722267,-0.07725876,-0.25881043,-0.17553957,0.08952026,-0.16924748,-0.082274504,0.19309431,0.13830687,0.5679734,0.79202706,0.0003535807,-0.14643808,0.13316633,0.03340104,0.3457973,-0.20719953,-0.41860998,0.39582515,0.12876675,0.019583821,-0.3616933,-0.017429518,0.32664472,-0.19245829,0.24560603,0.59989375,-0.34469742,-0.24880406,-0.030041734,-0.30671564,-0.69077814,0.44645318,-0.320912,-0.13604131,-0.34226966,0.070567355,-0.22538865,0.3338498,0.023221409,0.21806945,0.1046545,0.08422352,0.2814233,-0.11593994,0.24381055,-0.29448316,-0.2498698,0.0681887,0.671306,0.25852823,-0.10301713,0.20115636,-0.012590187,-0.58736247,-0.005841324,-0.046556193,-0.07039814,-0.46167704,0.13043039,0.88806033,-0.38876948,0.14024678,0.027134504,-0.58818674,0.06949924,0.0011069857,0.22022755,0.057183508,0.0665922,-0.06391822,-0.22306594,-0.16160086,-0.21176264,0.3992958,0.25860286,0.015783228,-0.44677296,-0.088949375,-0.5505587,-0.06708683,-0.24659394,-0.1076164,-0.3269241,0.4518471,-0.3393067,-0.041786615,-0.6818043,0.33098474,0.04523689,0.3996628,-0.4457635,0.038269028,0.27258444,-0.04572321,0.25999483,0.062279463,-0.07960572,0.79175967,-0.057991542,0.011166581,0.51291007,-0.089663826,-0.2196599,-0.4991468,-0.35995355,-0.10412285,-0.13400927,0.31594217,-0.04023432]	37	7
54	[-0.06685017,-0.27328494,0.17737252,0.27519527,0.4798738,-0.6735927,0.3438388,0.13812605,0.32271034,0.1700023,0.098795645,-0.21352835,0.24666305,-0.3693046,0.1284251,-0.09425499,0.3634605,0.08020387,0.28256002,0.015093814,0.28114316,0.19041117,0.27499476,-0.14795986,-0.5486163,-0.12207434,-0.14499843,-0.076767094,-0.4953291,0.43565148,-0.11121939,-0.41254553,-0.21793716,-0.061084207,-0.7083339,-0.37500456,0.42579973,-0.2029128,-0.111436985,0.34779415,-0.16617055,0.049179103,0.37463662,-0.27525356,0.16601254,0.24061474,0.23011784,-0.6081687,0.05228235,-0.14690623,0.05053655,0.20598903,-0.08949094,-0.19527467,-0.096060224,-0.30722833,-0.117007166,0.36341938,0.29923666,-0.25229314,0.030126072,-0.30044132,-0.046517704,0.05762368,0.01110232,-0.13671577,0.2544533,-0.49726638,-0.14266135,0.2987257,-0.017612778,-0.40503877,-0.082178496,-0.7293813,0.038634915,0.3993263,0.14983086,-0.1610606,0.1251382,0.06846297,-0.17884777,-0.7676418,-0.1961023,0.56419253,0.045388352,-0.008506194,-0.75180703,-0.02480974,-0.39071223,0.05770229,0.19751705,0.08252289,-4.267789,0.3978077,0.18198664,0.055999678,0.5619344,0.05651142,-0.31344983,0.9932428,0.5101659,-0.15604788,-0.048497025,0.47533792,0.13652271,-0.08498991,-1.3953668,0.3076203,0.3376581,-0.06329957,0.6798303,0.051569495,0.37433255,-0.26436567,-0.093221925,0.25529015,-0.28457305,0.066158764,-0.537862,-0.10428268,0.15951633,0.72126937,-0.23010948,0.58075583,0.18295036,0.07136124,0.21906783,0.5843143,-0.25693002,0.089858316,-0.24318625,-0.18741871,-0.73826915,0.69973314,0.28281352,-0.14843586,-0.1879716,-0.038767055,-0.2698179,0.30061778,-0.16859502,0.20781894,0.29368776,-0.62794805,-0.55298334,-0.065506846,0.2464754,-0.34644216,-0.016811136,0.22706284,-0.163334,0.22439697,-1.1138965,-0.039264534,-0.2474383,-0.31472588,-0.40948308,-0.070126444,0.9193461,-0.060402382,0.15022534,-0.19207826,0.13992572,0.018211093,0.26144716,0.18503085,0.30725476,-0.054327894,-0.024547474,0.23154621,-0.3845277,-0.10483193,-0.066244476,-0.28477392,0.19343965,0.351655,-1.4071146,-0.4758312,-0.80969447,-0.34266666,0.43274134,0.18046854,0.136988,-0.059110068,-0.45379514,0.5604536,0.64971125,0.00021360411,-0.17622736,-0.41212392,0.23892468,-0.38932252,0.31738234,0.18985957,-0.6002271,-0.32076335,-0.06334414,0.0068932483,-0.6625335,0.37468347,0.35110542,0.3081343,0.03473955,-0.15737344,-0.52918243,0.15257329,0.06947419,-0.093523234,0.021484023,-0.029409077,-0.43168268,-0.12419337,0.17440215,-0.46950457,-0.42705464,-0.062991194,0.24775296,-0.16066167,-0.0823289,-0.40304068,-0.32969087,-0.2683903,-0.1367496,0.263269,-0.12197007,0.17380694,-0.12647511,0.14110714,-0.21257177,-0.75492793,-0.35783988,0.18934947,-0.017014954,0.50995994,0.065770775,0.36431506,-0.17319283,0.04864548,0.24974814,0.38005614,-0.3055085,-0.31877446,0.22957031,-0.29957238,0.059254803,0.10044652,0.1399307,-0.06925139,-0.07548116,-0.22753134,-0.22144783,0.15716465,0.09229459,0.06954527,0.20234418,-0.037879523,-0.14375176,0.114360064,-2.1241148,-0.32081884,0.18764527,0.07531697,0.03318924,-2.4651406,0.5563432,0.0061481344,0.27209324,0.019455925,-0.3315827,-0.01084497,-0.20467141,-0.098764926,0.30298692,-0.17357297,-0.010153836,0.077345565,0.049063064,0.6711203,-0.2652611,0.24702518,-0.15328306,-0.12347726,-0.35857916,0.0789944,0.2520025,-0.073684044,1.8742791,0.042058937,0.027711364,0.579832,0.47442767,0.24988191,0.026476424,-0.18681696,0.057019003,-0.14204514,0.30159757,0.14708471,0.3239511,0.35954973,-0.3152435,0.053994633,0.16867056,0.27985993,0.02173558,-0.16078946,-0.32995632,-0.19797908,0.46836692,-0.118053265,0.04839641,0.13867652,0.6931755,0.5045047,0.4591399,0.05721638,0.60494894,-0.2899157,0.037068468,0.865852,-0.27039996,1.8473295,0.5915291,-0.49160406,0.47646338,-0.42289242,0.24029875,-0.37821922,0.12886885,-0.8580951,0.30880237,-0.37428376,0.049558733,0.21468838,-0.051391352,0.1254328,-0.33747852,-0.34100562,-0.4447404,0.7051469,-0.05023515,-0.24554802,-0.20040554,0.045115195,-0.06745532,-0.15607806,0.5022941,0.012977457,-0.30596045,-0.20796253,-0.215645,-0.5306059,0.42520857,-0.3361659,0.10552281,-0.10652015,-0.31141993,0.74574536,-0.26332852,-0.14497304,0.46137264,0.35637528,0.24846861,-0.2139885,0.3370459,-0.6025172,0.4796692,0.45391005,0.5327801,-0.20064569,0.20405652,0.07363904,0.4393355,0.03706815,-0.28316167,-0.12336977,0.52248234,0.50715655,0.34561718,0.7195704,0.25670817,-0.8975626,-0.14298497,-0.30027556,0.28777272,0.034930315,0.14544716,-0.0051950132,-0.19291742,0.17026442,-0.169251,-0.72202724,0.073238,-0.29980847,-0.18258986,0.44258296,-0.23498976,0.050108448,0.22424966,-0.27160344,-0.236156,0.17343691,-1.2640495,-0.017737584,-0.26449025,0.2666202,0.05392569,-0.014926912,0.49947035,-0.15595092,-0.0045079277,0.38289276,0.47473788,-0.04276745,-0.20086232,0.33710966,0.16711871,0.16481806,0.010106415,-0.18173702,0.08237998,-0.08312866,-0.13442804,0.1854333,0.30240998,0.28993306,0.1368564,0.35769442,0.16492286,-0.24488994,0.09937373,0.07675755,-0.7032436,0.1404002,0.027730994,-0.18289384,0.16168557,0.12647745,0.23675366,0.09780673,0.0770268,0.16509634,-0.28040096,0.4219721,-0.39651042,-0.47552866,-0.10234075,0.41968513,0.023418665,-0.5206549,-0.11345925,0.5676593,-0.3410975,0.10532683,0.019999675,0.25789654,-0.8803196,-0.10613196,-0.035315882,-0.06500858,-0.17757966,0.0032696654,0.23342541,-0.3014407,-0.018234005,0.16254221,-0.25735965,0.053602286,0.25075802,0.17610133,-0.2176718,0.6751231,0.2528137,-0.09870561,-0.24642897,-0.08805477,0.20000659,0.102219045,0.005840901,-0.16731273,0.10194324,-0.83215,-0.031357486,-0.34857327,-0.13840975,-0.12994133,0.35015926,-0.21874523,0.19713807,-0.3524619,0.42345718,0.15564384,0.4186133,-0.32733762,0.32704344,0.07086632,0.20709243,0.4668789,0.091277204,-0.054854013,0.67748135,0.53703046,-0.030171301,0.47356164,-0.42182192,-0.12667258,-0.4703288,-0.6159018,-0.1289272,-0.013350023,0.32671744,0.08133228]	287	9
65	[0.049275704,-0.3752735,-0.0970825,0.1847042,0.20620166,0.2783063,-0.021576727,0.21918273,0.26636901,-0.13978463,-0.2838166,0.41817433,0.5553235,-0.21242066,-0.051189918,0.0015218818,1.0524266,0.06868329,0.17105503,-0.3411969,-0.19297001,-0.3428167,-0.5414247,0.3801937,-0.78415906,0.18012664,-0.28505018,-0.17544362,0.026423028,0.09702823,0.56106204,0.15694484,-0.6537813,-0.08412108,0.08875044,-0.15273407,0.23736784,0.14962192,0.03736762,1.034927,0.11125799,0.28247645,0.27662537,-0.32753697,-0.34400165,-0.44104576,0.30784625,-0.19181463,0.30468866,-0.4531658,0.12520552,-0.045363404,-0.11689119,0.30448484,-0.26474342,-0.15600683,-0.8045999,-0.13557073,0.3382713,-0.29237065,0.59876037,-0.38579893,-0.21837622,0.048016958,0.038120363,-0.107974306,0.44657943,-0.29003897,-0.10440366,-0.4670281,0.72918785,-0.4569854,0.15118061,-0.6835451,-0.3125095,0.46110705,-0.01789026,-0.14615178,-0.14368759,0.82549334,0.635607,-0.7801033,-0.20910768,0.07271505,0.12807849,-0.41250932,-0.2596064,0.122540526,-0.13975966,0.2562392,0.4516157,-0.05224106,-4.8503594,-0.11517848,0.094348185,0.46600634,0.14223295,0.750476,0.22612439,1.134741,0.23052336,-0.3512347,-0.38612828,0.45335853,-0.21222787,-0.16513693,-1.3155875,-0.0061202296,0.15196452,-0.04192495,0.2020485,0.95744413,0.20666084,0.23736513,0.0815728,-0.14453177,-0.14901432,-0.3318734,-0.034310035,-0.21588266,0.12119316,0.49949157,-0.12277269,0.21737692,0.24046259,-0.20450738,0.06405336,0.46371448,0.42047983,0.009236119,0.04823145,-0.34255692,-0.18868856,0.6827735,0.030319389,-0.15940826,-0.53813523,-0.4661446,-0.29873857,-0.13694327,-0.18869367,-0.1988469,-0.0040290835,-0.3519238,-0.61308783,0.13467629,-0.2926504,0.2035469,0.033363134,0.060911667,-0.32648873,0.18927929,-1.4063505,0.14701818,0.24866787,-0.59787315,0.074301265,0.06405201,0.16000901,0.045558106,0.27291563,-0.17254731,0.075021625,-0.31679833,0.42187062,-0.038486246,0.009800087,0.37574077,0.5308938,-0.15509698,-0.23833606,0.18053758,-0.1896885,0.4147276,-0.23132747,-0.2218263,-1.0263928,-0.32979774,-1.0478066,0.24517655,0.44378054,0.3130491,-0.17978123,-0.27749887,-0.16684939,0.5596666,0.16547213,-0.4558372,-0.13887562,-0.05104588,0.2063957,0.13836496,0.27657163,0.19063362,-0.13521014,-0.43279776,-0.17008258,-0.28365237,0.13773622,0.062721975,0.22886318,-0.30209768,0.02731467,0.14973153,0.5723499,0.28041694,0.06234978,-0.18700759,0.06404544,-0.17521095,-0.365867,-0.21162465,0.1460666,-0.3872255,-0.17830767,0.094046414,0.44428596,-0.09150316,-0.3088062,0.13272753,0.6492866,-1.5873228,-0.19262849,0.35750565,-0.17508432,0.25640213,-0.33723333,-0.08212591,-0.3848117,-0.5161188,-0.08544383,-0.20411192,-0.49659625,0.35170457,0.8106832,0.18715549,0.38984498,0.19984977,-0.0514996,0.036329437,-0.00064267387,-0.20115602,-0.04838675,0.23649466,-0.342091,-0.27848175,-0.012458696,0.15420213,0.031960435,0.033379827,0.2252573,0.034440137,-0.22613358,0.2775534,-0.30196604,0.41595188,-0.6379461,0.22376259,-1.2755165,-0.15796702,-0.057458077,-0.052350886,0.11328638,-2.0229933,-0.0029208874,-0.15647416,0.20481566,0.11056854,-0.58925563,0.14915328,-0.69564295,-0.013512846,0.15187098,0.16238762,0.18345155,-0.319026,0.5618895,0.024337547,-0.26756382,-0.11474847,0.16875751,0.056675956,-0.57833314,-0.27930427,0.1274265,-0.29279247,0.44526228,-0.42967096,0.23889029,0.089908235,-0.13266122,-0.12104348,-0.046509065,0.12637624,0.79220456,-0.22795095,-0.3097404,-0.087968655,0.17426899,0.4623745,-0.07741773,-0.12601091,0.27527732,0.44404402,-0.49483398,-0.09178453,0.43190062,0.16076209,0.4509794,0.049758427,-0.103393905,0.12629968,0.68084455,0.49198848,0.306125,-0.5953372,0.31946447,-0.17564264,0.32146284,0.24341972,-0.18759644,1.2553384,0.34625304,-0.4319668,0.35553688,0.0045118877,0.12126884,0.2325932,-0.18147333,-0.5886683,0.05510258,0.17198716,-0.066163115,0.35840663,0.5645006,-0.28849724,0.25707197,0.07580523,0.3266578,0.09728958,-0.14353582,-0.09944725,0.32405427,0.035375584,-0.16218847,0.1300968,-0.09848917,-0.21862797,-0.40611896,-0.103736445,0.20807187,0.5945352,0.3290773,-0.2530783,0.09170627,0.030446148,-0.14401558,0.98476934,0.04199501,0.047632232,0.09760913,-0.026330844,-0.12767106,-0.4780916,-0.020745244,-0.36710402,0.08431607,1.0126846,-0.13312489,-0.015794424,0.15959896,0.14650844,0.3511196,-0.0225062,0.097137764,0.48269033,0.15756036,0.058570456,-0.076980196,0.4296339,0.39167523,0.6314516,0.06315876,-0.0138551025,-0.0133455405,0.28261882,0.3666013,0.11497627,-0.623,0.63861847,0.40597224,-0.2503737,-0.04141897,-0.04184073,0.03700541,0.3555262,0.05351058,-0.18752107,-0.14839216,-0.41800985,-0.028797565,0.41444227,-1.4191595,-0.16920258,-0.17543876,0.21780294,0.52618337,-0.24424972,-0.05002696,-0.12539855,-0.3296274,0.5038034,0.53540313,-0.27000278,-0.27462,0.54530966,-0.005053069,-0.18886183,-0.15567838,-0.1782366,0.0017277142,0.052524302,-0.18636018,-0.004773688,0.2827342,-0.07286902,-0.21148063,-0.1916361,-0.42682934,-0.33821493,0.7139122,-0.5959964,-0.80468875,-0.55761766,0.58745575,-0.1252882,-0.035433024,-0.07958356,0.40156513,-0.3907574,0.10876795,-0.3997691,0.04152567,0.12511976,0.13286082,-0.04415777,-0.22096434,0.08002848,-0.15289278,0.1435645,-0.25252807,0.12685634,-0.11598182,0.2954461,0.5960455,0.2642108,-0.004988241,0.53942066,-0.3083602,0.043376807,-0.52243817,-0.37953106,-0.047097757,-0.44143295,0.17283803,-0.22096783,-0.22697651,0.5644442,0.20032464,0.34259337,0.052571952,0.56179863,-0.31954175,-0.4693169,0.54661983,0.105849445,-0.27028054,-0.13091058,-0.2982593,-0.050627854,-0.03567436,-0.5184967,0.031724326,-0.08721896,0.5759184,0.29537737,0.46982875,0.41931143,0.31494534,-0.20884347,0.79424,-0.0414741,0.20011383,-0.1897451,-0.013226944,-0.2169145,0.31449223,-0.08013642,0.56396353,0.49869224,0.15094516,-0.03071852,-0.1522659,0.22539027,-0.08173019,-0.7392288,-0.16358833,-0.18792991,-0.23563719,-0.5841303,0.15646438,-0.52718663]	309	11
66	[-0.22027844,-0.20939977,-0.0047124275,-0.0753368,0.2742455,-0.42220998,0.07262243,0.29801422,0.5984664,-0.28697807,-0.053982005,0.21611767,0.7974294,-0.2157175,-0.0041744323,-0.14627957,1.0399798,0.01744475,-0.09319319,-0.097124465,0.22683086,-0.03748173,0.008368103,0.34323907,-0.28456342,0.016463296,-0.34657007,-0.27331418,-0.42631742,-0.09195795,0.35790822,0.09213093,0.0013614204,0.3530305,0.0049359812,-0.42050764,0.033917956,-0.097965635,-0.3997868,-0.32996982,-0.048116673,-0.26520053,0.22825107,-0.07666669,0.03236147,0.08563549,0.31712252,-0.017014414,0.05185724,-0.38793024,0.20885949,0.5667565,-0.03301399,0.061147694,-0.40396073,0.17984465,-0.1442596,0.26407358,-0.15380824,-0.15992439,0.6937424,0.00015417833,0.012668398,-0.19065563,-0.024586793,-0.110526666,0.0951562,-0.37268633,0.2521876,-0.027122745,0.614239,-0.57710934,0.29817802,-0.44987288,-0.14107956,0.5186541,-0.17432712,-0.3381442,0.07729262,0.23727609,0.32255468,-0.93911815,-0.07585984,0.36184198,0.28802648,-0.30539736,-1.2585998,0.41253307,-0.20890804,-0.02661415,0.040363174,0.071695566,-5.2214613,0.07385169,0.073085055,0.33353525,0.16931579,0.5331794,0.34180942,1.5492872,0.11350409,-0.09949598,0.27179953,0.61046743,0.18729338,-0.16259427,-1.4082255,0.14781487,0.07252211,-0.11050976,-0.053024027,0.33849862,-0.060541846,-0.2749144,0.012516003,-0.45925993,-0.07548848,0.025040755,-0.46537378,0.14047338,-0.058231436,0.41785166,-0.053625666,0.43484747,0.016023688,-0.24543552,0.39402145,0.1945162,0.16406971,0.17877175,-0.14991666,-0.5790796,-0.30693543,0.7418339,0.28190437,-0.11785028,-0.45325497,-0.51781356,-0.53638464,-0.18315305,-0.0008686848,-0.50103647,-0.32940507,-0.54921836,-0.37148747,-0.2076901,0.03541697,-0.08969539,0.32849365,0.16928872,-0.3526904,0.05821129,-1.1883773,0.10738115,-0.2162534,-0.37299886,-0.18950303,0.38374987,0.36351717,-0.057164162,0.29226273,-0.1512304,0.07039939,0.11778813,0.64789027,0.17761786,0.12889992,0.18459551,0.3210427,0.356578,0.23547538,-0.06480883,-0.21148159,0.34030604,-0.30358592,0.2391222,-1.2544115,-0.39031774,-0.92740726,0.13180068,0.31671852,0.39127958,0.37860057,-0.3370372,-0.38703898,0.20228739,0.3063556,-0.2550503,-0.36423674,-0.006645752,0.41661906,0.4069672,0.559009,0.2975602,-0.5885253,-0.46870175,-0.09028782,0.09975035,-0.6276789,0.19186828,-0.019160239,0.08953727,-0.09135217,0.12549384,0.08519267,0.43608055,-0.23086858,0.18804981,0.28575376,-0.06820612,-0.64391124,0.33092433,0.25805917,0.09964711,-0.58483356,0.12122306,0.09799629,0.013488842,-0.17166497,-0.14256604,-0.14255579,-0.537833,-0.034406222,0.5524353,-0.33232847,0.074230246,-0.31433776,-0.09787577,-0.2749823,-0.29197496,-0.05225116,0.3075144,0.12689589,0.095520146,0.54871327,0.59526783,0.3639878,0.12902527,-0.07329972,0.103682965,-0.44631207,0.054132476,0.473181,0.027999932,0.18178283,-0.11999566,-0.13876678,-0.16551906,-0.27862516,0.08894779,0.33316657,-0.1025273,-0.39367586,0.16937596,0.10681537,0.20940165,-0.5886067,-0.011903438,-1.7931966,0.25852874,0.0054295366,0.023775171,0.04792078,-2.4943023,-0.15585315,-0.047182743,0.3069788,0.06485469,-0.37256524,0.39473838,-0.25268874,-0.46410227,-0.0674798,-0.14688964,0.334204,0.0099567035,0.56976926,0.19385767,-0.25173607,-0.36469632,0.15331115,0.14179586,-0.47700235,0.24528937,-0.00037748594,-0.31433937,1.1559675,-0.23477638,0.25094455,0.14793529,0.24847895,0.06381149,-0.059178002,-0.11222421,0.0778275,-0.33420306,-0.10173146,-0.36931962,0.34801507,-0.16294204,-0.4022845,0.043913577,-0.10821521,0.50963634,-0.21262541,-0.48711324,0.012247189,-0.018291228,0.44231695,0.029008547,-0.11527405,-0.022653675,0.7381056,0.6060159,0.2022824,-0.050222665,-0.15950786,-0.22624737,0.3862419,-0.36747035,0.5914348,1.6672566,0.45079428,-0.17362428,0.4882161,-0.18070814,0.16829462,0.35988727,-0.15262572,-0.52481306,-0.17325984,-0.15433672,-0.3417065,0.3591371,-0.0141518805,-0.27801612,-0.20116657,0.03095973,0.25498992,0.75269914,-0.24368384,-0.36362442,0.14889456,-0.01176519,-0.29105714,-0.34588933,0.25445735,-0.3165903,0.16027313,-0.32726592,0.2020557,0.14990538,-0.04691823,-0.23090626,0.34680644,-0.5420417,-0.32253602,0.31854895,-0.054301918,-0.026761139,0.09451433,-0.008515869,-0.075409,-0.21241394,0.18972144,-0.15687916,0.16301113,-0.160042,0.3417313,-0.073359795,0.27823895,0.25447693,0.7267403,0.07353979,-0.30089387,0.49065107,-0.16419213,-0.024273507,-0.058445185,0.15291664,0.08286097,-0.07863685,-0.17410128,0.2210465,0.24496421,-0.03130609,-0.11622276,0.16115433,-0.21699733,-0.5162457,-0.1911178,-0.3364092,-0.009976557,-0.24151683,-0.09081376,0.34568805,-0.05902365,0.120389655,0.1521565,-0.5306492,-0.09009151,-0.18645605,-0.466398,0.0052285204,-0.387563,0.059149932,0.478803,-0.19837107,-0.2234871,-0.164623,-0.21758772,0.4322282,0.68560827,0.14616357,-0.23364647,0.22957936,-0.33218762,0.34115967,0.02900282,-0.35264882,-0.0064716176,-0.22889766,0.08768393,0.008490565,0.35632518,0.12804362,0.1864729,-0.11875403,0.39964756,-0.3138911,0.43250224,-0.10690485,-0.3170183,-0.06474722,0.24783623,-0.38014212,0.26309177,0.043116152,0.32843098,-0.008492696,0.45106286,0.24183205,-0.42716038,-0.033890765,0.008316451,0.009492366,-0.44004878,0.42029434,0.23445313,-0.0221912,-0.30228883,-0.2927524,-0.21874098,0.14594401,0.14645241,0.36212894,-0.6268163,0.25092557,-0.13007678,0.14158906,-0.07940725,0.47979063,0.31836417,-0.22500038,0.14259888,0.2009082,-0.20806146,0.0699624,0.07342209,0.24291995,0.3199164,0.7561721,0.1273133,0.02032429,0.07355026,0.4761804,-0.00031163488,0.20012443,-0.08801733,-0.22582895,0.101457834,-0.80630076,-0.17536294,0.029946454,0.07324597,0.1813906,0.44742015,-0.056752626,0.28488347,0.17435148,0.12078703,0.36837456,0.35925004,-0.17607385,0.15899597,-0.4978224,0.3266807,0.2069147,0.48625353,0.37937713,-0.15581833,0.011141407,0.3796935,0.13492425,-0.09362467,-0.58065,-0.13244,-0.30412385,-0.111886114,-0.3107812,0.36952075,-0.10586984]	310	11
67	[-0.41619188,-0.13683115,-0.10703865,-0.22974588,0.2655553,-0.12698866,0.2312687,0.4319624,0.24998659,-0.020221673,-0.07145648,0.23563576,0.5515738,-0.054616194,-0.27334836,-0.09490619,1.0236559,0.13893446,-0.02110598,-0.19775164,-0.05415188,-0.08163737,-0.1325527,0.3721703,-0.16647123,0.23609252,-0.19890256,-0.25766695,-0.40552682,-0.1882541,0.39028102,-0.06119046,-0.04272209,0.12218742,-0.13674246,-0.34685937,0.11249427,-0.14095227,-0.3776513,0.10860511,0.07093996,-0.11809699,0.27468634,-0.06162086,0.06595199,-0.30834028,0.33197653,-0.091767296,0.14077199,-0.509441,0.20442419,0.19105013,-0.03921626,-0.14371885,-0.37930247,-0.0073258695,-0.046500053,0.25260127,-0.12469191,-0.032372944,0.6665323,-0.007990874,0.0030208577,-0.15497783,0.009956113,-0.17027445,0.07679735,-0.49720794,0.11878494,0.10315598,0.5130745,-0.3843643,0.14881016,-0.4087575,-0.17666501,0.537808,-0.5593028,-0.16540316,-0.08839935,0.38129556,0.12574026,-1.0121413,-0.015059723,0.03362243,0.31402865,-0.41196004,-1.1277574,0.3886622,-0.20594235,-0.021066744,0.12027574,0.21675022,-4.7748075,0.06665189,0.24359417,0.39718437,0.16897564,0.58692724,0.25911584,1.4235989,0.05581906,-0.14397828,0.26813045,0.32875276,0.35569412,0.014448218,-1.3763555,0.13730526,0.039667938,-0.12878452,0.022827873,0.6449364,-0.1737606,-0.16975787,-0.013838312,-0.30209967,-0.11187481,0.01921318,-0.6756175,0.00470663,0.10961224,0.63144463,-0.05278428,0.3624361,-0.049520206,-0.036380026,0.33203676,0.46000412,0.40610936,0.3075744,0.11652867,-0.8310829,-0.16717605,0.70912856,0.062316116,-0.16404422,-0.5590915,-0.39422002,-0.37704223,-0.23366097,-0.02238912,-0.473136,-0.40509546,-0.6144935,-0.37173846,-0.22793959,0.026059022,0.03024873,0.2152203,0.13125741,-0.24817315,-0.10197564,-1.743036,-0.1326161,-0.32318607,-0.56440836,-0.19379362,0.077567935,0.26634195,0.1655833,0.46911934,-0.17688383,0.22634883,0.2502822,0.5862949,-0.038650975,-0.1620212,0.03272283,0.26563895,0.33009225,-0.009383321,-0.15152363,-0.078459114,0.13392387,-0.15116554,0.33339265,-1.1523553,-0.37119743,-0.8006655,0.06607372,0.43426126,0.2334084,0.28959852,-0.14355575,-0.32055327,0.16387698,0.12126208,-0.48004514,-0.29853705,-0.114842564,0.39850664,0.3990234,0.3996851,0.06762488,-0.45207632,-0.38608375,-0.07740149,0.026735129,-0.7474776,0.24361,0.09155339,0.18870582,0.040194478,0.20179498,0.25060186,0.5496837,-0.23592976,0.2892149,0.07365724,-0.03515,-0.6059829,0.044196498,0.08878577,0.12520602,-0.67158544,0.19302468,0.021433147,-0.03291846,-0.23076704,-0.19509238,-0.21126077,-0.45182666,-0.047845952,0.21961558,-0.08261492,-0.022702493,-0.45655298,-0.18597023,-0.29501244,-0.36725718,-2.5257687e-05,0.36173585,0.0102806995,0.10074194,0.60053664,0.53027904,0.41397825,0.35531518,-0.06711171,-0.10575563,-0.44922432,-0.026021602,0.53306663,0.027485564,0.06549108,-0.123077944,-0.38231605,-0.02531639,-0.13908158,-0.061598476,0.20595771,-0.116745874,-0.43399376,0.2280784,0.15511908,0.23626922,-0.6953465,0.1926897,-1.3501905,0.24286245,0.056252994,-0.0021168052,-0.19475083,-2.5838506,-0.19100669,-0.058674194,0.43938333,0.058235332,-0.26630732,0.32304108,-0.18123418,-0.5075954,0.10208272,-0.13481651,0.23825285,0.19641554,0.6055545,0.41820565,-0.17065848,-0.25117943,-0.016195731,0.045432683,-0.46887875,0.18579766,-0.012006911,-0.34347552,1.0944337,-0.1754008,0.13150923,0.23254578,0.17686363,0.008470068,-0.16984697,-0.23346865,0.15092377,-0.2707431,-0.16335753,-0.33261746,0.29198226,0.07171351,-0.52535903,0.13121155,0.06537961,0.35045236,-0.08637911,-0.3808429,-0.03956396,0.012381833,0.5481526,-0.0025604088,0.054671407,-0.12039146,0.70527303,0.50529045,-0.10655554,-0.06825708,0.14276822,-0.1680379,0.28513837,-0.48970744,0.24441947,1.2892592,0.32324386,-0.33788326,0.31509563,-0.16759087,0.2576923,0.22370356,-0.45563364,-0.3943495,-0.04570974,0.20816258,-0.16623597,0.38247052,0.046739887,-0.24659668,-0.003229231,0.19310558,0.33537975,0.40505865,0.012932543,-0.28861982,0.28368104,-0.053068597,-0.11291248,-0.2739953,0.142364,-0.10237455,0.13041474,-0.09829471,0.5119494,0.13459772,0.12057449,-0.33274972,0.43941733,-0.34285235,-0.42183545,0.36194703,-0.05374072,0.00031454297,0.09182223,-0.18218778,-0.20313296,-0.39053282,0.33559272,-0.054650895,0.17128506,-0.081263386,0.20073219,-0.24184601,0.2531854,0.31290388,0.5762854,-0.043056753,-0.34420502,0.37830904,-0.1904714,0.020391876,-0.05960906,0.21204269,0.14061664,-0.13367794,0.049854167,0.29970574,0.20309074,0.20723449,-0.17704645,0.05860014,0.028045373,0.17083229,-0.17203434,-0.2766819,0.04192825,-0.32406482,-0.21656175,0.36672556,-0.05588511,-0.019106284,0.1521469,-0.6369559,-0.12984666,-0.27261752,-0.5430859,-0.057969376,-0.40235743,-0.09229792,0.5822219,-0.15800543,-0.5624773,-0.12319669,-0.10677019,0.41669983,0.55808324,0.14935939,-0.3165773,0.1483374,-0.33655205,0.53514934,0.08906467,-0.45096284,-0.046382025,-0.22346616,0.036036715,-0.11010859,0.12492278,0.1468349,0.12066499,0.037132435,0.5209703,-0.32585263,0.35264415,-0.31431326,-0.39298284,-0.06204499,0.09398866,-0.26576203,0.035347413,-0.13979751,0.41368276,-0.16408408,0.29125994,0.24024741,-0.37144744,0.1784289,-0.11717457,-0.09569951,-0.18635699,0.40556273,0.1277021,0.29536274,-0.31331328,-0.0900065,0.020554788,0.42185926,0.1364356,0.3175383,-0.57458025,0.2446786,-0.120661676,0.2764036,-0.19488494,0.5060956,0.41438892,-0.24154511,0.25218865,0.212932,-0.36872938,-0.072146446,-0.1202345,0.1414979,0.43024155,0.8178711,0.119606495,-0.16181765,0.11496785,0.3894198,-0.022189608,0.19655901,-0.0068548233,-0.30648124,0.0597911,-0.77213556,-0.14819032,-0.00029852902,-0.20784225,0.32239264,0.45134386,-0.015665693,0.28162456,0.2949094,0.32091242,0.14045043,0.3965469,-0.25899425,0.117618114,-0.40063766,0.21301286,0.0495448,0.5292827,0.24726714,-0.070079155,-0.11144061,0.45698586,0.32098868,-0.13905002,-0.69811606,-0.079051845,-0.3573029,-0.13565093,-0.39529935,0.36213136,-0.042144436]	311	11
\.


--
-- Data for Name: product_info_values; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_info_values (value, "productInfoId", "productId") FROM stdin;
Nhựa	4	2
Trung Quốc	3	2
7	2	2
NINJAGO	1	2
Nhựa	4	7
Trung Quốc	3	7
7	2	7
NINJAGO	1	7
Nhựa	4	9
Trung Quốc	3	9
7	2	9
NINJAGO	1	9
Nhựa	4	11
Trung Quốc	3	11
3	2	11
BATMAN FIGURE	1	11
\.


--
-- Data for Name: product_informations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_informations ("productInfoId", "productInfoName", "isActive", type, options, "createdAt", "updatedAt") FROM stdin;
1	Chủ đề	t	INPUT	\N	2025-03-10 02:31:17.302+00	2025-03-10 02:31:17.302+00
2	Tuổi	t	INPUT_NUMBER	\N	2025-03-10 02:31:28.742+00	2025-03-10 02:31:28.742+00
3	Xuất xứ	t	AUTOCOMPLETE	{"Việt Nam","Trung Quốc","Nhật Bản","Hàn Quốc"}	2025-03-10 02:31:52.208+00	2025-03-10 02:31:52.208+00
4	Chất liệu	t	SELECT	{Gỗ,Nhựa}	2025-03-10 02:32:07.129+00	2025-03-10 02:32:07.129+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.products ("productId", "productName", slug, quantity, description, "soldNumber", "avgRating", "isActive", "createdAt", "updatedAt", "brandId", "categoryId", "promotionId") FROM stdin;
2	Đồ chơi lắp ráp Chiến giáp của Cole LEGO NINJAGO 71806	do-choi-lap-rap-chien-giap-cua-cole-lego-ninjago-71806	50	Siêu chiến giáp của Cole có buồng lái và được trang bị một cây búa để chiến đấu với những tên Chiến binh Sói gian ác. Và bây giờ, bạn có thể kết hợp các bộ phận của 3 cỗ máy ninja tuyệt vời do Cole, Sora và Kai điều khiển để tạo ra cỗ máy kết hợp của riêng bạn. Mỗi cỗ máy có thể tùy chỉnh và được bán riêng, đi kèm với chân, tay, vũ khí và thân có thể tháo rời để bạn có thể kết hợp.\r\n\r\n• Xây dựng những bộ chiến giáp của riêng bạn – Những bé hâm mộ NINJAGO® có thể tận hưởng hàng giờ vui vẻ sáng tạo khi kết hợp các bộ phận từ những bộ đồ chơi khác nhau (được bán riêng) để tạo ra những bộ siêu chiến giáp NINJAGO® của riêng mình\r\n\r\n• 2 nhân vật NINJAGO® – Bộ trò chơi bao gồm Cole với phụ kiện thanh kiếm mini và Chiến binh Sói gian ác cũng có thanh kiếm. Bé có thể tái hiện các trận chiến từ phần 2 của bộ phim hoạt hình NINJAGO Dragons Rising\r\n\r\n• Chiến giáp có thể điều chỉnh được – chiến giáp hạng nặng này có buồng lái để bé có thể đặt Cole vào, một chiếc búa lớn và tay chân có thể điều chỉnh được, có thể nghiêng và điều chỉnh thành các tư thế chiến đấu. Ngoài ra bé có thể hoán đổi và kết hợp các bộ phận từ chiến giáp của Cole với chiến giáp công nghệ của Sora (71807) và chiến giáp Kai (71808) được bán riêng\r\n\r\n• Quà tặng siêu hấp dẫn cho bé – Bộ LEGO® NINJAGO siêu đỉnh này sẽ mang đến cho bé nghiệm lắp ráp và vui chơi sáng tạo. Qúa thích hợp làm quà tặng cho những dịp sinh nhật hoặc lễ Tết.\r\n\r\n• Xây dựng thế giới LEGO® NINJAGO® của bé – Cùng sưu tập thêm những bộ trò chơi LEGO® NINJAGO® khác và xây dựng một thế giới của riêng bé, từ đó mở ra những câu chuyện mới\r\n\r\n• Kích thước – Bộ lắp ráp LEGO® gồm 235 mảnh, sau khi hoàn thiện cao trên 5,5 inch (14 cm)	3	0	t	2025-03-10 02:34:14.81+00	2025-03-10 02:35:30.445+00	1	1	\N
9	test1	test1	50	Siêu chiến giáp của Cole có buồng lái và được trang bị một cây búa để chiến đấu với những tên Chiến binh Sói gian ác. Và bây giờ, bạn có thể kết hợp các bộ phận của 3 cỗ máy ninja tuyệt vời do Cole, Sora và Kai điều khiển để tạo ra cỗ máy kết hợp của riêng bạn. Mỗi cỗ máy có thể tùy chỉnh và được bán riêng, đi kèm với chân, tay, vũ khí và thân có thể tháo rời để bạn có thể kết hợp.\r\n\r\n• Xây dựng những bộ chiến giáp của riêng bạn – Những bé hâm mộ NINJAGO® có thể tận hưởng hàng giờ vui vẻ sáng tạo khi kết hợp các bộ phận từ những bộ đồ chơi khác nhau (được bán riêng) để tạo ra những bộ siêu chiến giáp NINJAGO® của riêng mình\r\n\r\n• 2 nhân vật NINJAGO® – Bộ trò chơi bao gồm Cole với phụ kiện thanh kiếm mini và Chiến binh Sói gian ác cũng có thanh kiếm. Bé có thể tái hiện các trận chiến từ phần 2 của bộ phim hoạt hình NINJAGO Dragons Rising\r\n\r\n• Chiến giáp có thể điều chỉnh được – chiến giáp hạng nặng này có buồng lái để bé có thể đặt Cole vào, một chiếc búa lớn và tay chân có thể điều chỉnh được, có thể nghiêng và điều chỉnh thành các tư thế chiến đấu. Ngoài ra bé có thể hoán đổi và kết hợp các bộ phận từ chiến giáp của Cole với chiến giáp công nghệ của Sora (71807) và chiến giáp Kai (71808) được bán riêng\r\n\r\n• Quà tặng siêu hấp dẫn cho bé – Bộ LEGO® NINJAGO siêu đỉnh này sẽ mang đến cho bé nghiệm lắp ráp và vui chơi sáng tạo. Qúa thích hợp làm quà tặng cho những dịp sinh nhật hoặc lễ Tết.\r\n\r\n• Xây dựng thế giới LEGO® NINJAGO® của bé – Cùng sưu tập thêm những bộ trò chơi LEGO® NINJAGO® khác và xây dựng một thế giới của riêng bé, từ đó mở ra những câu chuyện mới\r\n\r\n• Kích thước – Bộ lắp ráp LEGO® gồm 235 mảnh, sau khi hoàn thiện cao trên 5,5 inch (14 cm)	0	0	t	2025-03-10 03:11:02.271+00	2025-03-10 03:11:02.271+00	1	1	\N
7	testsssss	testsssss	50	Siêu chiến giáp của Cole có buồng lái và được trang bị một cây búa để chiến đấu với những tên Chiến binh Sói gian ác. Và bây giờ, bạn có thể kết hợp các bộ phận của 3 cỗ máy ninja tuyệt vời do Cole, Sora và Kai điều khiển để tạo ra cỗ máy kết hợp của riêng bạn. Mỗi cỗ máy có thể tùy chỉnh và được bán riêng, đi kèm với chân, tay, vũ khí và thân có thể tháo rời để bạn có thể kết hợp.\r\n\r\n• Xây dựng những bộ chiến giáp của riêng bạn – Những bé hâm mộ NINJAGO® có thể tận hưởng hàng giờ vui vẻ sáng tạo khi kết hợp các bộ phận từ những bộ đồ chơi khác nhau (được bán riêng) để tạo ra những bộ siêu chiến giáp NINJAGO® của riêng mình\r\n\r\n• 2 nhân vật NINJAGO® – Bộ trò chơi bao gồm Cole với phụ kiện thanh kiếm mini và Chiến binh Sói gian ác cũng có thanh kiếm. Bé có thể tái hiện các trận chiến từ phần 2 của bộ phim hoạt hình NINJAGO Dragons Rising\r\n\r\n• Chiến giáp có thể điều chỉnh được – chiến giáp hạng nặng này có buồng lái để bé có thể đặt Cole vào, một chiếc búa lớn và tay chân có thể điều chỉnh được, có thể nghiêng và điều chỉnh thành các tư thế chiến đấu. Ngoài ra bé có thể hoán đổi và kết hợp các bộ phận từ chiến giáp của Cole với chiến giáp công nghệ của Sora (71807) và chiến giáp Kai (71808) được bán riêng\r\n\r\n• Quà tặng siêu hấp dẫn cho bé – Bộ LEGO® NINJAGO siêu đỉnh này sẽ mang đến cho bé nghiệm lắp ráp và vui chơi sáng tạo. Qúa thích hợp làm quà tặng cho những dịp sinh nhật hoặc lễ Tết.\r\n\r\n• Xây dựng thế giới LEGO® NINJAGO® của bé – Cùng sưu tập thêm những bộ trò chơi LEGO® NINJAGO® khác và xây dựng một thế giới của riêng bé, từ đó mở ra những câu chuyện mới\r\n\r\n• Kích thước – Bộ lắp ráp LEGO® gồm 235 mảnh, sau khi hoàn thiện cao trên 5,5 inch (14 cm)	0	0	t	2025-03-10 03:02:02.092+00	2025-03-10 03:51:17.279+00	1	1	\N
11	Mô Hình Nhân Vật Người Dơi 4inch BATMAN 6055946	mo-hinh-nhan-vat-nguoi-doi-4inch-batman-6055946	20	Đồ chơi BATMAN mô hình siêu anh hùng 4 inch 6058529 là mô hình đồ chơi siêu anh hùng đến từ vũ trụ DC chiếm được tình cảm không nhỏ của mọi người trên toàn thế giới. Mô hình sở hữu các chi tiết hoàn hảo, lắp ráp dễ dàng với các khớp nối linh hoạt. Sản phẩm đến từ hãng BATMAN cực kỳ an toàn cho bé trong quá trình chơi cũng như kích thích sự phát triển trí tuệ của bé\r\n\r\nĐồ chơi siêu anh hùng 6058529 gây ấn tượng với những đặc điểm nổi bật sau đây:\r\n\r\n    Sản phẩm có đường nét và chi tiết sắc sảo kết hợp với áo choàng mềm mại cực kỳ giống với nhân vật trên phim ảnh mang đến một anh hùng người dơi “siêu thực”.\r\n    Mô hình hành động với kích thước chuẩn 10cm nhỏ gọn phù hợp mang đi nhiều nơi cũng như cho bé cầm nắm trong quá trình chơi.\r\n    Sản phẩm được đi kèm 3 vũ khí bí mật như: găng tay, khiên chắn, súng plasma nhằm hỗ trợ bé có thể biến hoá nhiều trạng thái thông qua khả năng tư duy lắp ráp của bé từ đó kích thích trí tuệ, sự tưởng tượng và sáng tạo của trẻ bay cao để cho các nhân vật trong việc hoàn thành nhiệm vụ hay kế hoạch đặt ra của các bé.\r\n    Sản phẩm được làm từ nhựa cao cấp, các góc cạnh được bo tròn với bề mặt nhẵn tạo sự an toàn, không làm trầy xước da khi bé chơi. \r\n    Sở hữu 11 khớp nối giúp bé có thể sáng tạo ra những hành động hay tư thế khác nhau để hòa mình vào cuộc chiến của riêng mình và các bạn chơi cùng.\r\n    Quá trình tháo lắp dễ dàng mà không sợ dễ dàng bị hư hỏng, rớt các khớp nên không hề độc hại trong quá trình bé chơi robot.\r\n    Hỗ trợ kích thích phát triển vận động cũng như trí não của bé trong quá trình chơi mô hình.\r\n    Sản phẩm phù hợp cho các bé có độ tuổi từ 3 tuổi trở lên.\r\n    Sản phẩm giao hàng ngẫu nhiên	0	0	t	2025-03-10 04:00:19.481+00	2025-03-10 12:15:33.121+00	2	2	\N
\.


--
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.promotions ("promotionId", "promotionName", description, "discountType", "discountValue", "startDate", "endDate", "createdAt", "updatedAt", "promotionThumbnailId") FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.reviews ("reviewId", comment, rating, "createdAt", "orderDetailId", "userId", "productId", "parentReviewId") FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.roles ("roleId", "roleName", "roleDesc", "isActive", "createdAt", "updatedAt") FROM stdin;
1	Khách hàng	Người dùng mua sắm và sử dụng dịch vụ	t	2025-03-09 09:13:11.049274+00	2025-03-09 09:13:11.049274+00
2	Quản trị viên	Người quản lý toàn bộ hệ thống	t	2025-03-09 09:13:11.049274+00	2025-03-09 09:13:11.049274+00
3	Nhân viên	Nhân viên hỗ trợ và quản lý một phần hệ thống	t	2025-03-09 09:13:11.049274+00	2025-03-09 09:13:11.049274+00
\.


--
-- Data for Name: system_configurations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.system_configurations ("systemConfigId", "shopName", "shopEmail", "shopPhone", "createdAt", "updatedAt", "logoId") FROM stdin;
\.


--
-- Data for Name: upload_images; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.upload_images ("uploadImageId", url, "filePath", "reviewId", "productId") FROM stdin;
1	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/Luffy.jpg-1741512069649	images/Luffy.jpg-1741512069649	\N	\N
2	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_3.webp-1741573851798	images/71806_3.webp-1741573851798	\N	\N
8	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_1.webp-1741574054094	images/71806_1.webp-1741574054094	\N	2
9	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_1-2.webp-1741574054095	images/71806_1-2.webp-1741574054095	\N	2
10	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_2.webp-1741574054095	images/71806_2.webp-1741574054095	\N	2
11	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1741574054095	images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1741574054095	\N	2
12	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_5.webp-1741574054096	images/71806_5.webp-1741574054096	\N	2
33	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_1-2.webp-1741575719770	images/71806_1-2.webp-1741575719770	\N	7
34	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_2.webp-1741575719773	images/71806_2.webp-1741575719773	\N	7
35	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_3.webp-1741575719774	images/71806_3.webp-1741575719774	\N	7
36	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1741575719774	images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1741575719774	\N	7
37	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_5.webp-1741575719774	images/71806_5.webp-1741575719774	\N	7
308	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1741608782000	images/6055946_2.webp-1741608782000	\N	\N
287	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_3.webp-1741578715819	images/71806_3.webp-1741578715819	\N	9
309	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_1.webp-1741608930700	images/6055946_1.webp-1741608930700	\N	11
310	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1741608930700	images/6055946_2.webp-1741608930700	\N	11
311	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_4.webp-1741608930701	images/6055946_4.webp-1741608930701	\N	11
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.users ("userId", "fullName", email, password, phone, gender, birthday, "isActive", "createdAt", "updatedAt", "avatarId", "roleId") FROM stdin;
1	Duong Hoai Bao	baob2103488@student.ctu.edu.vn	$2b$10$w2eJGZtvcnZFT2hhZ3IO0O.KBYTHrgEbUzD7AZy3dvuJB.rshyUhi	\N	\N	2003-05-25 00:00:00	t	2025-03-09 09:20:41.76+00	2025-03-09 09:20:41.76+00	\N	1
2	Duong Hoai Bao	admin@gmail.com	$2b$10$v1Q5Ltn3N78FVqqx4eEJRe5GykpO8TQj1AG5Qt0NwsD5Z4LQXjfmO	0942463758	t	2003-05-25 00:00:00	t	2025-03-09 09:21:09.627+00	2025-03-09 09:21:14.056+00	1	2
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.vouchers ("voucherId", "voucherCode", "discountType", "discountValue", "minOrderPrice", "maxPriceDiscount", "startDate", "endDate", quantity, "collectedQuantity", "currentUsedQuantity", "createdAt", "updatedAt") FROM stdin;
1	NGUOIMOI	fixed_amount	30000	0	0	2025-03-01 00:00:00	2025-04-15 00:00:00	20	0	0	2025-03-10 02:36:03.35+00	2025-03-10 02:36:03.35+00
\.


--
-- Name: addresses_addressId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."addresses_addressId_seq"', 1, true);


--
-- Name: banners_bannerId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."banners_bannerId_seq"', 1, false);


--
-- Name: brands_brandId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."brands_brandId_seq"', 2, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 1, true);


--
-- Name: categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."categories_categoryId_seq"', 2, true);


--
-- Name: messages_messageId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."messages_messageId_seq"', 4, true);


--
-- Name: newses_newsId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."newses_newsId_seq"', 1, false);


--
-- Name: order_addresses_orderAddressId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_addresses_orderAddressId_seq"', 1, true);


--
-- Name: order_details_orderDetailId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_details_orderDetailId_seq"', 1, true);


--
-- Name: order_statuses_orderStatusId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_statuses_orderStatusId_seq"', 5, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, true);


--
-- Name: payment_methods_paymentMethodId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."payment_methods_paymentMethodId_seq"', 2, true);


--
-- Name: permissions_permissionId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."permissions_permissionId_seq"', 23, true);


--
-- Name: price_filters_priceFilterId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."price_filters_priceFilterId_seq"', 1, false);


--
-- Name: price_histories_priceHistoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."price_histories_priceHistoryId_seq"', 12, true);


--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public.product_embeddings_product_embedding_id_seq', 16, true);


--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_image_embeddings_productImageEmbeddingId_seq"', 67, true);


--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_informations_productInfoId_seq"', 4, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."products_productId_seq"', 11, true);


--
-- Name: promotions_promotionId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."promotions_promotionId_seq"', 1, false);


--
-- Name: reviews_reviewId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."reviews_reviewId_seq"', 1, false);


--
-- Name: roles_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."roles_roleId_seq"', 3, true);


--
-- Name: system_configurations_systemConfigId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."system_configurations_systemConfigId_seq"', 1, false);


--
-- Name: upload_images_uploadImageId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."upload_images_uploadImageId_seq"', 311, true);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."users_userId_seq"', 2, true);


--
-- Name: vouchers_voucherId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."vouchers_voucherId_seq"', 1, true);


--
-- Name: _permission_roles _permission_roles_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._permission_roles
    ADD CONSTRAINT "_permission_roles_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: _user_voucher _user_voucher_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._user_voucher
    ADD CONSTRAINT "_user_voucher_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY ("addressId");


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY ("bannerId");


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY ("brandId");


--
-- Name: cart_details cart_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.cart_details
    ADD CONSTRAINT cart_details_pkey PRIMARY KEY ("productId", "cartId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY ("categoryId");


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY ("messageId");


--
-- Name: newses newses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.newses
    ADD CONSTRAINT newses_pkey PRIMARY KEY ("newsId");


--
-- Name: order_addresses order_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_addresses
    ADD CONSTRAINT order_addresses_pkey PRIMARY KEY ("orderAddressId");


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY ("orderDetailId");


--
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY ("orderStatusId");


--
-- Name: order_trackings order_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_trackings
    ADD CONSTRAINT order_trackings_pkey PRIMARY KEY ("orderId", "orderStatusId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY ("paymentMethodId");


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY ("permissionId");


--
-- Name: price_filters price_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.price_filters
    ADD CONSTRAINT price_filters_pkey PRIMARY KEY ("priceFilterId");


--
-- Name: price_histories price_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.price_histories
    ADD CONSTRAINT price_histories_pkey PRIMARY KEY ("priceHistoryId");


--
-- Name: product_embeddings product_embeddings_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_embeddings
    ADD CONSTRAINT product_embeddings_pkey PRIMARY KEY (product_embedding_id);


--
-- Name: product_image_embeddings product_image_embeddings_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_image_embeddings
    ADD CONSTRAINT product_image_embeddings_pkey PRIMARY KEY ("productImageEmbeddingId");


--
-- Name: product_info_values product_info_values_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_info_values
    ADD CONSTRAINT product_info_values_pkey PRIMARY KEY ("productId", "productInfoId");


--
-- Name: product_informations product_informations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_informations
    ADD CONSTRAINT product_informations_pkey PRIMARY KEY ("productInfoId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY ("promotionId");


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY ("reviewId");


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY ("roleId");


--
-- Name: system_configurations system_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.system_configurations
    ADD CONSTRAINT system_configurations_pkey PRIMARY KEY ("systemConfigId");


--
-- Name: upload_images upload_images_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.upload_images
    ADD CONSTRAINT upload_images_pkey PRIMARY KEY ("uploadImageId");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


--
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY ("voucherId");


--
-- Name: _permission_roles_B_index; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE INDEX "_permission_roles_B_index" ON public._permission_roles USING btree ("B");


--
-- Name: _user_voucher_B_index; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE INDEX "_user_voucher_B_index" ON public._user_voucher USING btree ("B");


--
-- Name: banners_uploadImageId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "banners_uploadImageId_key" ON public.banners USING btree ("uploadImageId");


--
-- Name: brands_brandName_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "brands_brandName_key" ON public.brands USING btree ("brandName");


--
-- Name: carts_userId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "carts_userId_key" ON public.carts USING btree ("userId");


--
-- Name: categories_categoryName_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "categories_categoryName_key" ON public.categories USING btree ("categoryName");


--
-- Name: categories_categoryThumbnailId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "categories_categoryThumbnailId_key" ON public.categories USING btree ("categoryThumbnailId");


--
-- Name: categories_slug_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX categories_slug_key ON public.categories USING btree (slug);


--
-- Name: messages_uploadImageId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "messages_uploadImageId_key" ON public.messages USING btree ("uploadImageId");


--
-- Name: newses_title_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX newses_title_key ON public.newses USING btree (title);


--
-- Name: orders_orderAddressId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "orders_orderAddressId_key" ON public.orders USING btree ("orderAddressId");


--
-- Name: product_image_embeddings_upload_image_id_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX product_image_embeddings_upload_image_id_key ON public.product_image_embeddings USING btree (upload_image_id);


--
-- Name: products_productName_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "products_productName_key" ON public.products USING btree ("productName");


--
-- Name: products_slug_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX products_slug_key ON public.products USING btree (slug);


--
-- Name: promotions_promotionThumbnailId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "promotions_promotionThumbnailId_key" ON public.promotions USING btree ("promotionThumbnailId");


--
-- Name: reviews_orderDetailId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "reviews_orderDetailId_key" ON public.reviews USING btree ("orderDetailId");


--
-- Name: system_configurations_logoId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "system_configurations_logoId_key" ON public.system_configurations USING btree ("logoId");


--
-- Name: users_avatarId_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "users_avatarId_key" ON public.users USING btree ("avatarId");


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: vouchers_voucherCode_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX "vouchers_voucherCode_key" ON public.vouchers USING btree ("voucherCode");


--
-- Name: _permission_roles _permission_roles_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._permission_roles
    ADD CONSTRAINT "_permission_roles_A_fkey" FOREIGN KEY ("A") REFERENCES public.permissions("permissionId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _permission_roles _permission_roles_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._permission_roles
    ADD CONSTRAINT "_permission_roles_B_fkey" FOREIGN KEY ("B") REFERENCES public.roles("roleId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _user_voucher _user_voucher_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._user_voucher
    ADD CONSTRAINT "_user_voucher_A_fkey" FOREIGN KEY ("A") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _user_voucher _user_voucher_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._user_voucher
    ADD CONSTRAINT "_user_voucher_B_fkey" FOREIGN KEY ("B") REFERENCES public.vouchers("voucherId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: addresses addresses_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "addresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: banners banners_systemConfigId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT "banners_systemConfigId_fkey" FOREIGN KEY ("systemConfigId") REFERENCES public.system_configurations("systemConfigId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: banners banners_uploadImageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT "banners_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cart_details cart_details_cartId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.cart_details
    ADD CONSTRAINT "cart_details_cartId_fkey" FOREIGN KEY ("cartId") REFERENCES public.carts("cartId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cart_details cart_details_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.cart_details
    ADD CONSTRAINT "cart_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: carts carts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: categories categories_categoryThumbnailId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "categories_categoryThumbnailId_fkey" FOREIGN KEY ("categoryThumbnailId") REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: messages messages_receiverId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_receiverId_fkey" FOREIGN KEY ("receiverId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messages messages_senderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: messages messages_uploadImageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_uploadImageId_fkey" FOREIGN KEY ("uploadImageId") REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_details order_details_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders("orderId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order_details order_details_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order_trackings order_trackings_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_trackings
    ADD CONSTRAINT "order_trackings_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders("orderId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order_trackings order_trackings_orderStatusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.order_trackings
    ADD CONSTRAINT "order_trackings_orderStatusId_fkey" FOREIGN KEY ("orderStatusId") REFERENCES public.order_statuses("orderStatusId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: orders orders_orderAddressId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_orderAddressId_fkey" FOREIGN KEY ("orderAddressId") REFERENCES public.order_addresses("orderAddressId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders orders_paymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES public.payment_methods("paymentMethodId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: orders orders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: orders orders_voucherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_voucherId_fkey" FOREIGN KEY ("voucherId") REFERENCES public.vouchers("voucherId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: price_filters price_filters_systemConfigId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.price_filters
    ADD CONSTRAINT "price_filters_systemConfigId_fkey" FOREIGN KEY ("systemConfigId") REFERENCES public.system_configurations("systemConfigId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: price_histories price_histories_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.price_histories
    ADD CONSTRAINT "price_histories_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product_embeddings product_embeddings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_embeddings
    ADD CONSTRAINT product_embeddings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product_image_embeddings product_image_embeddings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_image_embeddings
    ADD CONSTRAINT product_image_embeddings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product_image_embeddings product_image_embeddings_upload_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_image_embeddings
    ADD CONSTRAINT product_image_embeddings_upload_image_id_fkey FOREIGN KEY (upload_image_id) REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product_info_values product_info_values_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_info_values
    ADD CONSTRAINT "product_info_values_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product_info_values product_info_values_productInfoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.product_info_values
    ADD CONSTRAINT "product_info_values_productInfoId_fkey" FOREIGN KEY ("productInfoId") REFERENCES public.product_informations("productInfoId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands("brandId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories("categoryId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_promotionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES public.promotions("promotionId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: promotions promotions_promotionThumbnailId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT "promotions_promotionThumbnailId_fkey" FOREIGN KEY ("promotionThumbnailId") REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: reviews reviews_orderDetailId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_orderDetailId_fkey" FOREIGN KEY ("orderDetailId") REFERENCES public.order_details("orderDetailId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_parentReviewId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_parentReviewId_fkey" FOREIGN KEY ("parentReviewId") REFERENCES public.reviews("reviewId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: system_configurations system_configurations_logoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.system_configurations
    ADD CONSTRAINT "system_configurations_logoId_fkey" FOREIGN KEY ("logoId") REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: upload_images upload_images_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.upload_images
    ADD CONSTRAINT "upload_images_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: upload_images upload_images_reviewId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.upload_images
    ADD CONSTRAINT "upload_images_reviewId_fkey" FOREIGN KEY ("reviewId") REFERENCES public.reviews("reviewId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users users_avatarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_avatarId_fkey" FOREIGN KEY ("avatarId") REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles("roleId") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

