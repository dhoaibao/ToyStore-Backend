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
    vat double precision NOT NULL,
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
4	2
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
72dbb06d-9e43-4cdb-ae89-d516008ce6aa	fd5b2dec66e739239e044beb4f382ac1019ebdfbe0bdc05aa637c0b50ced6e17	2025-04-06 08:39:34.957204+00	20250406083535_update	\N	\N	2025-04-06 08:39:34.610442+00	1
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
1	LEGO SPEED CHAMPIONS	Thương hiệu LEGO SPEED CHAMPIONS	t	2025-04-06 09:19:37.986+00	2025-04-06 09:19:37.986+00
2	BATMAN	Thương hiệu BATMAN	t	2025-04-06 09:20:26.504+00	2025-04-06 09:21:03.481+00
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
1	LEGO	lego	t	2025-04-06 09:17:37.175+00	2025-04-06 09:17:37.175+00	2
2	Siêu anh hùng	sieu-anh-hung	t	2025-04-06 09:17:49.755+00	2025-04-06 09:17:49.755+00	3
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
1	299000	2025-04-06 11:04:53.325	\N	1
\.


--
-- Data for Name: product_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_embeddings (product_embedding_id, embedding, product_id) FROM stdin;
1	[0.009901526,0.058095705,0.0432558,0.004091028,-0.047457084,0.025867764,0.07975478,0.0050921952,-0.0017302989,0.039251607,0.081602015,-0.065505825,-0.028170481,-0.052164823,-0.09548013,-0.018558435,-0.09418797,0.022159753,0.054605454,0.021624666,-0.0694252,0.0008442264,0.004385636,0.04225891,-0.04053706,-0.05035678,-0.005225049,-0.014038171,-0.0028677753,-0.097031884,0.008048802,0.008982375,-0.007037887,-0.06748998,0.031808995,0.047887072,0.044516787,-0.002801634,-0.101408295,0.03320115,0.020073375,-0.10598561,-0.033753853,0.016134223,0.04121165,0.004626025,-0.017733395,0.043928288,-0.04046473,0.035501037,-0.059515473,0.041294914,0.0030613663,0.012567768,-0.011514873,-0.035426304,0.07532218,0.046196233,-0.028038781,0.025119744,0.030706443,0.040928196,-0.07548079,0.029401956,0.022901943,-0.025210202,0.077635154,-0.016791718,-0.06680865,0.03390536,0.057509355,-0.090723075,-0.025682162,-0.06283007,-0.0047100447,0.026951307,-0.014552177,-0.033626385,-0.027867146,0.0023076728,-0.08866035,-0.06663179,-0.044428587,0.023871575,0.010758241,0.04643526,0.030750297,-0.055332724,-0.018024042,-0.06253221,-0.054112814,-0.042283304,-0.047496933,0.007128904,0.008346917,0.06431551,-0.010518525,-0.02036965,-0.11844278,0.046227288,-0.015078874,0.082607105,-0.034237176,0.08453422,-0.035941675,0.0673406,-0.06317322,-0.035409834,0.011183018,-0.040793072,0.014345342,-0.05555488,0.06855312,-0.013801346,0.049901042,0.02187072,-0.023651572,-0.04849501,-0.0034169748,0.021586154,0.07173831,0.048048183,-0.08847476,0.024856823,-0.00017232155,0.022447664,0.019601071,-1.4217854e-33,-0.009430527,-0.0018234869,0.016022788,0.035432264,0.024845997,-0.056424215,-0.08888337,0.05388056,-0.065263115,-0.028322294,-0.010635905,-0.09651117,-0.026745996,0.030095406,0.065523684,-0.03450728,0.16828038,-0.07382668,0.0882239,0.020738946,-0.06973378,-0.030548621,0.017925555,0.023744348,0.09136679,-0.0004338313,-0.00469393,-0.014114899,-0.1038162,0.07304545,-0.04431857,-0.03835491,0.040448956,-0.016755642,-0.048649598,-0.13788615,0.025659295,0.039876,-0.015773183,-0.010181572,0.007499169,0.03866827,0.053151578,-0.041983716,-0.045259465,0.022836462,-0.009402377,0.006193518,0.08343636,0.050280772,0.03867778,-0.024433088,-0.08062882,0.027184876,-0.019017445,0.0283678,-0.038966693,0.07378522,-0.037772052,0.056306828,0.08391782,0.050801367,-0.052081,0.04286591,-0.07594354,-0.020559924,0.030791953,0.025504746,0.006166098,-0.058478013,-0.13831648,0.026312103,0.07916502,0.014065137,-0.053218767,0.010811661,-0.059135985,-0.017925464,0.07531748,-0.0154953515,0.07399168,-0.01826769,-0.015633719,-0.0005099778,0.023849752,0.010986608,0.029774038,-0.017932553,0.005795476,0.050803386,-0.001184893,0.0075350287,0.15162624,-0.08091697,-0.091499925,-8.721852e-34,-0.0259632,-0.017392922,-0.041883584,0.007151692,0.0928872,0.0674492,-0.054284096,0.036508515,-0.06098039,-0.03214,-0.02095451,-0.023828024,-0.0502351,0.06324742,0.13809285,0.03994568,0.11451957,0.0010390161,0.009451327,0.017088562,0.018773476,-0.104899146,0.018629616,-0.023014026,-0.055922505,0.023990532,0.030814027,-0.021253379,-0.06481835,0.08464758,-0.025236996,-0.06768397,-0.07902536,-0.0008322827,0.072808236,0.076915346,0.10064953,0.032911193,-0.029343342,0.035012398,0.047582865,-0.007013683,-0.034817528,0.04811292,0.043632895,0.012979859,-0.103843205,0.060744364,-0.04919134,-0.018821422,-0.011213848,0.006938348,0.104818456,0.03213267,-0.04370924,-0.04315066,0.011141159,-0.051269297,-0.085971,-0.018847961,-0.05368828,-0.038429312,-0.060195804,0.01767124,0.053001102,-0.03334354,-0.019973269,-0.04249576,-0.05394194,0.002237401,-0.005705191,-0.0018634102,-0.025180914,0.0029576519,-0.08357997,-0.051514916,-0.03262118,-0.0008197929,0.04448178,0.027094387,-0.04083301,0.019096226,-0.07970192,-0.016399788,0.011173048,-0.013240948,0.002115591,-0.033751003,0.02999469,-0.05564523,0.04273212,0.017854892,-0.04196856,-0.0361579,0.001216656,-1.604538e-08,0.085167184,-0.09019776,-0.029146608,-0.037316326,0.023558341,-0.025173565,0.0030937379,0.00402462,0.013486255,0.040705502,0.040740695,0.112198666,-0.0005034129,0.110407,-0.023228044,0.025129454,0.017071802,0.010561822,-0.017406918,0.029190062,0.059410583,0.025998836,0.0044646338,-0.10639387,-0.073090434,0.04026561,-0.08499115,-0.068311,-0.017493436,0.0016863957,0.062076002,0.055455565,-0.053721767,-0.030147618,0.034892663,-0.059027165,0.104204446,0.025295986,0.040606108,-0.014737806,0.06729175,0.077840686,0.04234829,0.035338614,0.13000363,-0.0068736086,0.033369664,-0.0053691915,0.046333693,0.03114579,-0.06526549,0.044874292,0.016920064,0.043936037,-0.012167994,-0.07914618,0.02105921,-0.009256108,0.01042191,-0.056431938,0.12301812,0.07393019,-0.008706728,-0.004313719]	1
2	[-0.095404685,0.1282641,-0.06441123,-0.039136365,-0.06347727,0.036073033,0.04437321,0.05639997,-0.028292386,0.03771104,0.042011857,-0.105361864,-0.03039874,0.00889063,-0.025619315,-0.0045031123,-0.06345993,0.07503103,-0.034182552,0.053128965,-0.05891047,-0.0026351672,-0.014698262,-0.028595438,-0.025091909,0.022202583,-0.01715446,0.02729354,-0.012413321,-0.026920106,0.009272162,0.08862501,0.014182729,-0.04183187,0.09032102,-0.0274762,0.036273997,0.026822085,0.031521257,-0.00083847274,0.0063824872,-0.013038816,0.03625537,-0.04504063,0.09756026,0.050432704,-0.011280301,0.026407424,-0.020121519,0.020515863,-0.08563682,0.022033999,0.004104186,-0.009180715,-0.009872928,-0.08791977,-0.007922649,0.027451154,0.021440225,-0.028904902,-0.007059597,0.02410617,-0.089015685,-0.04629774,0.055260714,-0.114836864,-0.030685509,-0.07892452,-0.072625935,-0.020688172,0.030281216,-0.052107964,0.022990394,0.0017845187,-0.08092517,0.029134024,0.031187197,0.02678439,0.09287817,-0.05895104,0.10973099,0.049128484,0.0012918424,0.057427097,0.012657357,0.01837328,0.024817979,-0.049541,-0.0024424968,-0.03365646,-0.010296936,0.016200293,-0.04373837,0.010251875,-0.036626585,-0.08729854,0.06001448,0.042305782,-0.024534097,0.15996483,0.00152966,-0.010342569,0.0033829801,0.041252743,-0.028127879,0.033298615,-0.006941965,0.09151866,0.042739294,0.042987615,-0.0082787685,0.020779656,-0.1061169,-0.11343588,0.1053612,-0.026378812,-0.037015297,-0.00636863,-0.03359162,0.00455136,-0.030709231,-0.009226611,-0.020111373,-0.021688737,-0.0077557354,-0.08352905,0.1158506,8.581919e-33,-0.050643295,-0.025479529,0.020498237,-0.03687393,-0.03337001,-0.027117115,-0.040723715,-0.03463454,0.04008705,-0.05960599,-0.0025347306,-0.02465897,-0.017014978,0.01621702,-0.052981276,-0.002582221,0.032815695,-0.08299701,-0.016215198,-0.020969894,-0.069251455,-0.014106708,-0.0015445118,0.022022452,-0.026408963,0.0038700963,0.037392233,-0.11103181,0.02770019,0.067173004,0.12518422,0.04319652,-0.020976165,-0.082516335,-0.09764949,-0.008613696,0.0007281427,-0.0586993,-0.0082722055,-0.09341955,-0.0017009598,-0.009744922,0.002999342,-0.0104613565,-0.015767409,0.021120807,0.025660066,0.0047161956,0.03545746,0.045706768,-0.07586518,-0.01769342,-0.11683599,0.018009158,0.0007538446,-0.039988905,0.00010383485,0.03467335,-0.0031009766,-0.03232426,-0.015670726,0.014920984,-0.04708916,0.044057585,-0.0045705093,-0.09124688,0.0134651065,-0.10799178,0.057554428,-0.021389956,-0.041465323,-0.023346145,0.08637405,-0.026769133,-0.12737392,-0.0034227485,0.012233702,0.06860371,-0.07090343,0.027587608,-0.046109237,0.05048502,-0.0089763515,-0.093369335,0.062265825,-0.0052412003,0.028195374,-0.090086214,0.06469917,0.019651929,0.029102335,-0.029054968,0.034711204,-0.017052878,0.03383375,-9.692106e-33,0.042288844,-0.023103423,-0.084926106,0.02889326,0.0021010612,-0.009155031,-0.119097844,0.011562865,-0.088960096,0.00128345,-0.030756207,-0.03424924,0.053133894,0.056447115,0.05416114,-0.028452527,0.09147787,-0.0045718867,0.0344455,0.032081466,0.006125861,-0.041841842,-0.0992102,0.029482113,0.017449804,-0.0037201915,0.0009899475,-0.035544965,-0.029643748,-0.014201872,-0.06880125,-0.021104172,-0.039931726,0.11204615,0.05661082,-0.09518907,0.14590652,0.017738406,-0.028972888,0.055487107,-0.05399809,0.016755404,-0.09386904,0.0240978,-0.024234446,-0.003941371,0.0051212376,0.037084382,0.011195902,-0.0030713985,0.1323687,0.0013072054,-0.023359356,-0.07552627,-0.007945667,0.009918932,-0.00068461406,-0.07654873,0.029556815,0.038733687,0.07049199,0.02093257,-0.038066264,0.041998442,0.033428993,0.053779434,-0.039136477,-0.0031839514,0.083579004,-0.06562449,-0.047680184,-0.07626789,0.08761895,-0.013141303,-0.04701422,-0.049883932,0.04811406,0.069208026,-0.0034331924,-0.017548896,-0.019336764,-0.035261896,0.004170326,0.054289863,-0.022301387,0.030205397,0.060709465,-0.018174756,-0.006868762,-0.00041147004,0.0560688,0.07955179,0.05400062,0.0053204517,-0.0456642,-3.3524255e-08,0.029686594,-0.06692598,-0.049603842,0.047301207,0.04268524,0.016788142,-0.04148312,-0.08549501,0.036554884,0.10661366,0.019949049,0.018517755,-0.059537813,0.042499214,0.0132685285,0.0319282,-0.0295895,-0.0076952777,-0.00629088,0.0103999255,0.04666099,-0.035080675,0.016901083,-0.019883377,-0.029707931,0.022867812,-0.0248095,0.024529511,-0.027661135,0.0061041014,0.00649169,0.15768068,-0.043589454,-0.01624559,-0.042658497,0.02681873,0.084852576,-0.020916043,-0.08153537,-0.055681184,0.054376476,0.014583553,0.0684543,0.0025932924,0.111281,-0.026941901,0.07840981,-0.08488926,0.019773716,-0.06505253,-0.1383106,0.020134838,0.044607,0.023835722,-0.035765454,0.062292535,0.02403867,-0.042729143,0.005854457,0.05314791,0.063567534,0.03492365,-0.011563843,0.017001003]	1
3	[-0.031115703,0.07228415,-0.106388554,0.043647055,0.00306061,0.020159692,0.09521165,0.027221834,-0.005387294,0.027901523,0.019218389,-0.112000264,0.0018563436,0.0488095,0.0030558778,0.029106725,0.08257167,0.024552858,0.0022377793,0.013706387,-0.08618785,0.035027336,0.0043110363,-0.002094307,-0.04195081,0.02590925,-0.035425663,-0.022206582,-0.06656269,-0.07735975,-0.014562547,-0.05518462,0.021434372,0.028155526,0.0017880236,-0.060415175,0.016916232,0.13987748,0.012555221,-0.054061644,-0.020663274,-0.002142569,0.020796468,-0.04018836,0.054942742,0.0017032463,0.030149398,0.064522564,0.028236946,0.04097699,0.011436725,0.006963127,-0.091682926,0.012873764,0.053312507,-0.044712283,0.00060789695,-0.014268721,0.08004165,0.019581387,-0.009964154,-0.016231306,-0.02911001,0.0404317,0.061204888,-0.089236416,-0.056126866,-0.008785498,-0.041533243,0.038721927,-0.033809442,-0.017733024,0.06709637,-0.027331105,-0.037634276,0.010366075,0.10154866,0.037961185,0.048828386,0.010895335,0.023621531,-0.024475783,-0.04513793,0.051071163,0.0167029,-0.015936036,0.0423831,-0.023516996,-0.020003125,0.008048889,-0.078154236,0.027681101,0.018993001,0.037304677,-0.09866143,-0.02121924,0.003926739,-0.03595198,-0.0914941,0.25986558,-0.029016964,-0.0301425,0.03798526,-0.012666466,0.08355493,0.014381395,-0.019502316,0.0054552504,0.0525549,0.05115426,0.018647771,-0.026544923,-0.11564076,0.00432168,0.11497012,-0.01064604,0.021167176,0.032452904,-0.01603424,0.0944779,0.06268823,0.076284,0.008761549,0.010221969,-0.0072799483,-0.06711905,0.045354232,-5.1472833e-33,-0.05274931,-0.09021515,0.06404277,-0.024035083,0.03231217,-0.015459583,0.017687775,0.024408076,0.036328763,0.03152721,0.02706811,-0.044840857,-0.071060844,0.06081146,-0.030867783,0.08545552,0.021850046,-0.050776273,-0.026444802,-0.060615387,-0.09595441,0.011948198,0.0118841035,0.035735965,-0.027338922,0.00085013744,0.021897756,-0.093343616,0.096996784,0.023238491,0.0424502,0.074320704,-0.00046422743,-0.0070514674,0.04297516,0.016341709,0.039555565,-0.10292211,0.012693045,-0.009996685,0.004242249,-0.029532608,-0.001231707,-0.011501808,-0.025902377,-0.013002655,-0.027488058,0.01624502,-0.07353523,0.07590172,-0.004567293,-0.05945683,-0.067214765,0.021617364,-0.08331151,-0.026029097,-0.029709453,-0.0069855293,0.025664361,-0.015536498,-0.020079242,-0.015249678,-0.053062025,0.050366603,-0.00695169,-0.07905177,-0.004158168,-0.051272724,-0.00851935,-0.067158565,-0.0077539883,-0.039077368,0.10921228,-0.043081403,-0.016350068,0.018313551,-0.007555513,0.074705236,-0.064942606,-0.0027752153,-0.046365835,0.0894124,-0.01209092,-0.040578436,0.018526977,0.028221827,-0.102295734,-0.070762336,0.06795869,-2.4033466e-06,-0.021247335,-0.079932235,0.054541957,-0.015980044,-0.053902104,3.436758e-33,-0.06376286,-0.045281243,-0.021774549,0.043939915,0.12691003,-0.008611042,-0.12020278,0.045832694,-0.045076776,-0.03190971,-0.06129435,0.0029695074,0.0051841494,0.0638937,0.058803964,-0.00972761,0.031067504,-0.012976454,0.015443088,0.039650466,-0.006642382,-0.07527281,-0.04358823,-0.03307824,0.0029833785,0.049178787,-0.049766816,-0.016604112,0.028110355,0.00966607,-0.10917828,0.06274933,0.011362723,0.04222297,0.018765371,0.14383471,-0.030122185,-0.03611486,-0.021222137,0.032415412,-0.009015063,0.028820772,-0.024347443,0.07439961,0.03813218,0.013402507,0.059015572,0.08467386,0.025603844,0.1115872,-0.035668906,-0.011756397,-0.049935866,-0.043635316,-0.053453144,0.039308965,0.017147169,-0.060797095,-0.0027391743,-0.01163686,0.028110586,0.029075267,-0.041551612,0.009573736,-0.07064317,0.06790366,-0.054612182,0.027230915,-0.041912723,-0.04094825,0.008865465,-0.016495077,-0.017981388,-0.032453597,-0.036470808,0.009567278,0.037783932,0.029564966,-0.05345302,-0.04670081,-0.03349573,-0.009267942,0.010236081,0.10957913,-0.00913925,0.036869694,0.049150106,-0.022823665,-0.0006595467,0.004622467,0.0264094,0.021800397,0.08342987,-0.034040455,-0.054692578,-1.1962736e-08,-0.068481565,0.015895903,-0.03833171,-0.061045174,0.07435671,0.094246626,-0.03667804,-0.009494811,0.068623334,0.055429228,0.030179625,0.021368554,0.014376987,0.0061191344,0.020571562,0.03498421,-0.0112459585,-0.0730364,-0.030790096,8.463913e-05,-0.084109806,0.04203667,0.029912928,0.0014928693,-0.005495275,-0.023829367,-0.10482728,0.030382358,-0.022736691,0.119543225,-0.0005625575,0.14491454,-0.09116918,-0.04015874,-0.013110288,-0.034736536,0.08847141,-0.017164176,-0.009903389,-0.047842123,0.02129885,0.06486193,0.006834626,-0.037002858,-0.01825222,0.0018945584,0.058255803,-0.11133324,-0.048167173,-0.08254139,-0.07651462,0.046591192,0.032249898,-0.019351538,0.021261059,0.0038181373,-0.021939471,-0.018282112,-0.051854108,0.03037016,0.12141623,0.023353526,0.049209353,0.06536158]	1
4	[-0.016400883,-0.008609628,0.022247909,-0.0710979,-0.09926137,0.032137666,0.03323109,-0.037878886,0.04998749,0.0426789,0.12212531,-0.059770238,0.0077975257,-0.0781779,0.005455822,-0.0027765085,-0.04796766,0.078931905,-0.0901119,-0.08439725,-0.04898939,-0.050122913,-0.03400312,-0.0140001215,-0.06711596,0.094595246,-0.022920193,0.057081793,-0.06561476,-0.013073675,-0.031384815,0.13714108,0.016264392,-0.01840919,0.010459867,0.031166371,-0.01738399,-0.010883703,2.5164827e-05,0.019511048,0.025331337,-0.0020268552,0.010557132,-0.06729362,0.04329022,-0.015387498,-0.030117327,-0.01718796,0.05441139,-0.05669357,-0.046403572,0.126254,-0.031047856,0.108163215,-0.09648925,-0.017883755,0.026383907,0.061469834,0.03923987,0.013350316,-0.05675125,0.0051939134,-0.03388835,-0.014117966,0.04313707,-0.0275007,-0.07394706,-0.06740239,-0.026014706,0.119000025,0.0008139417,0.0019514733,-0.060120773,0.053717617,-0.06441171,0.059431188,0.015478354,-0.044773668,0.004384526,-0.04255109,-0.004092686,0.016070906,0.05955809,-0.07951987,-0.03906284,0.023559462,0.0028712635,-0.010940379,-0.023348492,-0.031807285,0.03498403,0.06348239,-0.0678561,-0.057370886,0.037221402,-0.04231855,-0.006425086,0.051197644,-0.047541253,-0.008740913,0.10654988,0.04260592,-0.021636693,-0.076041244,-0.036479127,0.06391573,0.10297667,0.031576965,0.023676656,-0.013056629,-0.08682493,0.0024752766,0.0062559606,-0.07231365,-0.014613984,0.018755918,0.029237876,-0.02553254,-0.015706938,0.09002568,-0.02539484,-0.053111758,-0.0535215,-0.003876334,-0.056160837,-0.110385366,0.032304,1.7316672e-32,-0.011213743,0.042516187,0.058545973,-0.102261506,0.08723859,-0.031093795,-0.022127682,0.002221505,-0.05586578,0.011429656,0.041853,-0.0876576,-0.04681405,-0.022386422,0.009908513,-0.058140628,-0.017070316,-0.092425086,-0.02617737,-0.007980578,0.029798394,0.0411107,0.024742136,-0.0214964,0.01174356,0.01622948,-0.017412212,-0.030273948,0.024031602,0.04562492,0.0003811383,-0.010292331,0.002488318,-0.06453805,-0.12357141,-0.016967833,-0.007163608,-0.0077868826,-0.0010910142,-0.015609107,0.03174982,-0.008534326,-0.019341322,0.022430407,-0.020277599,0.07611224,-0.01576905,-0.029086921,0.03370266,0.0047713234,0.027108012,-0.03974245,-0.09117835,0.03854507,0.07403894,-0.03782066,0.053324055,0.012116584,0.045008678,0.042501386,0.007057261,-0.0023985356,-0.00503312,0.06469836,-0.02045448,-0.016032226,-0.015099699,-0.047086876,0.05243829,-0.11685984,-0.08757371,-0.04357307,0.013839474,0.042654704,-0.0489451,-0.05243593,0.021134792,-0.046471182,0.023404121,0.005162933,0.06210091,0.011822541,-0.032580145,-0.042660568,-0.022161404,-0.022912098,0.0469851,-0.06535058,-0.09930017,-0.010433007,0.00988306,0.06782121,0.09862303,-0.031877752,-0.057665184,-1.4736326e-32,0.0148728,0.07139178,0.020296607,0.06546527,0.018473761,-0.013043029,0.04245437,0.019953271,0.066550285,-0.071603715,-0.00093709666,-0.08999051,-0.018562663,0.02768845,0.040368672,0.026279798,0.022376116,0.088541366,0.024704874,0.050723348,-0.008409848,-0.023710364,0.020318247,0.07343559,-0.041465215,0.03393994,0.02360099,0.050956093,0.05830498,0.052128397,-0.027869035,-0.095823936,-0.11966933,0.09376408,0.026549421,-0.06365921,0.054419313,0.0012191418,-0.076938495,0.0640669,-0.024496999,-0.014951523,-0.03336238,-0.010209777,-0.028168838,-0.021174721,0.111835584,0.050851073,-0.10386724,-0.030671075,0.076858446,-0.011300619,-0.07348854,0.043639854,0.0244483,0.021445472,0.013984121,-0.061777536,-0.07219613,-0.05637618,-0.05099456,0.041247897,-0.020521775,-0.08643699,0.078751825,0.03908947,0.09695242,0.026102524,0.017804226,-0.017526971,-0.15436414,-0.033382703,-0.052604392,-0.00710106,-0.0054264585,0.038386844,-0.035101797,0.042392056,-0.009065198,-0.01579792,-0.13761643,-0.022453122,-0.056806885,-0.0031582005,0.02293328,0.0973277,-0.011560134,-0.07065597,0.03197694,0.031826615,0.06949934,0.041110717,0.0484575,0.049914878,-0.030911362,-4.4347832e-08,0.022731883,-0.042110503,-0.0035130433,-0.0017554183,0.124958396,-0.013644102,0.030556133,-0.036847744,0.0081215715,-0.0106605105,0.1076875,0.034947753,0.0012846605,0.0043650144,-0.08707254,0.07337551,0.03344321,0.0005315589,0.0247233,-0.024023475,0.027247624,0.056140177,0.042149443,0.00011456473,-0.055735745,0.055937666,-0.06750614,0.04703094,-0.06510637,-0.0013284445,0.07021905,-0.03788802,-0.02557292,-0.059720557,0.08129602,-0.05522676,0.052003227,-0.032426767,-0.03594083,0.03281019,0.09738521,0.08503525,0.022236453,0.004993114,0.051669154,0.01750216,0.062382754,-0.009637138,-0.018093694,-0.025504505,-0.074241064,0.020506782,0.02923519,-0.026284473,-0.007847077,-0.023481857,-0.006438343,0.07965419,-0.025422443,0.0096068755,0.055234388,0.07449664,-0.09238695,-0.022877995]	1
\.


--
-- Data for Name: product_image_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_image_embeddings ("productImageEmbeddingId", embedding, upload_image_id, product_id) FROM stdin;
1	[-0.41619188,-0.13683115,-0.10703865,-0.22974588,0.2655553,-0.12698866,0.2312687,0.4319624,0.24998659,-0.020221673,-0.07145648,0.23563576,0.5515738,-0.054616194,-0.27334836,-0.09490619,1.0236559,0.13893446,-0.02110598,-0.19775164,-0.05415188,-0.08163737,-0.1325527,0.3721703,-0.16647123,0.23609252,-0.19890256,-0.25766695,-0.40552682,-0.1882541,0.39028102,-0.06119046,-0.04272209,0.12218742,-0.13674246,-0.34685937,0.11249427,-0.14095227,-0.3776513,0.10860511,0.07093996,-0.11809699,0.27468634,-0.06162086,0.06595199,-0.30834028,0.33197653,-0.091767296,0.14077199,-0.509441,0.20442419,0.19105013,-0.03921626,-0.14371885,-0.37930247,-0.0073258695,-0.046500053,0.25260127,-0.12469191,-0.032372944,0.6665323,-0.007990874,0.0030208577,-0.15497783,0.009956113,-0.17027445,0.07679735,-0.49720794,0.11878494,0.10315598,0.5130745,-0.3843643,0.14881016,-0.4087575,-0.17666501,0.537808,-0.5593028,-0.16540316,-0.08839935,0.38129556,0.12574026,-1.0121413,-0.015059723,0.03362243,0.31402865,-0.41196004,-1.1277574,0.3886622,-0.20594235,-0.021066744,0.12027574,0.21675022,-4.7748075,0.06665189,0.24359417,0.39718437,0.16897564,0.58692724,0.25911584,1.4235989,0.05581906,-0.14397828,0.26813045,0.32875276,0.35569412,0.014448218,-1.3763555,0.13730526,0.039667938,-0.12878452,0.022827873,0.6449364,-0.1737606,-0.16975787,-0.013838312,-0.30209967,-0.11187481,0.01921318,-0.6756175,0.00470663,0.10961224,0.63144463,-0.05278428,0.3624361,-0.049520206,-0.036380026,0.33203676,0.46000412,0.40610936,0.3075744,0.11652867,-0.8310829,-0.16717605,0.70912856,0.062316116,-0.16404422,-0.5590915,-0.39422002,-0.37704223,-0.23366097,-0.02238912,-0.473136,-0.40509546,-0.6144935,-0.37173846,-0.22793959,0.026059022,0.03024873,0.2152203,0.13125741,-0.24817315,-0.10197564,-1.743036,-0.1326161,-0.32318607,-0.56440836,-0.19379362,0.077567935,0.26634195,0.1655833,0.46911934,-0.17688383,0.22634883,0.2502822,0.5862949,-0.038650975,-0.1620212,0.03272283,0.26563895,0.33009225,-0.009383321,-0.15152363,-0.078459114,0.13392387,-0.15116554,0.33339265,-1.1523553,-0.37119743,-0.8006655,0.06607372,0.43426126,0.2334084,0.28959852,-0.14355575,-0.32055327,0.16387698,0.12126208,-0.48004514,-0.29853705,-0.114842564,0.39850664,0.3990234,0.3996851,0.06762488,-0.45207632,-0.38608375,-0.07740149,0.026735129,-0.7474776,0.24361,0.09155339,0.18870582,0.040194478,0.20179498,0.25060186,0.5496837,-0.23592976,0.2892149,0.07365724,-0.03515,-0.6059829,0.044196498,0.08878577,0.12520602,-0.67158544,0.19302468,0.021433147,-0.03291846,-0.23076704,-0.19509238,-0.21126077,-0.45182666,-0.047845952,0.21961558,-0.08261492,-0.022702493,-0.45655298,-0.18597023,-0.29501244,-0.36725718,-2.5257687e-05,0.36173585,0.0102806995,0.10074194,0.60053664,0.53027904,0.41397825,0.35531518,-0.06711171,-0.10575563,-0.44922432,-0.026021602,0.53306663,0.027485564,0.06549108,-0.123077944,-0.38231605,-0.02531639,-0.13908158,-0.061598476,0.20595771,-0.116745874,-0.43399376,0.2280784,0.15511908,0.23626922,-0.6953465,0.1926897,-1.3501905,0.24286245,0.056252994,-0.0021168052,-0.19475083,-2.5838506,-0.19100669,-0.058674194,0.43938333,0.058235332,-0.26630732,0.32304108,-0.18123418,-0.5075954,0.10208272,-0.13481651,0.23825285,0.19641554,0.6055545,0.41820565,-0.17065848,-0.25117943,-0.016195731,0.045432683,-0.46887875,0.18579766,-0.012006911,-0.34347552,1.0944337,-0.1754008,0.13150923,0.23254578,0.17686363,0.008470068,-0.16984697,-0.23346865,0.15092377,-0.2707431,-0.16335753,-0.33261746,0.29198226,0.07171351,-0.52535903,0.13121155,0.06537961,0.35045236,-0.08637911,-0.3808429,-0.03956396,0.012381833,0.5481526,-0.0025604088,0.054671407,-0.12039146,0.70527303,0.50529045,-0.10655554,-0.06825708,0.14276822,-0.1680379,0.28513837,-0.48970744,0.24441947,1.2892592,0.32324386,-0.33788326,0.31509563,-0.16759087,0.2576923,0.22370356,-0.45563364,-0.3943495,-0.04570974,0.20816258,-0.16623597,0.38247052,0.046739887,-0.24659668,-0.003229231,0.19310558,0.33537975,0.40505865,0.012932543,-0.28861982,0.28368104,-0.053068597,-0.11291248,-0.2739953,0.142364,-0.10237455,0.13041474,-0.09829471,0.5119494,0.13459772,0.12057449,-0.33274972,0.43941733,-0.34285235,-0.42183545,0.36194703,-0.05374072,0.00031454297,0.09182223,-0.18218778,-0.20313296,-0.39053282,0.33559272,-0.054650895,0.17128506,-0.081263386,0.20073219,-0.24184601,0.2531854,0.31290388,0.5762854,-0.043056753,-0.34420502,0.37830904,-0.1904714,0.020391876,-0.05960906,0.21204269,0.14061664,-0.13367794,0.049854167,0.29970574,0.20309074,0.20723449,-0.17704645,0.05860014,0.028045373,0.17083229,-0.17203434,-0.2766819,0.04192825,-0.32406482,-0.21656175,0.36672556,-0.05588511,-0.019106284,0.1521469,-0.6369559,-0.12984666,-0.27261752,-0.5430859,-0.057969376,-0.40235743,-0.09229792,0.5822219,-0.15800543,-0.5624773,-0.12319669,-0.10677019,0.41669983,0.55808324,0.14935939,-0.3165773,0.1483374,-0.33655205,0.53514934,0.08906467,-0.45096284,-0.046382025,-0.22346616,0.036036715,-0.11010859,0.12492278,0.1468349,0.12066499,0.037132435,0.5209703,-0.32585263,0.35264415,-0.31431326,-0.39298284,-0.06204499,0.09398866,-0.26576203,0.035347413,-0.13979751,0.41368276,-0.16408408,0.29125994,0.24024741,-0.37144744,0.1784289,-0.11717457,-0.09569951,-0.18635699,0.40556273,0.1277021,0.29536274,-0.31331328,-0.0900065,0.020554788,0.42185926,0.1364356,0.3175383,-0.57458025,0.2446786,-0.120661676,0.2764036,-0.19488494,0.5060956,0.41438892,-0.24154511,0.25218865,0.212932,-0.36872938,-0.072146446,-0.1202345,0.1414979,0.43024155,0.8178711,0.119606495,-0.16181765,0.11496785,0.3894198,-0.022189608,0.19655901,-0.0068548233,-0.30648124,0.0597911,-0.77213556,-0.14819032,-0.00029852902,-0.20784225,0.32239264,0.45134386,-0.015665693,0.28162456,0.2949094,0.32091242,0.14045043,0.3965469,-0.25899425,0.117618114,-0.40063766,0.21301286,0.0495448,0.5292827,0.24726714,-0.070079155,-0.11144061,0.45698586,0.32098868,-0.13905002,-0.69811606,-0.079051845,-0.3573029,-0.13565093,-0.39529935,0.36213136,-0.042144436]	4	1
2	[0.049275704,-0.3752735,-0.0970825,0.1847042,0.20620166,0.2783063,-0.021576727,0.21918273,0.26636901,-0.13978463,-0.2838166,0.41817433,0.5553235,-0.21242066,-0.051189918,0.0015218818,1.0524266,0.06868329,0.17105503,-0.3411969,-0.19297001,-0.3428167,-0.5414247,0.3801937,-0.78415906,0.18012664,-0.28505018,-0.17544362,0.026423028,0.09702823,0.56106204,0.15694484,-0.6537813,-0.08412108,0.08875044,-0.15273407,0.23736784,0.14962192,0.03736762,1.034927,0.11125799,0.28247645,0.27662537,-0.32753697,-0.34400165,-0.44104576,0.30784625,-0.19181463,0.30468866,-0.4531658,0.12520552,-0.045363404,-0.11689119,0.30448484,-0.26474342,-0.15600683,-0.8045999,-0.13557073,0.3382713,-0.29237065,0.59876037,-0.38579893,-0.21837622,0.048016958,0.038120363,-0.107974306,0.44657943,-0.29003897,-0.10440366,-0.4670281,0.72918785,-0.4569854,0.15118061,-0.6835451,-0.3125095,0.46110705,-0.01789026,-0.14615178,-0.14368759,0.82549334,0.635607,-0.7801033,-0.20910768,0.07271505,0.12807849,-0.41250932,-0.2596064,0.122540526,-0.13975966,0.2562392,0.4516157,-0.05224106,-4.8503594,-0.11517848,0.094348185,0.46600634,0.14223295,0.750476,0.22612439,1.134741,0.23052336,-0.3512347,-0.38612828,0.45335853,-0.21222787,-0.16513693,-1.3155875,-0.0061202296,0.15196452,-0.04192495,0.2020485,0.95744413,0.20666084,0.23736513,0.0815728,-0.14453177,-0.14901432,-0.3318734,-0.034310035,-0.21588266,0.12119316,0.49949157,-0.12277269,0.21737692,0.24046259,-0.20450738,0.06405336,0.46371448,0.42047983,0.009236119,0.04823145,-0.34255692,-0.18868856,0.6827735,0.030319389,-0.15940826,-0.53813523,-0.4661446,-0.29873857,-0.13694327,-0.18869367,-0.1988469,-0.0040290835,-0.3519238,-0.61308783,0.13467629,-0.2926504,0.2035469,0.033363134,0.060911667,-0.32648873,0.18927929,-1.4063505,0.14701818,0.24866787,-0.59787315,0.074301265,0.06405201,0.16000901,0.045558106,0.27291563,-0.17254731,0.075021625,-0.31679833,0.42187062,-0.038486246,0.009800087,0.37574077,0.5308938,-0.15509698,-0.23833606,0.18053758,-0.1896885,0.4147276,-0.23132747,-0.2218263,-1.0263928,-0.32979774,-1.0478066,0.24517655,0.44378054,0.3130491,-0.17978123,-0.27749887,-0.16684939,0.5596666,0.16547213,-0.4558372,-0.13887562,-0.05104588,0.2063957,0.13836496,0.27657163,0.19063362,-0.13521014,-0.43279776,-0.17008258,-0.28365237,0.13773622,0.062721975,0.22886318,-0.30209768,0.02731467,0.14973153,0.5723499,0.28041694,0.06234978,-0.18700759,0.06404544,-0.17521095,-0.365867,-0.21162465,0.1460666,-0.3872255,-0.17830767,0.094046414,0.44428596,-0.09150316,-0.3088062,0.13272753,0.6492866,-1.5873228,-0.19262849,0.35750565,-0.17508432,0.25640213,-0.33723333,-0.08212591,-0.3848117,-0.5161188,-0.08544383,-0.20411192,-0.49659625,0.35170457,0.8106832,0.18715549,0.38984498,0.19984977,-0.0514996,0.036329437,-0.00064267387,-0.20115602,-0.04838675,0.23649466,-0.342091,-0.27848175,-0.012458696,0.15420213,0.031960435,0.033379827,0.2252573,0.034440137,-0.22613358,0.2775534,-0.30196604,0.41595188,-0.6379461,0.22376259,-1.2755165,-0.15796702,-0.057458077,-0.052350886,0.11328638,-2.0229933,-0.0029208874,-0.15647416,0.20481566,0.11056854,-0.58925563,0.14915328,-0.69564295,-0.013512846,0.15187098,0.16238762,0.18345155,-0.319026,0.5618895,0.024337547,-0.26756382,-0.11474847,0.16875751,0.056675956,-0.57833314,-0.27930427,0.1274265,-0.29279247,0.44526228,-0.42967096,0.23889029,0.089908235,-0.13266122,-0.12104348,-0.046509065,0.12637624,0.79220456,-0.22795095,-0.3097404,-0.087968655,0.17426899,0.4623745,-0.07741773,-0.12601091,0.27527732,0.44404402,-0.49483398,-0.09178453,0.43190062,0.16076209,0.4509794,0.049758427,-0.103393905,0.12629968,0.68084455,0.49198848,0.306125,-0.5953372,0.31946447,-0.17564264,0.32146284,0.24341972,-0.18759644,1.2553384,0.34625304,-0.4319668,0.35553688,0.0045118877,0.12126884,0.2325932,-0.18147333,-0.5886683,0.05510258,0.17198716,-0.066163115,0.35840663,0.5645006,-0.28849724,0.25707197,0.07580523,0.3266578,0.09728958,-0.14353582,-0.09944725,0.32405427,0.035375584,-0.16218847,0.1300968,-0.09848917,-0.21862797,-0.40611896,-0.103736445,0.20807187,0.5945352,0.3290773,-0.2530783,0.09170627,0.030446148,-0.14401558,0.98476934,0.04199501,0.047632232,0.09760913,-0.026330844,-0.12767106,-0.4780916,-0.020745244,-0.36710402,0.08431607,1.0126846,-0.13312489,-0.015794424,0.15959896,0.14650844,0.3511196,-0.0225062,0.097137764,0.48269033,0.15756036,0.058570456,-0.076980196,0.4296339,0.39167523,0.6314516,0.06315876,-0.0138551025,-0.0133455405,0.28261882,0.3666013,0.11497627,-0.623,0.63861847,0.40597224,-0.2503737,-0.04141897,-0.04184073,0.03700541,0.3555262,0.05351058,-0.18752107,-0.14839216,-0.41800985,-0.028797565,0.41444227,-1.4191595,-0.16920258,-0.17543876,0.21780294,0.52618337,-0.24424972,-0.05002696,-0.12539855,-0.3296274,0.5038034,0.53540313,-0.27000278,-0.27462,0.54530966,-0.005053069,-0.18886183,-0.15567838,-0.1782366,0.0017277142,0.052524302,-0.18636018,-0.004773688,0.2827342,-0.07286902,-0.21148063,-0.1916361,-0.42682934,-0.33821493,0.7139122,-0.5959964,-0.80468875,-0.55761766,0.58745575,-0.1252882,-0.035433024,-0.07958356,0.40156513,-0.3907574,0.10876795,-0.3997691,0.04152567,0.12511976,0.13286082,-0.04415777,-0.22096434,0.08002848,-0.15289278,0.1435645,-0.25252807,0.12685634,-0.11598182,0.2954461,0.5960455,0.2642108,-0.004988241,0.53942066,-0.3083602,0.043376807,-0.52243817,-0.37953106,-0.047097757,-0.44143295,0.17283803,-0.22096783,-0.22697651,0.5644442,0.20032464,0.34259337,0.052571952,0.56179863,-0.31954175,-0.4693169,0.54661983,0.105849445,-0.27028054,-0.13091058,-0.2982593,-0.050627854,-0.03567436,-0.5184967,0.031724326,-0.08721896,0.5759184,0.29537737,0.46982875,0.41931143,0.31494534,-0.20884347,0.79424,-0.0414741,0.20011383,-0.1897451,-0.013226944,-0.2169145,0.31449223,-0.08013642,0.56396353,0.49869224,0.15094516,-0.03071852,-0.1522659,0.22539027,-0.08173019,-0.7392288,-0.16358833,-0.18792991,-0.23563719,-0.5841303,0.15646438,-0.52718663]	5	1
3	[-0.10723467,-0.06554427,-0.10668187,0.20154065,0.60980326,0.30987397,0.02956118,0.14528315,-0.31599987,0.14122248,-0.32264972,0.27807862,0.71301806,-0.21721017,-0.17581582,-0.049824778,0.4678778,0.18790635,0.09573475,-0.23332681,-0.71751064,-0.06377288,-0.7077536,0.4540403,-0.6741181,0.08032663,-0.13057892,-0.032144673,0.19521151,-0.045430798,0.21388318,0.49580866,-0.4432327,0.26572382,-0.27621436,0.025675086,-0.08469669,0.31006512,-0.006384576,0.7353629,0.052905936,-0.038188938,0.04609163,-0.57217276,-0.23771666,-0.5611518,0.4728845,-0.12975097,0.20131272,-0.47528893,0.47482497,0.19864091,-0.045160703,-0.13939647,-0.40021703,0.0171434,-0.23296964,-0.00013120881,0.17310813,-0.33374768,0.071084164,-0.0016830589,0.11916637,0.09020003,-0.08129753,-0.06517042,0.16892514,-0.2536599,0.15951748,-0.23615867,0.28001276,-0.32686,-0.3482026,-0.60416746,-0.090412,0.19094738,-0.059542656,-0.3616254,-0.37435928,0.62762916,0.10997003,-0.76131654,-0.30546296,-0.22624236,-0.04946632,-0.22068986,0.093254216,-0.2103551,0.02288164,0.01298034,0.35763115,0.012362356,-6.311563,0.08062256,0.5453869,0.5474752,0.3155015,0.42943072,0.04359711,0.68790895,0.03052528,-0.6601671,0.13009459,0.13817754,-0.20907271,0.12011072,-1.0011543,0.07626381,0.06288071,0.53013253,0.39958143,0.33581182,-0.004344294,-0.091634646,0.045178827,-0.12258397,-0.3096404,-0.096229695,0.1838193,-0.39203745,-0.04411875,0.28583303,-0.38059354,0.16463621,0.11370465,-0.004255446,0.29872856,0.41005737,0.4150559,0.06667187,-0.0075590154,-0.014298464,-0.25984982,0.8245588,-0.08434478,-0.084805086,-0.20047487,-0.36850703,-0.7320406,-0.06450657,-0.20218347,-0.1565684,-0.1949325,-0.10423784,-0.6439026,-0.036524255,0.039943777,0.04963723,0.15911022,0.29453763,-0.17766327,0.0839775,-1.402821,-0.24713475,-0.061686415,-0.42804557,-0.3796351,-0.38503176,0.6878139,-0.23210727,0.46466073,-0.34697998,0.03608495,-0.433269,0.5857651,-0.18956955,0.1368671,0.35612425,0.41917863,0.093048796,-0.09689388,-0.04804591,-0.135405,0.06460518,-0.36686546,-0.14545375,-0.67121255,-0.2055298,-1.170787,0.06121233,0.5750441,-0.03455022,0.09230647,-0.059113707,-0.48881975,0.32417148,0.30432388,-0.1907121,0.06168646,-0.06712693,0.31646037,0.33046433,0.34744745,0.3525103,0.05840838,-0.23613824,-0.0966765,-0.0148252845,-0.3504916,0.11465459,0.29917958,-0.41161475,0.33208948,0.048966568,0.28080022,0.77791846,-0.35774103,-0.3880933,-0.060307752,-0.30274296,-0.54790264,0.11403077,-0.0474989,-0.22190228,-0.17246515,-0.020989755,0.50915337,0.092647836,0.09676877,-0.11453515,0.5257679,-1.3773435,-0.2896327,0.35890898,0.045257688,0.41636452,-0.003456769,0.1679849,-0.12575555,-0.3330062,-0.0010277381,0.11555402,-0.21733068,-0.042497173,0.47767955,0.97427946,0.1575558,0.09993202,0.06870552,0.012583745,-0.075606346,-0.2898635,-0.16035703,-0.1630953,-0.038647503,-0.21884722,-0.061525114,0.49777523,0.19000211,-0.025074957,0.34918508,0.036420632,-0.15151499,0.3684052,0.012243585,0.49169576,-0.4987574,0.05037131,-1.7614934,-0.3407586,-0.20795777,0.0143037755,-0.33115983,-1.7332246,0.0345594,-0.26596075,-0.19145574,-0.2851213,-0.35941017,0.09442201,-0.37649617,0.11198438,0.30841368,0.13921957,-0.17859823,-0.25689456,0.31215045,-0.065437004,-0.19893053,-0.15503705,-0.22689483,0.57836264,-0.5620394,-0.25211257,-0.28470063,-0.21585707,0.6353009,-0.35966665,0.47883993,-0.016199902,-0.038280707,-0.11215664,0.2562977,0.38531977,0.4542803,-0.59120053,-0.22802623,0.055664886,0.57875794,0.15768816,-0.17676981,-0.24665466,0.3110103,0.20695756,-0.074478246,-0.3760653,0.19925039,0.24838258,0.29826623,0.051264804,-0.19072366,0.5340967,0.8230608,0.4517517,0.14947549,-0.277955,0.26590598,0.24244179,0.1121333,0.35718963,0.06975593,2.1345768,0.46886814,-0.62735665,0.25722265,0.060037967,0.11168806,0.105679296,-0.2928915,-0.09666092,-0.18622138,-0.18432233,0.118435815,0.16538846,0.49021256,-0.38062403,0.09828066,0.15381789,0.26339823,-0.10672887,0.088102266,-0.16119556,0.20622401,0.012685366,-0.20976269,0.01404904,0.033449475,-0.3296212,-0.18836081,-0.2274871,0.41732913,0.18900564,0.041994,-0.27017274,-0.019278208,0.05755461,0.032952357,1.4986157,0.28245378,-0.09600384,0.1625835,0.032740213,-0.105741076,-0.59993625,-1.0567164,-0.48642918,-0.18671316,1.0382115,-0.08863179,-0.014106923,-0.034509208,-0.12917483,0.43198654,0.0042910003,-0.04281302,0.4082144,0.5777198,0.039950818,0.24835391,0.1356406,0.44696072,-0.023996798,-0.26993516,-0.09438848,-0.17051539,0.3227584,0.71430236,0.2654107,-0.6151301,0.40397182,0.1635178,-0.16749822,0.35487777,-0.21918333,-0.16841342,0.37742886,-0.15022865,0.17312872,-0.20022,-0.59748197,0.01611994,0.075339004,-0.85465205,-0.35275874,-0.25683284,0.48926535,0.57990074,0.059231956,0.6494593,-0.04589366,-0.44856966,0.5217719,0.41829374,0.098178625,-0.44181967,0.5862513,-0.18165053,0.06454143,-0.16876711,-0.20598386,-0.08457111,-0.22607657,0.16846594,0.14887351,0.2554812,0.0059498036,-0.40635458,0.11428038,-0.14083856,-0.41919914,0.64173424,-0.8146626,-0.11599249,-0.9009886,0.04202758,-0.34536123,0.13528661,-0.070067145,0.3880153,-0.3859367,0.14462058,-0.44879755,0.1124017,0.09223383,-0.1617764,0.04158121,-0.25827342,0.06818017,0.020754842,0.26070097,-0.40029848,-0.054500345,-0.10316741,0.04404203,0.37373668,0.14049505,-0.21902789,-0.02635745,-0.4123433,-0.25967994,-0.3157227,0.21606715,-0.11800839,-0.45608,0.31514665,-0.30206084,-0.66313505,0.3376735,0.043107163,0.21334256,0.07886016,0.89667535,-0.17961524,-0.74293363,0.35359126,0.13879669,-0.14418991,0.054036625,-0.31532404,0.0057514,-0.3604486,-0.50768065,-0.08813932,0.27009928,0.061425243,0.45210773,0.44220042,0.24869373,0.08298946,-0.6498886,0.72952205,-0.21594211,-0.18212518,-0.07476441,-0.16819178,-0.24157056,0.41037297,-0.008842384,0.6503305,0.20137091,0.5093922,-0.023590688,0.03166143,0.24776912,0.058756676,-0.44170785,-0.01680404,-0.038069487,-0.2843578,0.11024258,0.24043357,-0.5705783]	6	1
4	[-0.22027844,-0.20939977,-0.0047124275,-0.0753368,0.2742455,-0.42220998,0.07262243,0.29801422,0.5984664,-0.28697807,-0.053982005,0.21611767,0.7974294,-0.2157175,-0.0041744323,-0.14627957,1.0399798,0.01744475,-0.09319319,-0.097124465,0.22683086,-0.03748173,0.008368103,0.34323907,-0.28456342,0.016463296,-0.34657007,-0.27331418,-0.42631742,-0.09195795,0.35790822,0.09213093,0.0013614204,0.3530305,0.0049359812,-0.42050764,0.033917956,-0.097965635,-0.3997868,-0.32996982,-0.048116673,-0.26520053,0.22825107,-0.07666669,0.03236147,0.08563549,0.31712252,-0.017014414,0.05185724,-0.38793024,0.20885949,0.5667565,-0.03301399,0.061147694,-0.40396073,0.17984465,-0.1442596,0.26407358,-0.15380824,-0.15992439,0.6937424,0.00015417833,0.012668398,-0.19065563,-0.024586793,-0.110526666,0.0951562,-0.37268633,0.2521876,-0.027122745,0.614239,-0.57710934,0.29817802,-0.44987288,-0.14107956,0.5186541,-0.17432712,-0.3381442,0.07729262,0.23727609,0.32255468,-0.93911815,-0.07585984,0.36184198,0.28802648,-0.30539736,-1.2585998,0.41253307,-0.20890804,-0.02661415,0.040363174,0.071695566,-5.2214613,0.07385169,0.073085055,0.33353525,0.16931579,0.5331794,0.34180942,1.5492872,0.11350409,-0.09949598,0.27179953,0.61046743,0.18729338,-0.16259427,-1.4082255,0.14781487,0.07252211,-0.11050976,-0.053024027,0.33849862,-0.060541846,-0.2749144,0.012516003,-0.45925993,-0.07548848,0.025040755,-0.46537378,0.14047338,-0.058231436,0.41785166,-0.053625666,0.43484747,0.016023688,-0.24543552,0.39402145,0.1945162,0.16406971,0.17877175,-0.14991666,-0.5790796,-0.30693543,0.7418339,0.28190437,-0.11785028,-0.45325497,-0.51781356,-0.53638464,-0.18315305,-0.0008686848,-0.50103647,-0.32940507,-0.54921836,-0.37148747,-0.2076901,0.03541697,-0.08969539,0.32849365,0.16928872,-0.3526904,0.05821129,-1.1883773,0.10738115,-0.2162534,-0.37299886,-0.18950303,0.38374987,0.36351717,-0.057164162,0.29226273,-0.1512304,0.07039939,0.11778813,0.64789027,0.17761786,0.12889992,0.18459551,0.3210427,0.356578,0.23547538,-0.06480883,-0.21148159,0.34030604,-0.30358592,0.2391222,-1.2544115,-0.39031774,-0.92740726,0.13180068,0.31671852,0.39127958,0.37860057,-0.3370372,-0.38703898,0.20228739,0.3063556,-0.2550503,-0.36423674,-0.006645752,0.41661906,0.4069672,0.559009,0.2975602,-0.5885253,-0.46870175,-0.09028782,0.09975035,-0.6276789,0.19186828,-0.019160239,0.08953727,-0.09135217,0.12549384,0.08519267,0.43608055,-0.23086858,0.18804981,0.28575376,-0.06820612,-0.64391124,0.33092433,0.25805917,0.09964711,-0.58483356,0.12122306,0.09799629,0.013488842,-0.17166497,-0.14256604,-0.14255579,-0.537833,-0.034406222,0.5524353,-0.33232847,0.074230246,-0.31433776,-0.09787577,-0.2749823,-0.29197496,-0.05225116,0.3075144,0.12689589,0.095520146,0.54871327,0.59526783,0.3639878,0.12902527,-0.07329972,0.103682965,-0.44631207,0.054132476,0.473181,0.027999932,0.18178283,-0.11999566,-0.13876678,-0.16551906,-0.27862516,0.08894779,0.33316657,-0.1025273,-0.39367586,0.16937596,0.10681537,0.20940165,-0.5886067,-0.011903438,-1.7931966,0.25852874,0.0054295366,0.023775171,0.04792078,-2.4943023,-0.15585315,-0.047182743,0.3069788,0.06485469,-0.37256524,0.39473838,-0.25268874,-0.46410227,-0.0674798,-0.14688964,0.334204,0.0099567035,0.56976926,0.19385767,-0.25173607,-0.36469632,0.15331115,0.14179586,-0.47700235,0.24528937,-0.00037748594,-0.31433937,1.1559675,-0.23477638,0.25094455,0.14793529,0.24847895,0.06381149,-0.059178002,-0.11222421,0.0778275,-0.33420306,-0.10173146,-0.36931962,0.34801507,-0.16294204,-0.4022845,0.043913577,-0.10821521,0.50963634,-0.21262541,-0.48711324,0.012247189,-0.018291228,0.44231695,0.029008547,-0.11527405,-0.022653675,0.7381056,0.6060159,0.2022824,-0.050222665,-0.15950786,-0.22624737,0.3862419,-0.36747035,0.5914348,1.6672566,0.45079428,-0.17362428,0.4882161,-0.18070814,0.16829462,0.35988727,-0.15262572,-0.52481306,-0.17325984,-0.15433672,-0.3417065,0.3591371,-0.0141518805,-0.27801612,-0.20116657,0.03095973,0.25498992,0.75269914,-0.24368384,-0.36362442,0.14889456,-0.01176519,-0.29105714,-0.34588933,0.25445735,-0.3165903,0.16027313,-0.32726592,0.2020557,0.14990538,-0.04691823,-0.23090626,0.34680644,-0.5420417,-0.32253602,0.31854895,-0.054301918,-0.026761139,0.09451433,-0.008515869,-0.075409,-0.21241394,0.18972144,-0.15687916,0.16301113,-0.160042,0.3417313,-0.073359795,0.27823895,0.25447693,0.7267403,0.07353979,-0.30089387,0.49065107,-0.16419213,-0.024273507,-0.058445185,0.15291664,0.08286097,-0.07863685,-0.17410128,0.2210465,0.24496421,-0.03130609,-0.11622276,0.16115433,-0.21699733,-0.5162457,-0.1911178,-0.3364092,-0.009976557,-0.24151683,-0.09081376,0.34568805,-0.05902365,0.120389655,0.1521565,-0.5306492,-0.09009151,-0.18645605,-0.466398,0.0052285204,-0.387563,0.059149932,0.478803,-0.19837107,-0.2234871,-0.164623,-0.21758772,0.4322282,0.68560827,0.14616357,-0.23364647,0.22957936,-0.33218762,0.34115967,0.02900282,-0.35264882,-0.0064716176,-0.22889766,0.08768393,0.008490565,0.35632518,0.12804362,0.1864729,-0.11875403,0.39964756,-0.3138911,0.43250224,-0.10690485,-0.3170183,-0.06474722,0.24783623,-0.38014212,0.26309177,0.043116152,0.32843098,-0.008492696,0.45106286,0.24183205,-0.42716038,-0.033890765,0.008316451,0.009492366,-0.44004878,0.42029434,0.23445313,-0.0221912,-0.30228883,-0.2927524,-0.21874098,0.14594401,0.14645241,0.36212894,-0.6268163,0.25092557,-0.13007678,0.14158906,-0.07940725,0.47979063,0.31836417,-0.22500038,0.14259888,0.2009082,-0.20806146,0.0699624,0.07342209,0.24291995,0.3199164,0.7561721,0.1273133,0.02032429,0.07355026,0.4761804,-0.00031163488,0.20012443,-0.08801733,-0.22582895,0.101457834,-0.80630076,-0.17536294,0.029946454,0.07324597,0.1813906,0.44742015,-0.056752626,0.28488347,0.17435148,0.12078703,0.36837456,0.35925004,-0.17607385,0.15899597,-0.4978224,0.3266807,0.2069147,0.48625353,0.37937713,-0.15581833,0.011141407,0.3796935,0.13492425,-0.09362467,-0.58065,-0.13244,-0.30412385,-0.111886114,-0.3107812,0.36952075,-0.10586984]	7	1
\.


--
-- Data for Name: product_info_values; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_info_values (value, "productInfoId", "productId") FROM stdin;
Nhựa	4	1
Trung Quốc	3	1
BATMAN FIGURE	2	1
3	1	1
\.


--
-- Data for Name: product_informations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_informations ("productInfoId", "productInfoName", "isActive", type, options, "createdAt", "updatedAt") FROM stdin;
1	Tuổi	t	INPUT_NUMBER	\N	2025-04-06 09:14:50.731+00	2025-04-06 09:14:50.731+00
2	Chủ đề	t	INPUT	\N	2025-04-06 09:14:56.637+00	2025-04-06 09:14:56.637+00
3	Xuất xứ	t	AUTOCOMPLETE	{"Việt Nam","Trung Quốc","Hàn Quốc","Nhật BảnBản"}	2025-04-06 09:15:27.841+00	2025-04-06 09:15:27.841+00
4	Chất liệu	t	SELECT	{Nhựa,Gỗ}	2025-04-06 09:15:42.255+00	2025-04-06 09:15:42.255+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.products ("productId", "productName", slug, quantity, description, vat, "soldNumber", "avgRating", "isActive", "createdAt", "updatedAt", "brandId", "categoryId") FROM stdin;
1	Mô Hình Nhân Vật Người Dơi 4inch BATMAN 6055946	mo-hinh-nhan-vat-nguoi-doi-4inch-batman-6055946	100	Đồ chơi BATMAN mô hình siêu anh hùng 4 inch 6058529 là mô hình đồ chơi siêu anh hùng đến từ vũ trụ DC chiếm được tình cảm không nhỏ của mọi người trên toàn thế giới. Mô hình sở hữu các chi tiết hoàn hảo, lắp ráp dễ dàng với các khớp nối linh hoạt. Sản phẩm đến từ hãng BATMAN cực kỳ an toàn cho bé trong quá trình chơi cũng như kích thích sự phát triển trí tuệ của bé\r\n\r\nĐồ chơi siêu anh hùng 6058529 gây ấn tượng với những đặc điểm nổi bật sau đây:\r\n\r\n    Sản phẩm có đường nét và chi tiết sắc sảo kết hợp với áo choàng mềm mại cực kỳ giống với nhân vật trên phim ảnh mang đến một anh hùng người dơi “siêu thực”.\r\n    Mô hình hành động với kích thước chuẩn 10cm nhỏ gọn phù hợp mang đi nhiều nơi cũng như cho bé cầm nắm trong quá trình chơi.\r\n    Sản phẩm được đi kèm 3 vũ khí bí mật như: găng tay, khiên chắn, súng plasma nhằm hỗ trợ bé có thể biến hoá nhiều trạng thái thông qua khả năng tư duy lắp ráp của bé từ đó kích thích trí tuệ, sự tưởng tượng và sáng tạo của trẻ bay cao để cho các nhân vật trong việc hoàn thành nhiệm vụ hay kế hoạch đặt ra của các bé.\r\n    Sản phẩm được làm từ nhựa cao cấp, các góc cạnh được bo tròn với bề mặt nhẵn tạo sự an toàn, không làm trầy xước da khi bé chơi. \r\n    Sở hữu 11 khớp nối giúp bé có thể sáng tạo ra những hành động hay tư thế khác nhau để hòa mình vào cuộc chiến của riêng mình và các bạn chơi cùng.\r\n    Quá trình tháo lắp dễ dàng mà không sợ dễ dàng bị hư hỏng, rớt các khớp nên không hề độc hại trong quá trình bé chơi robot.\r\n    Hỗ trợ kích thích phát triển vận động cũng như trí não của bé trong quá trình chơi mô hình.\r\n    Sản phẩm phù hợp cho các bé có độ tuổi từ 3 tuổi trở lên.\r\n    Sản phẩm giao hàng ngẫu nhiên	10	0	0	t	2025-04-06 11:04:53.327+00	2025-04-06 11:06:23.865+00	2	2
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
1	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/Luffy.jpg-1743929699366	images/Luffy.jpg-1743929699366	\N	\N	\N
2	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_3.webp-1743931056166	images/71806_3.webp-1743931056166	\N	\N	\N
3	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1743931068991	images/6055946_2.webp-1743931068991	\N	\N	\N
4	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_4.webp-1743937490234	images/6055946_4.webp-1743937490234	\N	1	\N
5	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_1.webp-1743937490237	images/6055946_1.webp-1743937490237	\N	1	\N
6	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/nguoi-doi-batman-4inch-6055946.webp-1743937490238	images/nguoi-doi-batman-4inch-6055946.webp-1743937490238	\N	1	\N
7	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1743937490238	images/6055946_2.webp-1743937490238	\N	1	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.users ("userId", "fullName", email, password, phone, gender, birthday, "isActive", "createdAt", "updatedAt", "avatarId", "roleId") FROM stdin;
1	Duong Hoai Bao	admin@gmail.com	$2b$10$v1Q5Ltn3N78FVqqx4eEJRe5GykpO8TQj1AG5Qt0NwsD5Z4LQXjfmO	0942463758	t	2003-05-25 00:00:00	t	2025-03-09 09:21:09.627+00	2025-04-06 08:55:00.334+00	1	2
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

SELECT pg_catalog.setval('public."brands_brandId_seq"', 2, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 1, false);


--
-- Name: categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."categories_categoryId_seq"', 2, true);


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

SELECT pg_catalog.setval('public."price_histories_priceHistoryId_seq"', 1, true);


--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public.product_embeddings_product_embedding_id_seq', 4, true);


--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_image_embeddings_productImageEmbeddingId_seq"', 4, true);


--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_informations_productInfoId_seq"', 4, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, true);


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

SELECT pg_catalog.setval('public."upload_images_uploadImageId_seq"', 7, true);


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

