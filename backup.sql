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
-- Name: public; Type: SCHEMA; Schema: -; Owner: dhoaibao
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO dhoaibao;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: dhoaibao
--

COMMENT ON SCHEMA public IS '';


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
-- Name: _product_promotionperiod; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public._product_promotionperiod (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public._product_promotionperiod OWNER TO dhoaibao;

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
    "time" timestamp(3) without time zone NOT NULL,
    "senderId" integer NOT NULL,
    "receiverId" integer
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
    "categoryId" integer NOT NULL
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
-- Name: promotion_periods; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.promotion_periods (
    "promotionPeriodId" integer NOT NULL,
    "discountType" text NOT NULL,
    "discountValue" double precision NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone NOT NULL,
    "promotionId" integer NOT NULL
);


ALTER TABLE public.promotion_periods OWNER TO dhoaibao;

--
-- Name: promotion_periods_promotionPeriodId_seq; Type: SEQUENCE; Schema: public; Owner: dhoaibao
--

CREATE SEQUENCE public."promotion_periods_promotionPeriodId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."promotion_periods_promotionPeriodId_seq" OWNER TO dhoaibao;

--
-- Name: promotion_periods_promotionPeriodId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dhoaibao
--

ALTER SEQUENCE public."promotion_periods_promotionPeriodId_seq" OWNED BY public.promotion_periods."promotionPeriodId";


--
-- Name: promotions; Type: TABLE; Schema: public; Owner: dhoaibao
--

CREATE TABLE public.promotions (
    "promotionId" integer NOT NULL,
    "promotionName" text NOT NULL,
    description text NOT NULL,
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
    "productId" integer,
    "messageId" integer
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
-- Name: promotion_periods promotionPeriodId; Type: DEFAULT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.promotion_periods ALTER COLUMN "promotionPeriodId" SET DEFAULT nextval('public."promotion_periods_promotionPeriodId_seq"'::regclass);


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
ea1b5e92-9687-4efa-a395-1d3e92767288	315dbddfa5ef172dd6e683290d459168728268d0e959b28d67da758576f55ae7	2025-04-04 16:28:29.222732+00	20250404162828_update	\N	\N	2025-04-04 16:28:28.88202+00	1
\.


--
-- Data for Name: _product_promotionperiod; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._product_promotionperiod ("A", "B") FROM stdin;
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
1	ajhgsd	202	1463	21806	Hồ Chí Minh	Quận Thủ Đức	Phường Linh Đông	asd	asdasd	0912345678	t	1
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
1	Batman	Thuơng hiệu Batman...	t	2025-04-04 16:52:16.578+00	2025-04-04 16:52:16.578+00
2	Avengers	Thương hiệu Avengers...	t	2025-04-04 16:52:35.455+00	2025-04-04 16:52:35.455+00
\.


--
-- Data for Name: cart_details; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.cart_details (quantity, "productId", "cartId") FROM stdin;
1	1	1
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
1	LEGO	lego	t	2025-04-04 16:51:27.417+00	2025-04-04 16:51:27.417+00	3
2	Super Hero	super-hero	t	2025-04-04 16:51:56.759+00	2025-04-04 16:51:56.759+00	4
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.messages ("messageId", content, "isRead", "time", "senderId", "receiverId") FROM stdin;
1	sản phẩm bạn tôi nhận được không đúng như mô tả?	t	2025-04-04 16:57:19.097	1	\N
2	chào quý khách, quý khách vui lòng cung cấp hình ảnh để cửa hàng giải quyết cho trường hợp này ạ	t	2025-04-04 16:58:32.442	2	1
3		t	2025-04-04 17:02:19.029	1	\N
4	chúng tôi sẽ xem xét và phản hồi sớm cho quý khách	f	2025-04-04 17:05:26.742	2	1
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
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_details ("orderDetailId", price, "discountedPrice", quantity, "orderId", "productId") FROM stdin;
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
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.orders ("orderId", "totalPrice", "totalDiscount", "shippingFee", "finalPrice", "paymentStatus", "paidDate", "createdAt", "updatedAt", "userId", "orderAddressId", "paymentMethodId", "voucherId") FROM stdin;
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
1	100000	2025-04-04 16:56:22.176	\N	1
2	205000	2025-04-04 16:56:48.976	\N	2
\.


--
-- Data for Name: product_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_embeddings (product_embedding_id, embedding, product_id) FROM stdin;
1	[-0.023318322,0.019777745,-0.037652463,0.07002809,-0.010818927,-0.054953925,0.07820592,0.026953539,-0.044211555,-0.014567885,0.046326693,-0.07251987,0.03156046,-0.013081362,-0.027375402,-0.0320694,-0.031685714,-0.073404126,-0.053721376,0.039390206,-0.00048845453,-0.055482633,-0.03659033,0.035750564,0.006417737,-0.019514788,-0.04176644,0.06677756,0.028155284,-0.10260564,0.055821445,0.023752572,0.0054272707,0.0010108266,0.069923475,-0.02332334,0.08161962,0.020691654,-0.032963492,0.046115175,-0.008753381,-0.13187572,0.03439829,-0.026907282,0.028104367,0.011545539,0.00491875,0.1079341,-0.058192927,-0.04039463,-0.042504936,-0.016875453,-0.069543034,-0.012208116,-0.014851403,0.006620551,-0.04213531,0.008467502,0.024925945,0.06778772,0.00083925226,-0.028958406,0.026203405,0.021555472,0.10551998,-0.041477665,0.022394279,-0.070181355,-0.025191087,0.018230751,-0.0863933,0.017465636,-0.0028687716,0.0065129013,0.0499707,-0.02910856,-0.055633333,-0.05164636,0.023137243,-0.076010704,-0.055915035,-0.07216218,-0.05029698,0.020531308,-0.037547287,0.0994594,0.060530443,0.03926938,-0.08725757,0.022181848,0.06949736,0.06038733,0.034355707,0.03811661,-0.009930883,0.029413143,0.024565564,-0.0048675793,0.015330751,0.21058363,0.01614263,0.05861562,-0.015311661,0.046411265,-0.060537934,-0.015723972,0.0015758126,-0.08009456,0.06616074,0.033247977,-0.028225398,-0.013641772,0.04643184,0.051013827,0.009214351,-0.025872452,-0.017095502,0.08263241,-0.028260201,0.016117841,0.04017142,-0.006842019,0.022837946,-0.017636415,0.0002748732,-0.032273117,0.058915127,-2.459507e-33,0.021099232,-0.11731602,-0.006408134,0.10047303,0.0027404672,0.034739494,-0.03969097,0.085565835,-0.05074568,-0.017440436,-0.014679687,-0.008775954,-0.04217684,0.018990012,0.045105055,0.078983426,0.020292617,0.005032299,-0.060833268,0.02452773,0.003976685,-0.008298832,0.018302467,-0.038841628,-0.039981604,-0.020421777,0.0010892603,-0.02123001,0.017597442,0.005100258,-0.07277113,-0.020878743,-0.14379236,0.10072548,-0.055075336,0.024527676,0.037131976,-0.03182648,-0.012368252,-0.07952962,-0.08453093,0.027306397,0.0044684405,0.042668726,0.09032707,-0.06589166,-0.039183438,-0.0072791064,0.064922616,0.006140782,-0.025448069,0.032996386,-0.05924174,-0.011705603,-0.045852523,-8.6804626e-05,0.022364292,-0.073265724,-0.025981618,0.06537756,0.021348035,0.010973714,-0.0298276,0.05954115,-0.061513253,0.012071494,-0.07621715,-0.07755554,0.042664807,0.050594606,-0.015895944,-0.031872462,0.030635953,-0.004914599,0.017049847,-0.009471065,-0.026232589,0.107338406,-0.041370224,-0.07318319,0.06782452,-0.0540409,-0.021501541,0.0027198235,-0.013020176,0.020366486,0.02726848,-0.10314873,0.0075046946,-0.043030646,-0.038890623,0.033760305,0.033817794,-0.040706478,0.07098588,2.05292e-33,-0.04121031,0.05722976,-0.052294627,0.10468913,0.0106883645,0.0011604251,0.08260842,-0.0414845,-0.06051354,0.11142564,0.049400344,-0.008891655,0.007167479,-0.036719326,-0.0047896523,-0.03789005,0.07732119,-0.07832696,-0.043228824,0.018030185,-0.03941635,0.07595831,-0.05195852,0.0362232,-0.13803527,0.061503932,0.06827319,0.022371357,0.03321755,-0.018718125,0.082926415,0.07412671,0.0070299795,0.033297554,0.045002945,-0.012136445,0.10050133,-0.012448391,0.01585223,0.06884897,0.084445536,0.09856912,0.034790836,0.08577844,-0.0051290407,0.063014805,0.049678482,-0.039243072,-0.0010987894,0.023167724,-0.08284674,0.0128618125,0.012541239,0.012815323,-0.020330124,-0.027751874,-0.023882207,0.020134896,-0.03421927,0.035322707,-0.03746249,0.0846306,-0.0100352205,0.05641134,-0.05865518,-0.050310675,-0.03403067,0.066821374,0.05706569,0.03191975,-0.010437135,0.03682146,0.010650125,-0.060775463,0.05369024,0.035913706,-0.09504809,-0.007865337,0.04364776,-0.024862768,-0.10567808,-0.027158536,-0.07325489,0.04876545,-0.021633008,0.075498946,0.10442763,0.06239915,-0.0013928848,0.02285034,0.05575034,0.053383023,-0.016545955,-0.07147657,0.021687845,-1.5598772e-08,-0.022755178,-0.06758569,0.010979104,0.054057103,-0.022160562,0.04438301,-0.07992258,-0.0007424271,-0.037438642,0.0059324936,0.018394647,0.059693307,0.010189483,0.057525095,0.018289084,-0.04294743,-0.09466314,-0.011742905,-0.022457473,-0.013446564,-0.07020445,-0.004794964,-0.019585913,-0.017704261,-0.044046458,0.0358894,0.0043781186,0.09242443,-0.044169385,-0.0027235767,0.100674555,0.053242747,-0.027083147,-0.06406906,0.0051680296,0.01099635,0.010446187,0.056011092,0.026321467,0.051840834,-0.0026410827,0.005978936,-0.027632598,-0.05922516,-0.049824905,-0.07700317,-0.05465972,-0.07892799,-0.046863243,-0.116187215,-0.06518955,0.009689403,0.029353177,0.022882702,0.05437908,-0.0009394724,-0.014735789,0.021123521,-0.11955834,0.08890405,0.12520161,-0.002138666,0.017479619,-0.045485802]	1
2	[-0.01103944,0.017261827,-0.03486087,0.035407506,-0.07658292,0.08387241,0.06853907,0.0139219845,0.062715545,-0.021933964,-0.06536461,-0.051817317,0.0016841987,-0.012607101,-0.044644315,-0.02632491,-0.028548457,-0.08056538,-0.093159735,-0.029330004,-0.019100884,0.027879385,-0.023131086,0.0385344,-0.027701553,0.039290678,0.004740897,0.02881925,-0.047143877,-0.13129172,0.003355304,0.06975901,0.15404983,-0.023029663,-0.017127518,-0.045125276,-0.04453757,-0.03718759,0.047112588,0.13860743,-0.025338382,0.010246645,0.0784381,0.060229514,-0.097223945,0.01863985,0.083611935,0.04984441,0.046747167,0.07902417,-0.04983525,-0.006155612,-0.07369361,0.044386756,0.0114223445,0.018530011,0.008253392,0.022441488,0.014268382,-0.018066315,0.02076259,0.038055405,0.013338216,0.11234981,-0.0034142938,0.008440387,-0.06773073,-0.022260198,-0.06070119,-0.041450523,-0.09474312,-0.03166926,0.060341563,0.027919056,0.08085724,-0.00874227,0.08100735,-0.09312812,0.014013356,-0.06934851,-0.03474676,-0.0659475,-0.14591761,-0.023395007,0.031024283,-0.01595478,0.016042404,0.00021502406,-0.059758767,0.06318963,-0.016545309,0.0061301487,0.10918264,-0.025300601,-0.053137697,0.058201037,0.0048488136,-0.11049602,-0.019650623,0.22329746,0.025879577,0.014828778,0.025057698,-0.013105853,-0.0055479147,-0.06322059,-0.018310478,-0.004634645,0.023976844,0.014102761,0.005087328,0.018252214,-0.06147613,-0.029417198,-0.028613957,0.013673721,0.09426204,0.020212013,0.07611886,-0.0634226,0.031189343,-0.05638691,-0.010561168,0.0034709887,-0.07914388,-0.03028165,-0.06652699,-4.5803402e-33,-0.035959583,-0.07415413,0.04501698,-0.04856816,-0.021846961,0.050270516,-0.026657015,0.003499799,-0.019435963,-0.005872487,0.032685142,0.05940658,-0.013492887,-0.050991625,0.028282577,0.052608293,-0.05943957,0.02576155,-0.10886465,0.012728853,-0.031519447,0.06982436,-0.032339692,-0.0011259421,0.0024001354,-0.01672125,0.016019566,-0.047354944,0.055317402,0.010519978,0.038434274,0.041747976,-0.05898737,-0.02753983,-0.0008942608,-0.045336585,-0.0026750513,0.0033207957,0.03746899,0.041336752,-0.03203473,0.027769063,0.01879094,0.023428775,0.062210083,0.029282864,-0.010932707,-7.680936e-05,-0.032898176,0.032904305,0.035266727,-0.09092864,-0.016474193,-0.026311588,0.051355604,-0.03263084,-0.039724566,-0.027222512,-0.028068408,0.024028266,0.057539854,0.1555076,0.0702682,0.022508215,-0.06406951,-0.017807903,0.07054023,0.00922721,0.06327618,-0.042439315,-0.028448375,0.028291639,0.11233168,0.006067439,-0.11633386,0.014771251,0.008862981,-0.0023662404,-0.018442988,-0.014022381,0.0056646755,-0.003070341,0.051648717,0.0014979726,0.0261323,-0.014761783,-0.009753414,-0.0720728,-0.044609837,-0.028922638,-0.056831695,-0.010796406,0.034999114,0.048611462,-0.0069467635,4.368172e-33,-0.00389804,-0.10059939,0.015794562,-0.020627268,0.015266425,-0.09932443,0.05442506,0.0030617781,0.0098767495,-0.010478867,0.004705833,-0.02818078,0.01394727,-0.047974344,0.016855147,-0.03955676,0.054975975,-0.032107122,-0.096098945,-0.011308503,0.010425678,-0.031406336,-0.09561219,-0.018640257,-0.007391441,0.0072106454,0.040353764,0.076482184,-0.009999582,0.039323583,-0.023132611,-0.012931527,-0.030547384,-0.04078873,-0.084085286,0.10800379,0.021477079,0.0052066254,-0.028397199,-0.018155048,0.079192415,-0.018848984,0.027339648,0.14893201,-0.0054080253,0.07140522,-0.0033876156,0.02439735,0.03845766,0.09947341,-0.042063165,-0.06863399,-0.023761222,-0.004320008,0.0073824464,0.08292537,-0.033740632,0.0058946325,-0.028442508,0.0043974854,0.04176974,0.046279676,0.03657483,-0.023429258,-0.03437531,0.035827078,-0.011543067,-0.03702357,-0.037409708,0.062036496,0.06887558,0.04019661,-0.11010736,-0.030542545,-0.06341736,0.17443609,-0.065881796,0.040235862,-0.06195514,0.07543741,0.0061263186,-0.012166585,-0.04753111,0.15108104,0.053459987,0.044112865,0.026228033,-0.0019825131,-0.00719445,0.036480986,-0.054125797,-0.011273372,0.036158368,-0.027134642,-0.02621418,-1.2018476e-08,-0.02696955,-0.0023119734,-0.00043050008,-0.03323616,0.06484966,0.10375557,-0.08189817,-0.026886633,0.043231465,0.003793514,0.013363532,0.031558663,0.010767883,0.097199365,0.038483582,-0.0011716062,0.008311935,-0.060585227,0.025458064,0.004765029,-0.05020521,0.028131202,0.040749326,0.021766268,0.00053264835,-0.024894841,0.046217635,0.06527943,0.0016136249,0.04881795,-0.0021534015,-0.010372448,-0.08276408,-0.059784643,-0.038478356,-0.0067919274,0.007513158,-0.04604327,-0.030388342,-0.050769825,0.08157917,-0.024236437,0.006111092,-0.0053350423,0.030077554,-0.032956284,0.006430683,-0.008727237,-0.053604245,-0.06971442,-0.022147803,0.0020216613,-0.04271888,0.019447166,0.07153829,-0.007065283,0.0028256415,0.04428171,-0.048137814,0.043796763,0.07551039,0.06659342,0.0601966,0.03976043]	1
3	[-0.031115703,0.07228415,-0.106388554,0.043647055,0.00306061,0.020159692,0.09521165,0.027221834,-0.005387294,0.027901523,0.019218389,-0.112000264,0.0018563436,0.0488095,0.0030558778,0.029106725,0.08257167,0.024552858,0.0022377793,0.013706387,-0.08618785,0.035027336,0.0043110363,-0.002094307,-0.04195081,0.02590925,-0.035425663,-0.022206582,-0.06656269,-0.07735975,-0.014562547,-0.05518462,0.021434372,0.028155526,0.0017880236,-0.060415175,0.016916232,0.13987748,0.012555221,-0.054061644,-0.020663274,-0.002142569,0.020796468,-0.04018836,0.054942742,0.0017032463,0.030149398,0.064522564,0.028236946,0.04097699,0.011436725,0.006963127,-0.091682926,0.012873764,0.053312507,-0.044712283,0.00060789695,-0.014268721,0.08004165,0.019581387,-0.009964154,-0.016231306,-0.02911001,0.0404317,0.061204888,-0.089236416,-0.056126866,-0.008785498,-0.041533243,0.038721927,-0.033809442,-0.017733024,0.06709637,-0.027331105,-0.037634276,0.010366075,0.10154866,0.037961185,0.048828386,0.010895335,0.023621531,-0.024475783,-0.04513793,0.051071163,0.0167029,-0.015936036,0.0423831,-0.023516996,-0.020003125,0.008048889,-0.078154236,0.027681101,0.018993001,0.037304677,-0.09866143,-0.02121924,0.003926739,-0.03595198,-0.0914941,0.25986558,-0.029016964,-0.0301425,0.03798526,-0.012666466,0.08355493,0.014381395,-0.019502316,0.0054552504,0.0525549,0.05115426,0.018647771,-0.026544923,-0.11564076,0.00432168,0.11497012,-0.01064604,0.021167176,0.032452904,-0.01603424,0.0944779,0.06268823,0.076284,0.008761549,0.010221969,-0.0072799483,-0.06711905,0.045354232,-5.1472833e-33,-0.05274931,-0.09021515,0.06404277,-0.024035083,0.03231217,-0.015459583,0.017687775,0.024408076,0.036328763,0.03152721,0.02706811,-0.044840857,-0.071060844,0.06081146,-0.030867783,0.08545552,0.021850046,-0.050776273,-0.026444802,-0.060615387,-0.09595441,0.011948198,0.0118841035,0.035735965,-0.027338922,0.00085013744,0.021897756,-0.093343616,0.096996784,0.023238491,0.0424502,0.074320704,-0.00046422743,-0.0070514674,0.04297516,0.016341709,0.039555565,-0.10292211,0.012693045,-0.009996685,0.004242249,-0.029532608,-0.001231707,-0.011501808,-0.025902377,-0.013002655,-0.027488058,0.01624502,-0.07353523,0.07590172,-0.004567293,-0.05945683,-0.067214765,0.021617364,-0.08331151,-0.026029097,-0.029709453,-0.0069855293,0.025664361,-0.015536498,-0.020079242,-0.015249678,-0.053062025,0.050366603,-0.00695169,-0.07905177,-0.004158168,-0.051272724,-0.00851935,-0.067158565,-0.0077539883,-0.039077368,0.10921228,-0.043081403,-0.016350068,0.018313551,-0.007555513,0.074705236,-0.064942606,-0.0027752153,-0.046365835,0.0894124,-0.01209092,-0.040578436,0.018526977,0.028221827,-0.102295734,-0.070762336,0.06795869,-2.4033466e-06,-0.021247335,-0.079932235,0.054541957,-0.015980044,-0.053902104,3.436758e-33,-0.06376286,-0.045281243,-0.021774549,0.043939915,0.12691003,-0.008611042,-0.12020278,0.045832694,-0.045076776,-0.03190971,-0.06129435,0.0029695074,0.0051841494,0.0638937,0.058803964,-0.00972761,0.031067504,-0.012976454,0.015443088,0.039650466,-0.006642382,-0.07527281,-0.04358823,-0.03307824,0.0029833785,0.049178787,-0.049766816,-0.016604112,0.028110355,0.00966607,-0.10917828,0.06274933,0.011362723,0.04222297,0.018765371,0.14383471,-0.030122185,-0.03611486,-0.021222137,0.032415412,-0.009015063,0.028820772,-0.024347443,0.07439961,0.03813218,0.013402507,0.059015572,0.08467386,0.025603844,0.1115872,-0.035668906,-0.011756397,-0.049935866,-0.043635316,-0.053453144,0.039308965,0.017147169,-0.060797095,-0.0027391743,-0.01163686,0.028110586,0.029075267,-0.041551612,0.009573736,-0.07064317,0.06790366,-0.054612182,0.027230915,-0.041912723,-0.04094825,0.008865465,-0.016495077,-0.017981388,-0.032453597,-0.036470808,0.009567278,0.037783932,0.029564966,-0.05345302,-0.04670081,-0.03349573,-0.009267942,0.010236081,0.10957913,-0.00913925,0.036869694,0.049150106,-0.022823665,-0.0006595467,0.004622467,0.0264094,0.021800397,0.08342987,-0.034040455,-0.054692578,-1.1962736e-08,-0.068481565,0.015895903,-0.03833171,-0.061045174,0.07435671,0.094246626,-0.03667804,-0.009494811,0.068623334,0.055429228,0.030179625,0.021368554,0.014376987,0.0061191344,0.020571562,0.03498421,-0.0112459585,-0.0730364,-0.030790096,8.463913e-05,-0.084109806,0.04203667,0.029912928,0.0014928693,-0.005495275,-0.023829367,-0.10482728,0.030382358,-0.022736691,0.119543225,-0.0005625575,0.14491454,-0.09116918,-0.04015874,-0.013110288,-0.034736536,0.08847141,-0.017164176,-0.009903389,-0.047842123,0.02129885,0.06486193,0.006834626,-0.037002858,-0.01825222,0.0018945584,0.058255803,-0.11133324,-0.048167173,-0.08254139,-0.07651462,0.046591192,0.032249898,-0.019351538,0.021261059,0.0038181373,-0.021939471,-0.018282112,-0.051854108,0.03037016,0.12141623,0.023353526,0.049209353,0.06536158]	1
4	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	1
5	[0.0044099707,0.013168008,-0.030970683,0.064930715,-0.0038882934,-0.08728407,0.07149196,0.038893756,-0.019633,-0.015503031,0.047194403,-0.067410514,0.011441853,-0.0094413515,-0.0042289537,0.008163118,-0.011829043,-0.026058208,-0.028197097,0.0046562403,0.023082841,-0.054722976,0.019551158,0.018004823,-0.044409044,0.01603192,-0.06454949,0.061609212,0.017399155,-0.09491944,0.05494667,0.022973822,-0.06520374,0.0033936866,0.04370814,-0.06547708,0.08492912,0.022938905,-0.047618642,0.021698922,-0.010058983,-0.10684719,0.035662174,-0.010174107,0.049947433,0.035754334,0.050077714,0.049197443,-0.023648212,-0.00023591102,-0.073321514,-0.037126046,-0.032667976,-0.037599802,-0.020090181,0.036639433,-0.027490977,0.010304507,0.048038937,0.060144763,0.032598063,-0.02224796,-0.010442135,0.027265413,0.07689345,-0.022524014,0.0061218916,-0.04817619,-0.039108254,-0.016554402,-0.087003246,0.020832373,0.016488006,0.023283575,0.08507735,-0.0006415416,-0.057347525,-0.08731265,0.029638277,-0.08061976,-0.06862995,-0.11162544,-0.020833746,0.03663236,-0.05282023,0.0774364,0.07286844,-0.013660815,-0.11378638,0.005698387,0.06127228,0.019321945,0.038461495,0.053708434,0.0028457413,0.023967406,0.030411772,-0.012417936,0.0005938566,0.20865598,0.012129182,0.04078394,-0.044693876,-0.008907631,-0.028929176,-0.040365294,0.018805092,-0.08189222,0.07601736,-7.6568576e-05,0.008645443,-0.010476257,0.024577877,0.049073566,0.03032529,0.009107114,-0.021794572,0.08972416,-0.026436927,0.021425704,0.08198094,-0.012191696,-0.031776525,-0.05526821,-0.0010393624,-0.011846521,0.08001742,-3.1442858e-33,-0.01085934,-0.096770234,0.03840964,0.1538504,0.021473126,0.009010589,-0.04224528,0.074958615,-0.034512576,0.012910871,-0.0358113,-0.09272215,-0.042849686,0.009848734,0.07307217,0.050639693,0.024761558,-0.009916463,-0.019943902,0.032821476,0.010588178,0.009307789,0.010968283,-0.041105617,0.0004723621,0.011267783,0.02212753,-0.060177848,0.058918625,0.03077615,-0.05693699,-0.029899685,-0.09778745,0.10379752,-0.031991106,-0.0168974,0.01109436,-0.03991645,-0.04594582,-0.038068272,-0.023382777,0.032543052,0.012518296,0.034588836,0.0599711,-0.06137731,0.0010119283,0.0076810014,0.119615,0.007976239,-0.022759084,0.035998452,-0.065589614,0.015773302,-0.009523639,-0.0041540717,0.049839765,-0.06518326,0.0025620789,0.08195669,0.017312773,0.038194958,-0.036300946,0.06797272,-0.067208625,-0.010091596,-0.058643263,-0.09687146,0.029580265,0.07399229,-0.011940974,-0.031243268,0.06292583,0.018810675,0.010888733,-0.04021536,0.0072244504,0.066762395,-0.021375703,-0.083559684,0.058277577,-0.053220607,-0.007678518,-0.013140473,-0.029983532,-0.027196256,0.0135474345,-0.13672923,-0.00967798,-0.035335194,-0.056782294,0.04185805,0.023180606,-0.04122211,0.10069551,2.7418782e-33,-0.046698596,0.050973844,-0.048471093,0.097410955,0.038539656,-0.043412708,0.079137936,0.0017718334,-0.016910346,0.13477007,0.05829359,-0.02513935,0.051384922,-0.016770376,0.0142119145,-0.023014614,0.04709568,-0.050071936,-0.028415227,0.007574364,-0.016603349,0.06218686,0.0066007804,0.016220719,-0.12230476,0.030873237,0.064855404,0.018534303,0.025356976,-0.029474987,0.06993929,0.038403284,-0.031197531,0.05919633,0.04572192,-0.015920568,0.117141955,-0.02273219,-0.043129854,0.034408953,0.03030504,0.08639039,0.016729731,0.098868765,-0.009590839,0.076021574,0.08776502,-0.031600893,-0.02320353,0.039902546,-0.08453097,-0.0057489267,-0.013525117,0.024361718,-0.026574744,-0.047996152,-0.04950349,0.0005667583,-0.012282582,0.026746714,-0.018062819,0.0595653,-0.04551741,0.04962749,-0.042842116,-0.057087682,-0.03881737,0.08479258,0.051317696,0.059942693,-0.086874045,0.026224755,-0.017779516,-0.043727238,0.00966064,0.011671239,-0.109745964,0.008905372,0.04924112,-0.041785557,-0.09430276,-0.03749997,-0.0452044,0.089062475,-0.013615564,0.058562085,0.0914898,0.07246928,-0.035649594,0.013248188,0.032993812,0.058601238,-0.024483543,-0.031231811,-0.0006249936,-1.4974432e-08,-0.047182802,-0.060046878,0.048394058,0.032786943,-0.011449347,0.016254155,-0.07912427,0.05290258,-0.03157602,0.043490283,-0.04962787,0.043746363,0.030958427,0.030242287,0.019806305,0.0095068,-0.043980118,7.695257e-05,-0.039487284,-0.0044868826,-0.06396831,-0.030471226,0.0013468394,0.0017111527,-0.042514674,0.06201768,-0.014523704,0.085945025,-0.015593557,-0.007534163,0.10668248,0.024975754,-0.03161653,-0.07954748,-0.009557762,0.01396802,0.012837695,0.01020538,0.020437183,0.0570374,-0.019461844,0.008590686,-0.0020242396,-0.0044989367,-0.052134454,-0.071007974,-0.05400574,-0.087349415,-0.06544601,-0.124195576,-0.03849775,-0.03209938,0.023840936,0.033819646,0.0445002,0.0041009667,-0.031121362,0.037651006,-0.13258617,0.06740911,0.16074465,0.037059195,0.0005391197,-0.0376161]	2
6	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	2
7	[-0.01103944,0.017261827,-0.03486087,0.035407506,-0.07658292,0.08387241,0.06853907,0.0139219845,0.062715545,-0.021933964,-0.06536461,-0.051817317,0.0016841987,-0.012607101,-0.044644315,-0.02632491,-0.028548457,-0.08056538,-0.093159735,-0.029330004,-0.019100884,0.027879385,-0.023131086,0.0385344,-0.027701553,0.039290678,0.004740897,0.02881925,-0.047143877,-0.13129172,0.003355304,0.06975901,0.15404983,-0.023029663,-0.017127518,-0.045125276,-0.04453757,-0.03718759,0.047112588,0.13860743,-0.025338382,0.010246645,0.0784381,0.060229514,-0.097223945,0.01863985,0.083611935,0.04984441,0.046747167,0.07902417,-0.04983525,-0.006155612,-0.07369361,0.044386756,0.0114223445,0.018530011,0.008253392,0.022441488,0.014268382,-0.018066315,0.02076259,0.038055405,0.013338216,0.11234981,-0.0034142938,0.008440387,-0.06773073,-0.022260198,-0.06070119,-0.041450523,-0.09474312,-0.03166926,0.060341563,0.027919056,0.08085724,-0.00874227,0.08100735,-0.09312812,0.014013356,-0.06934851,-0.03474676,-0.0659475,-0.14591761,-0.023395007,0.031024283,-0.01595478,0.016042404,0.00021502406,-0.059758767,0.06318963,-0.016545309,0.0061301487,0.10918264,-0.025300601,-0.053137697,0.058201037,0.0048488136,-0.11049602,-0.019650623,0.22329746,0.025879577,0.014828778,0.025057698,-0.013105853,-0.0055479147,-0.06322059,-0.018310478,-0.004634645,0.023976844,0.014102761,0.005087328,0.018252214,-0.06147613,-0.029417198,-0.028613957,0.013673721,0.09426204,0.020212013,0.07611886,-0.0634226,0.031189343,-0.05638691,-0.010561168,0.0034709887,-0.07914388,-0.03028165,-0.06652699,-4.5803402e-33,-0.035959583,-0.07415413,0.04501698,-0.04856816,-0.021846961,0.050270516,-0.026657015,0.003499799,-0.019435963,-0.005872487,0.032685142,0.05940658,-0.013492887,-0.050991625,0.028282577,0.052608293,-0.05943957,0.02576155,-0.10886465,0.012728853,-0.031519447,0.06982436,-0.032339692,-0.0011259421,0.0024001354,-0.01672125,0.016019566,-0.047354944,0.055317402,0.010519978,0.038434274,0.041747976,-0.05898737,-0.02753983,-0.0008942608,-0.045336585,-0.0026750513,0.0033207957,0.03746899,0.041336752,-0.03203473,0.027769063,0.01879094,0.023428775,0.062210083,0.029282864,-0.010932707,-7.680936e-05,-0.032898176,0.032904305,0.035266727,-0.09092864,-0.016474193,-0.026311588,0.051355604,-0.03263084,-0.039724566,-0.027222512,-0.028068408,0.024028266,0.057539854,0.1555076,0.0702682,0.022508215,-0.06406951,-0.017807903,0.07054023,0.00922721,0.06327618,-0.042439315,-0.028448375,0.028291639,0.11233168,0.006067439,-0.11633386,0.014771251,0.008862981,-0.0023662404,-0.018442988,-0.014022381,0.0056646755,-0.003070341,0.051648717,0.0014979726,0.0261323,-0.014761783,-0.009753414,-0.0720728,-0.044609837,-0.028922638,-0.056831695,-0.010796406,0.034999114,0.048611462,-0.0069467635,4.368172e-33,-0.00389804,-0.10059939,0.015794562,-0.020627268,0.015266425,-0.09932443,0.05442506,0.0030617781,0.0098767495,-0.010478867,0.004705833,-0.02818078,0.01394727,-0.047974344,0.016855147,-0.03955676,0.054975975,-0.032107122,-0.096098945,-0.011308503,0.010425678,-0.031406336,-0.09561219,-0.018640257,-0.007391441,0.0072106454,0.040353764,0.076482184,-0.009999582,0.039323583,-0.023132611,-0.012931527,-0.030547384,-0.04078873,-0.084085286,0.10800379,0.021477079,0.0052066254,-0.028397199,-0.018155048,0.079192415,-0.018848984,0.027339648,0.14893201,-0.0054080253,0.07140522,-0.0033876156,0.02439735,0.03845766,0.09947341,-0.042063165,-0.06863399,-0.023761222,-0.004320008,0.0073824464,0.08292537,-0.033740632,0.0058946325,-0.028442508,0.0043974854,0.04176974,0.046279676,0.03657483,-0.023429258,-0.03437531,0.035827078,-0.011543067,-0.03702357,-0.037409708,0.062036496,0.06887558,0.04019661,-0.11010736,-0.030542545,-0.06341736,0.17443609,-0.065881796,0.040235862,-0.06195514,0.07543741,0.0061263186,-0.012166585,-0.04753111,0.15108104,0.053459987,0.044112865,0.026228033,-0.0019825131,-0.00719445,0.036480986,-0.054125797,-0.011273372,0.036158368,-0.027134642,-0.02621418,-1.2018476e-08,-0.02696955,-0.0023119734,-0.00043050008,-0.03323616,0.06484966,0.10375557,-0.08189817,-0.026886633,0.043231465,0.003793514,0.013363532,0.031558663,0.010767883,0.097199365,0.038483582,-0.0011716062,0.008311935,-0.060585227,0.025458064,0.004765029,-0.05020521,0.028131202,0.040749326,0.021766268,0.00053264835,-0.024894841,0.046217635,0.06527943,0.0016136249,0.04881795,-0.0021534015,-0.010372448,-0.08276408,-0.059784643,-0.038478356,-0.0067919274,0.007513158,-0.04604327,-0.030388342,-0.050769825,0.08157917,-0.024236437,0.006111092,-0.0053350423,0.030077554,-0.032956284,0.006430683,-0.008727237,-0.053604245,-0.06971442,-0.022147803,0.0020216613,-0.04271888,0.019447166,0.07153829,-0.007065283,0.0028256415,0.04428171,-0.048137814,0.043796763,0.07551039,0.06659342,0.0601966,0.03976043]	2
8	[-0.031115703,0.07228415,-0.106388554,0.043647055,0.00306061,0.020159692,0.09521165,0.027221834,-0.005387294,0.027901523,0.019218389,-0.112000264,0.0018563436,0.0488095,0.0030558778,0.029106725,0.08257167,0.024552858,0.0022377793,0.013706387,-0.08618785,0.035027336,0.0043110363,-0.002094307,-0.04195081,0.02590925,-0.035425663,-0.022206582,-0.06656269,-0.07735975,-0.014562547,-0.05518462,0.021434372,0.028155526,0.0017880236,-0.060415175,0.016916232,0.13987748,0.012555221,-0.054061644,-0.020663274,-0.002142569,0.020796468,-0.04018836,0.054942742,0.0017032463,0.030149398,0.064522564,0.028236946,0.04097699,0.011436725,0.006963127,-0.091682926,0.012873764,0.053312507,-0.044712283,0.00060789695,-0.014268721,0.08004165,0.019581387,-0.009964154,-0.016231306,-0.02911001,0.0404317,0.061204888,-0.089236416,-0.056126866,-0.008785498,-0.041533243,0.038721927,-0.033809442,-0.017733024,0.06709637,-0.027331105,-0.037634276,0.010366075,0.10154866,0.037961185,0.048828386,0.010895335,0.023621531,-0.024475783,-0.04513793,0.051071163,0.0167029,-0.015936036,0.0423831,-0.023516996,-0.020003125,0.008048889,-0.078154236,0.027681101,0.018993001,0.037304677,-0.09866143,-0.02121924,0.003926739,-0.03595198,-0.0914941,0.25986558,-0.029016964,-0.0301425,0.03798526,-0.012666466,0.08355493,0.014381395,-0.019502316,0.0054552504,0.0525549,0.05115426,0.018647771,-0.026544923,-0.11564076,0.00432168,0.11497012,-0.01064604,0.021167176,0.032452904,-0.01603424,0.0944779,0.06268823,0.076284,0.008761549,0.010221969,-0.0072799483,-0.06711905,0.045354232,-5.1472833e-33,-0.05274931,-0.09021515,0.06404277,-0.024035083,0.03231217,-0.015459583,0.017687775,0.024408076,0.036328763,0.03152721,0.02706811,-0.044840857,-0.071060844,0.06081146,-0.030867783,0.08545552,0.021850046,-0.050776273,-0.026444802,-0.060615387,-0.09595441,0.011948198,0.0118841035,0.035735965,-0.027338922,0.00085013744,0.021897756,-0.093343616,0.096996784,0.023238491,0.0424502,0.074320704,-0.00046422743,-0.0070514674,0.04297516,0.016341709,0.039555565,-0.10292211,0.012693045,-0.009996685,0.004242249,-0.029532608,-0.001231707,-0.011501808,-0.025902377,-0.013002655,-0.027488058,0.01624502,-0.07353523,0.07590172,-0.004567293,-0.05945683,-0.067214765,0.021617364,-0.08331151,-0.026029097,-0.029709453,-0.0069855293,0.025664361,-0.015536498,-0.020079242,-0.015249678,-0.053062025,0.050366603,-0.00695169,-0.07905177,-0.004158168,-0.051272724,-0.00851935,-0.067158565,-0.0077539883,-0.039077368,0.10921228,-0.043081403,-0.016350068,0.018313551,-0.007555513,0.074705236,-0.064942606,-0.0027752153,-0.046365835,0.0894124,-0.01209092,-0.040578436,0.018526977,0.028221827,-0.102295734,-0.070762336,0.06795869,-2.4033466e-06,-0.021247335,-0.079932235,0.054541957,-0.015980044,-0.053902104,3.436758e-33,-0.06376286,-0.045281243,-0.021774549,0.043939915,0.12691003,-0.008611042,-0.12020278,0.045832694,-0.045076776,-0.03190971,-0.06129435,0.0029695074,0.0051841494,0.0638937,0.058803964,-0.00972761,0.031067504,-0.012976454,0.015443088,0.039650466,-0.006642382,-0.07527281,-0.04358823,-0.03307824,0.0029833785,0.049178787,-0.049766816,-0.016604112,0.028110355,0.00966607,-0.10917828,0.06274933,0.011362723,0.04222297,0.018765371,0.14383471,-0.030122185,-0.03611486,-0.021222137,0.032415412,-0.009015063,0.028820772,-0.024347443,0.07439961,0.03813218,0.013402507,0.059015572,0.08467386,0.025603844,0.1115872,-0.035668906,-0.011756397,-0.049935866,-0.043635316,-0.053453144,0.039308965,0.017147169,-0.060797095,-0.0027391743,-0.01163686,0.028110586,0.029075267,-0.041551612,0.009573736,-0.07064317,0.06790366,-0.054612182,0.027230915,-0.041912723,-0.04094825,0.008865465,-0.016495077,-0.017981388,-0.032453597,-0.036470808,0.009567278,0.037783932,0.029564966,-0.05345302,-0.04670081,-0.03349573,-0.009267942,0.010236081,0.10957913,-0.00913925,0.036869694,0.049150106,-0.022823665,-0.0006595467,0.004622467,0.0264094,0.021800397,0.08342987,-0.034040455,-0.054692578,-1.1962736e-08,-0.068481565,0.015895903,-0.03833171,-0.061045174,0.07435671,0.094246626,-0.03667804,-0.009494811,0.068623334,0.055429228,0.030179625,0.021368554,0.014376987,0.0061191344,0.020571562,0.03498421,-0.0112459585,-0.0730364,-0.030790096,8.463913e-05,-0.084109806,0.04203667,0.029912928,0.0014928693,-0.005495275,-0.023829367,-0.10482728,0.030382358,-0.022736691,0.119543225,-0.0005625575,0.14491454,-0.09116918,-0.04015874,-0.013110288,-0.034736536,0.08847141,-0.017164176,-0.009903389,-0.047842123,0.02129885,0.06486193,0.006834626,-0.037002858,-0.01825222,0.0018945584,0.058255803,-0.11133324,-0.048167173,-0.08254139,-0.07651462,0.046591192,0.032249898,-0.019351538,0.021261059,0.0038181373,-0.021939471,-0.018282112,-0.051854108,0.03037016,0.12141623,0.023353526,0.049209353,0.06536158]	2
\.


--
-- Data for Name: product_image_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_image_embeddings ("productImageEmbeddingId", embedding, upload_image_id, product_id) FROM stdin;
1	[-0.078544304,0.38041753,0.14655426,0.39381474,0.59480804,-0.35112303,0.23109126,0.18657392,-0.21789312,-0.76970506,0.2854521,0.14204836,0.51065356,-0.062399425,0.22539008,-0.14885631,1.227036,0.277664,-0.1688313,-0.49096996,0.16743901,0.12316566,0.43417445,0.2751742,0.067389734,0.16396105,0.30069077,-0.26825944,-0.08640299,-0.22529426,-0.0016832382,-0.12978905,-0.047113176,-0.26340356,-0.22547533,-0.48369306,-0.110619806,-5.542956e-05,-0.22572972,-0.20878044,-0.48527464,-0.07821335,0.05730647,-0.1036243,0.11873217,-0.54939884,0.36255965,-0.5924521,-0.21799216,-0.20694624,-0.06139662,-0.5110314,0.019095795,0.15983912,-0.31491002,-0.004698814,0.1719251,0.35593966,0.41350973,0.007290737,0.66675407,-0.36148095,-0.18260881,-0.044235677,0.30657765,-0.66134727,-0.2639198,-0.118760474,-0.032782406,-0.09479214,0.031500995,-0.41865882,0.23383191,-0.745808,0.37202463,0.25988463,-0.02510476,-0.0887389,0.50871116,-0.20789571,0.012168671,-0.12920478,0.07601646,0.49515963,-0.22100908,-0.026926715,-1.3766454,0.1918084,-0.22692472,-0.3778183,0.4674484,-0.14925088,-5.4991827,-0.17743175,0.0727823,0.47675005,0.54965836,0.3002937,-0.08415853,0.906342,0.15067393,-0.2180672,-0.09677099,0.4905521,0.0027663475,-0.334179,-1.8835329,0.12389125,0.66190857,-0.47629482,0.012319556,0.058209784,0.32441133,-0.13190013,0.37822273,-0.035921562,-0.2109975,-0.06586634,-0.5805911,-0.48616138,0.06349134,0.11883454,-0.15005712,-0.2244535,0.17240413,0.19251592,-0.23731804,0.28781277,0.06490183,0.047907107,0.36922166,-0.37020028,-0.23440693,0.76799315,0.54271513,-0.10926073,-0.26494595,-0.33813152,-0.048881117,-0.3601594,-0.19474803,0.15033093,0.08007533,-0.18213229,-0.7470932,0.1567565,-0.08136025,0.16299997,-0.34390423,-0.39605555,-0.12291984,0.15276505,-0.8191578,-0.16736127,-0.39235568,-0.3900326,0.0003033416,0.09091453,0.46037883,0.10302773,-0.18634112,0.14932683,-0.11405316,0.03406549,0.35531488,0.0630796,0.021498892,-0.22584477,0.09262518,-0.062063206,-0.048164904,0.37964284,0.07406407,0.72795373,-0.09921852,0.21961446,-1.725841,-0.25878018,-0.19574977,-0.21071579,0.17642763,0.17238905,0.09245415,-0.23605828,-0.23080327,0.3873374,0.33763638,0.062288072,0.055292916,-0.34807158,0.32955107,-0.23147537,0.10727935,0.23885947,-0.7434236,-0.09416806,-0.1614999,-0.10273509,-0.5927105,0.039255206,0.0031339908,0.10075972,0.08825385,0.1209801,-0.13022263,0.052255448,0.5656944,0.13927892,-0.34518117,0.5890218,0.2884847,0.04957517,-0.0011720116,-0.2985784,-0.6231844,0.047589,0.36562893,-0.06780123,-0.40684515,0.070359275,-0.14078277,-0.15447323,0.2065522,-0.04386619,-0.012220865,0.13812591,-0.5676051,-0.67216545,-0.04627221,-0.12057782,0.14535323,0.6095924,0.23032068,0.49118704,0.40583235,-0.1713661,-0.119336486,0.24718118,0.04469698,0.2766913,-0.05267226,0.056842454,0.044385653,-0.3355421,0.13237391,0.021130575,0.024091095,-0.14416598,-0.53168297,-0.3595469,-0.31243628,0.4573094,-0.11329095,-0.05484093,0.11144938,0.31709737,-0.50038916,0.055514593,-1.8025801,0.17494959,0.07654698,0.23263018,0.08482894,-1.9801043,0.22203761,0.121608526,0.3969123,-0.26993036,-0.32011774,0.02565752,-0.2585422,0.15163481,-0.14064033,0.08491112,0.12296026,-0.1908644,0.59331936,0.18619934,-0.28540233,-0.0058401898,0.004162648,-0.16162604,-0.43462807,0.12843092,0.24302125,-0.1511509,1.3101096,0.015827915,0.053549387,0.303577,0.1005655,0.017066134,-0.25150418,-0.03393183,-0.17129461,0.64353377,-0.3161984,-0.09825685,0.32583922,-0.039969884,-0.23897019,0.22883466,0.42671314,-0.108583964,-0.15824999,-0.5620362,-0.1817698,0.06295892,0.4880602,-0.11496504,0.09071486,-0.17792186,0.76073647,0.039558463,-0.17805634,-0.24536939,0.1390829,-0.46640074,0.2068138,0.044737555,0.57055396,1.9447765,0.08654058,-0.3749498,0.36458108,-0.5535924,0.30061626,0.19092017,-0.16536032,-0.61510557,-0.22194001,0.03987886,0.3676996,0.37126246,-0.16070014,0.17680845,0.039759357,0.36336154,0.15500768,-0.0933901,-0.21117423,-0.23433022,-0.24647625,-0.2656937,-0.019359304,-0.05783393,0.685498,-0.4211434,0.043851152,-0.0628217,-0.08128139,0.06940769,0.49039653,-0.00782223,0.23994252,-0.0416232,-0.5270998,0.28032315,0.21096773,-0.5708533,0.46629834,-0.3249635,0.103344634,0.21402459,0.4352144,-0.379803,0.06816724,0.20176488,0.28393596,0.1999877,0.18786176,0.18939342,0.13831948,0.1906656,-0.14421009,0.52738774,0.42005035,0.27077276,0.5978729,0.33011255,0.31385306,-0.59908664,0.35282454,0.18396613,0.18728304,-0.23533727,0.29007468,-0.15207744,0.0409672,-0.15719011,-0.25137013,-0.52391213,0.38301906,-0.6325401,-0.40062845,0.57513434,0.1755137,-0.0122477105,-0.0665866,-0.7176042,-0.26223427,0.23103821,-0.09722267,-0.07725876,-0.25881043,-0.17553957,0.08952026,-0.16924748,-0.082274504,0.19309431,0.13830687,0.5679734,0.79202706,0.0003535807,-0.14643808,0.13316633,0.03340104,0.3457973,-0.20719953,-0.41860998,0.39582515,0.12876675,0.019583821,-0.3616933,-0.017429518,0.32664472,-0.19245829,0.24560603,0.59989375,-0.34469742,-0.24880406,-0.030041734,-0.30671564,-0.69077814,0.44645318,-0.320912,-0.13604131,-0.34226966,0.070567355,-0.22538865,0.3338498,0.023221409,0.21806945,0.1046545,0.08422352,0.2814233,-0.11593994,0.24381055,-0.29448316,-0.2498698,0.0681887,0.671306,0.25852823,-0.10301713,0.20115636,-0.012590187,-0.58736247,-0.005841324,-0.046556193,-0.07039814,-0.46167704,0.13043039,0.88806033,-0.38876948,0.14024678,0.027134504,-0.58818674,0.06949924,0.0011069857,0.22022755,0.057183508,0.0665922,-0.06391822,-0.22306594,-0.16160086,-0.21176264,0.3992958,0.25860286,0.015783228,-0.44677296,-0.088949375,-0.5505587,-0.06708683,-0.24659394,-0.1076164,-0.3269241,0.4518471,-0.3393067,-0.041786615,-0.6818043,0.33098474,0.04523689,0.3996628,-0.4457635,0.038269028,0.27258444,-0.04572321,0.25999483,0.062279463,-0.07960572,0.79175967,-0.057991542,0.011166581,0.51291007,-0.089663826,-0.2196599,-0.4991468,-0.35995355,-0.10412285,-0.13400927,0.31594217,-0.04023432]	5	1
2	[-0.41619188,-0.13683115,-0.10703865,-0.22974588,0.2655553,-0.12698866,0.2312687,0.4319624,0.24998659,-0.020221673,-0.07145648,0.23563576,0.5515738,-0.054616194,-0.27334836,-0.09490619,1.0236559,0.13893446,-0.02110598,-0.19775164,-0.05415188,-0.08163737,-0.1325527,0.3721703,-0.16647123,0.23609252,-0.19890256,-0.25766695,-0.40552682,-0.1882541,0.39028102,-0.06119046,-0.04272209,0.12218742,-0.13674246,-0.34685937,0.11249427,-0.14095227,-0.3776513,0.10860511,0.07093996,-0.11809699,0.27468634,-0.06162086,0.06595199,-0.30834028,0.33197653,-0.091767296,0.14077199,-0.509441,0.20442419,0.19105013,-0.03921626,-0.14371885,-0.37930247,-0.0073258695,-0.046500053,0.25260127,-0.12469191,-0.032372944,0.6665323,-0.007990874,0.0030208577,-0.15497783,0.009956113,-0.17027445,0.07679735,-0.49720794,0.11878494,0.10315598,0.5130745,-0.3843643,0.14881016,-0.4087575,-0.17666501,0.537808,-0.5593028,-0.16540316,-0.08839935,0.38129556,0.12574026,-1.0121413,-0.015059723,0.03362243,0.31402865,-0.41196004,-1.1277574,0.3886622,-0.20594235,-0.021066744,0.12027574,0.21675022,-4.7748075,0.06665189,0.24359417,0.39718437,0.16897564,0.58692724,0.25911584,1.4235989,0.05581906,-0.14397828,0.26813045,0.32875276,0.35569412,0.014448218,-1.3763555,0.13730526,0.039667938,-0.12878452,0.022827873,0.6449364,-0.1737606,-0.16975787,-0.013838312,-0.30209967,-0.11187481,0.01921318,-0.6756175,0.00470663,0.10961224,0.63144463,-0.05278428,0.3624361,-0.049520206,-0.036380026,0.33203676,0.46000412,0.40610936,0.3075744,0.11652867,-0.8310829,-0.16717605,0.70912856,0.062316116,-0.16404422,-0.5590915,-0.39422002,-0.37704223,-0.23366097,-0.02238912,-0.473136,-0.40509546,-0.6144935,-0.37173846,-0.22793959,0.026059022,0.03024873,0.2152203,0.13125741,-0.24817315,-0.10197564,-1.743036,-0.1326161,-0.32318607,-0.56440836,-0.19379362,0.077567935,0.26634195,0.1655833,0.46911934,-0.17688383,0.22634883,0.2502822,0.5862949,-0.038650975,-0.1620212,0.03272283,0.26563895,0.33009225,-0.009383321,-0.15152363,-0.078459114,0.13392387,-0.15116554,0.33339265,-1.1523553,-0.37119743,-0.8006655,0.06607372,0.43426126,0.2334084,0.28959852,-0.14355575,-0.32055327,0.16387698,0.12126208,-0.48004514,-0.29853705,-0.114842564,0.39850664,0.3990234,0.3996851,0.06762488,-0.45207632,-0.38608375,-0.07740149,0.026735129,-0.7474776,0.24361,0.09155339,0.18870582,0.040194478,0.20179498,0.25060186,0.5496837,-0.23592976,0.2892149,0.07365724,-0.03515,-0.6059829,0.044196498,0.08878577,0.12520602,-0.67158544,0.19302468,0.021433147,-0.03291846,-0.23076704,-0.19509238,-0.21126077,-0.45182666,-0.047845952,0.21961558,-0.08261492,-0.022702493,-0.45655298,-0.18597023,-0.29501244,-0.36725718,-2.5257687e-05,0.36173585,0.0102806995,0.10074194,0.60053664,0.53027904,0.41397825,0.35531518,-0.06711171,-0.10575563,-0.44922432,-0.026021602,0.53306663,0.027485564,0.06549108,-0.123077944,-0.38231605,-0.02531639,-0.13908158,-0.061598476,0.20595771,-0.116745874,-0.43399376,0.2280784,0.15511908,0.23626922,-0.6953465,0.1926897,-1.3501905,0.24286245,0.056252994,-0.0021168052,-0.19475083,-2.5838506,-0.19100669,-0.058674194,0.43938333,0.058235332,-0.26630732,0.32304108,-0.18123418,-0.5075954,0.10208272,-0.13481651,0.23825285,0.19641554,0.6055545,0.41820565,-0.17065848,-0.25117943,-0.016195731,0.045432683,-0.46887875,0.18579766,-0.012006911,-0.34347552,1.0944337,-0.1754008,0.13150923,0.23254578,0.17686363,0.008470068,-0.16984697,-0.23346865,0.15092377,-0.2707431,-0.16335753,-0.33261746,0.29198226,0.07171351,-0.52535903,0.13121155,0.06537961,0.35045236,-0.08637911,-0.3808429,-0.03956396,0.012381833,0.5481526,-0.0025604088,0.054671407,-0.12039146,0.70527303,0.50529045,-0.10655554,-0.06825708,0.14276822,-0.1680379,0.28513837,-0.48970744,0.24441947,1.2892592,0.32324386,-0.33788326,0.31509563,-0.16759087,0.2576923,0.22370356,-0.45563364,-0.3943495,-0.04570974,0.20816258,-0.16623597,0.38247052,0.046739887,-0.24659668,-0.003229231,0.19310558,0.33537975,0.40505865,0.012932543,-0.28861982,0.28368104,-0.053068597,-0.11291248,-0.2739953,0.142364,-0.10237455,0.13041474,-0.09829471,0.5119494,0.13459772,0.12057449,-0.33274972,0.43941733,-0.34285235,-0.42183545,0.36194703,-0.05374072,0.00031454297,0.09182223,-0.18218778,-0.20313296,-0.39053282,0.33559272,-0.054650895,0.17128506,-0.081263386,0.20073219,-0.24184601,0.2531854,0.31290388,0.5762854,-0.043056753,-0.34420502,0.37830904,-0.1904714,0.020391876,-0.05960906,0.21204269,0.14061664,-0.13367794,0.049854167,0.29970574,0.20309074,0.20723449,-0.17704645,0.05860014,0.028045373,0.17083229,-0.17203434,-0.2766819,0.04192825,-0.32406482,-0.21656175,0.36672556,-0.05588511,-0.019106284,0.1521469,-0.6369559,-0.12984666,-0.27261752,-0.5430859,-0.057969376,-0.40235743,-0.09229792,0.5822219,-0.15800543,-0.5624773,-0.12319669,-0.10677019,0.41669983,0.55808324,0.14935939,-0.3165773,0.1483374,-0.33655205,0.53514934,0.08906467,-0.45096284,-0.046382025,-0.22346616,0.036036715,-0.11010859,0.12492278,0.1468349,0.12066499,0.037132435,0.5209703,-0.32585263,0.35264415,-0.31431326,-0.39298284,-0.06204499,0.09398866,-0.26576203,0.035347413,-0.13979751,0.41368276,-0.16408408,0.29125994,0.24024741,-0.37144744,0.1784289,-0.11717457,-0.09569951,-0.18635699,0.40556273,0.1277021,0.29536274,-0.31331328,-0.0900065,0.020554788,0.42185926,0.1364356,0.3175383,-0.57458025,0.2446786,-0.120661676,0.2764036,-0.19488494,0.5060956,0.41438892,-0.24154511,0.25218865,0.212932,-0.36872938,-0.072146446,-0.1202345,0.1414979,0.43024155,0.8178711,0.119606495,-0.16181765,0.11496785,0.3894198,-0.022189608,0.19655901,-0.0068548233,-0.30648124,0.0597911,-0.77213556,-0.14819032,-0.00029852902,-0.20784225,0.32239264,0.45134386,-0.015665693,0.28162456,0.2949094,0.32091242,0.14045043,0.3965469,-0.25899425,0.117618114,-0.40063766,0.21301286,0.0495448,0.5292827,0.24726714,-0.070079155,-0.11144061,0.45698586,0.32098868,-0.13905002,-0.69811606,-0.079051845,-0.3573029,-0.13565093,-0.39529935,0.36213136,-0.042144436]	6	2
\.


--
-- Data for Name: product_info_values; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_info_values (value, "productInfoId", "productId") FROM stdin;
Nhựa	4	1
Việt Nam	3	1
abc	2	1
4	1	1
Gỗ	4	2
Trung Quốc	3	2
abc	2	2
12	1	2
\.


--
-- Data for Name: product_informations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_informations ("productInfoId", "productInfoName", "isActive", type, options, "createdAt", "updatedAt") FROM stdin;
1	Tuổi	t	INPUT_NUMBER	\N	2025-04-04 16:52:43.575+00	2025-04-04 16:52:43.575+00
2	Chủ đề	t	INPUT	\N	2025-04-04 16:52:49.525+00	2025-04-04 16:52:49.525+00
3	Xuất sứ	t	AUTOCOMPLETE	{"Việt Nam","Trung Quốc","Hàn Quốc","Nhật Bản"}	2025-04-04 16:53:27.532+00	2025-04-04 16:53:27.532+00
4	Chất liệu	t	SELECT	{Nhựa,Gỗ}	2025-04-04 16:53:54.667+00	2025-04-04 16:53:54.667+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.products ("productId", "productName", slug, quantity, description, "soldNumber", "avgRating", "isActive", "createdAt", "updatedAt", "brandId", "categoryId") FROM stdin;
1	test 1	test-1	20	abc	0	0	t	2025-04-04 16:56:22.178+00	2025-04-04 16:56:22.178+00	1	1
2	test 2	test-2	20	abc	0	0	t	2025-04-04 16:56:48.978+00	2025-04-04 16:56:48.978+00	1	1
\.


--
-- Data for Name: promotion_periods; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.promotion_periods ("promotionPeriodId", "discountType", "discountValue", "startDate", "endDate", "promotionId") FROM stdin;
\.


--
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.promotions ("promotionId", "promotionName", description, "createdAt", "updatedAt", "promotionThumbnailId") FROM stdin;
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

COPY public.upload_images ("uploadImageId", url, "filePath", "reviewId", "productId", "messageId") FROM stdin;
1	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/Luffy.jpg-1743785355185	images/Luffy.jpg-1743785355185	\N	\N	\N
3	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_3.webp-1743785486701	images/71806_3.webp-1743785486701	\N	\N	\N
4	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1743785516258	images/6055946_2.webp-1743785516258	\N	\N	\N
5	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_5.webp-1743785780762	images/71806_5.webp-1743785780762	\N	1	\N
6	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_4.webp-1743785807932	images/6055946_4.webp-1743785807932	\N	2	\N
7	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/undefined-1743786139031	images/undefined-1743786139031	\N	\N	3
8	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/undefined-1743786139032	images/undefined-1743786139032	\N	\N	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.users ("userId", "fullName", email, password, phone, gender, birthday, "isActive", "createdAt", "updatedAt", "avatarId", "roleId") FROM stdin;
3	Clone	clone001.test@gmail.com	\N	0942463758	t	2003-01-01 00:00:00	t	2025-03-12 07:35:53.293+00	2025-03-12 07:47:18.117+00	\N	1
1	Duong Hoai Bao	baob2103488@student.ctu.edu.vn	$2b$10$w2eJGZtvcnZFT2hhZ3IO0O.KBYTHrgEbUzD7AZy3dvuJB.rshyUhi	0942463758	t	2003-05-25 00:00:00	t	2025-03-09 09:20:41.76+00	2025-03-17 04:52:25.373+00	\N	2
2	Duong Hoai Bao	admin@gmail.com	$2b$10$v1Q5Ltn3N78FVqqx4eEJRe5GykpO8TQj1AG5Qt0NwsD5Z4LQXjfmO	0942463758	t	2003-05-25 00:00:00	t	2025-03-09 09:21:09.627+00	2025-04-04 16:49:14.942+00	1	2
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.vouchers ("voucherId", "voucherCode", "discountType", "discountValue", "minOrderPrice", "maxPriceDiscount", "startDate", "endDate", quantity, "collectedQuantity", "currentUsedQuantity", "createdAt", "updatedAt") FROM stdin;
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

SELECT pg_catalog.setval('public."order_addresses_orderAddressId_seq"', 2, true);


--
-- Name: order_details_orderDetailId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_details_orderDetailId_seq"', 1, false);


--
-- Name: order_statuses_orderStatusId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_statuses_orderStatusId_seq"', 1, false);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: payment_methods_paymentMethodId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."payment_methods_paymentMethodId_seq"', 1, false);


--
-- Name: permissions_permissionId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."permissions_permissionId_seq"', 1, false);


--
-- Name: price_filters_priceFilterId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."price_filters_priceFilterId_seq"', 1, false);


--
-- Name: price_histories_priceHistoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."price_histories_priceHistoryId_seq"', 2, true);


--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public.product_embeddings_product_embedding_id_seq', 8, true);


--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_image_embeddings_productImageEmbeddingId_seq"', 2, true);


--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_informations_productInfoId_seq"', 4, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."products_productId_seq"', 2, true);


--
-- Name: promotion_periods_promotionPeriodId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."promotion_periods_promotionPeriodId_seq"', 1, true);


--
-- Name: promotions_promotionId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."promotions_promotionId_seq"', 1, true);


--
-- Name: reviews_reviewId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."reviews_reviewId_seq"', 1, false);


--
-- Name: roles_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."roles_roleId_seq"', 1, false);


--
-- Name: system_configurations_systemConfigId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."system_configurations_systemConfigId_seq"', 1, false);


--
-- Name: upload_images_uploadImageId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."upload_images_uploadImageId_seq"', 8, true);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."users_userId_seq"', 1, false);


--
-- Name: vouchers_voucherId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."vouchers_voucherId_seq"', 1, false);


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
-- Name: _product_promotionperiod _product_promotionperiod_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._product_promotionperiod
    ADD CONSTRAINT "_product_promotionperiod_AB_pkey" PRIMARY KEY ("A", "B");


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
-- Name: promotion_periods promotion_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.promotion_periods
    ADD CONSTRAINT promotion_periods_pkey PRIMARY KEY ("promotionPeriodId");


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
-- Name: _product_promotionperiod_B_index; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE INDEX "_product_promotionperiod_B_index" ON public._product_promotionperiod USING btree ("B");


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
-- Name: _product_promotionperiod _product_promotionperiod_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._product_promotionperiod
    ADD CONSTRAINT "_product_promotionperiod_A_fkey" FOREIGN KEY ("A") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _product_promotionperiod _product_promotionperiod_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public._product_promotionperiod
    ADD CONSTRAINT "_product_promotionperiod_B_fkey" FOREIGN KEY ("B") REFERENCES public.promotion_periods("promotionPeriodId") ON UPDATE CASCADE ON DELETE CASCADE;


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
-- Name: promotion_periods promotion_periods_promotionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.promotion_periods
    ADD CONSTRAINT "promotion_periods_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES public.promotions("promotionId") ON UPDATE CASCADE ON DELETE RESTRICT;


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
-- Name: upload_images upload_images_messageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.upload_images
    ADD CONSTRAINT "upload_images_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES public.messages("messageId") ON UPDATE CASCADE ON DELETE SET NULL;


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: dhoaibao
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

