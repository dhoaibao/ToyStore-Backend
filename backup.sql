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
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.categories ("categoryId", "categoryName", slug, "isActive", "createdAt", "updatedAt", "categoryThumbnailId") FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.messages ("messageId", content, "isRead", "time", "senderId", "receiverId") FROM stdin;
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
\.


--
-- Data for Name: product_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_embeddings (product_embedding_id, embedding, product_id) FROM stdin;
\.


--
-- Data for Name: product_image_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_image_embeddings ("productImageEmbeddingId", embedding, upload_image_id, product_id) FROM stdin;
\.


--
-- Data for Name: product_info_values; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_info_values (value, "productInfoId", "productId") FROM stdin;
\.


--
-- Data for Name: product_informations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_informations ("productInfoId", "productInfoName", "isActive", type, options, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.products ("productId", "productName", slug, quantity, description, "soldNumber", "avgRating", "isActive", "createdAt", "updatedAt", "brandId", "categoryId") FROM stdin;
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

SELECT pg_catalog.setval('public."addresses_addressId_seq"', 1, false);


--
-- Name: banners_bannerId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."banners_bannerId_seq"', 1, false);


--
-- Name: brands_brandId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."brands_brandId_seq"', 1, false);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 1, false);


--
-- Name: categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."categories_categoryId_seq"', 1, false);


--
-- Name: messages_messageId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."messages_messageId_seq"', 1, false);


--
-- Name: newses_newsId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."newses_newsId_seq"', 1, false);


--
-- Name: order_addresses_orderAddressId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_addresses_orderAddressId_seq"', 1, false);


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

SELECT pg_catalog.setval('public."price_histories_priceHistoryId_seq"', 1, false);


--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public.product_embeddings_product_embedding_id_seq', 1, false);


--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_image_embeddings_productImageEmbeddingId_seq"', 1, false);


--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_informations_productInfoId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: promotion_periods_promotionPeriodId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."promotion_periods_promotionPeriodId_seq"', 1, false);


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

SELECT pg_catalog.setval('public."roles_roleId_seq"', 1, false);


--
-- Name: system_configurations_systemConfigId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."system_configurations_systemConfigId_seq"', 1, false);


--
-- Name: upload_images_uploadImageId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."upload_images_uploadImageId_seq"', 1, true);


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

