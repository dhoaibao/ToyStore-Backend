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
    "updatedAt" timestamp with time zone NOT NULL,
    upload_image_id integer NOT NULL
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
8	2
1	2
2	2
3	2
5	2
6	2
7	2
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
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c3996dca-40a8-4b5c-8d87-a53abf440242	fd5b2dec66e739239e044beb4f382ac1019ebdfbe0bdc05aa637c0b50ced6e17	2025-04-07 06:07:13.884922+00	20250406083535_update	\N	\N	2025-04-07 06:07:13.319164+00	1
72dbb06d-9e43-4cdb-ae89-d516008ce6aa	fd5b2dec66e739239e044beb4f382ac1019ebdfbe0bdc05aa637c0b50ced6e17	2025-04-06 08:39:34.957204+00	20250406083535_update	\N	\N	2025-04-06 08:39:34.610442+00	1
e4fd7211-fd5e-450a-8d69-3c761afa4f68	1dd297acccc28a4b92a81813d3d6443d546007a7b7b67bfec473f606a205cc1b	2025-04-20 10:43:44.141778+00	20250420104339_update	\N	\N	2025-04-20 10:43:43.71805+00	1
\.


--
-- Data for Name: _product_promotionperiod; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._product_promotionperiod ("A", "B") FROM stdin;
10	2
11	2
8	3
6	3
\.


--
-- Data for Name: _user_voucher; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public._user_voucher ("A", "B") FROM stdin;
3	6
5	6
2	6
2	7
2	3
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.addresses ("addressId", "addressName", "provinceId", "districtId", "wardCode", "provinceName", "districtName", "wardName", detail, "contactName", "contactPhone", "isDefault", "userId") FROM stdin;
7	nha rieng	220	1572	550113	Cần Thơ	Quận Ninh Kiều	Phường Xuân Khánh	Hẻm 116	nguyen van c	0912345678	t	10
6	nha rieng	220	1572	550105	Cần Thơ	Quận Ninh Kiều	Phường An Khánh	Nguyễn Văn Linh	nguyen van a	0912345678	f	8
5	nha rieng	220	1572	550113	Cần Thơ	Quận Ninh Kiều	Phường Xuân Khánh	Hẻm 116	nguyen van b	0912345678	f	9
3	Nha rieng	220	1572	550103	Cần Thơ	Quận Ninh Kiều	Phường An Hòa	Hẻm 359/8 Nguyễn Văn Cừ	Duong Bao	0912345678	f	2
4	Nha rieng	220	1572	550113	Cần Thơ	Quận Ninh Kiều	Phường Xuân Khánh	3/2	Duong Bao	0912345678	f	5
2	Nhà riêng	220	1572	550113	Cần Thơ	Quận Ninh Kiều	Phường Xuân Khánh	Đường 30 Tháng 4	Dương Bảo	0912345678	f	1
1	Nhà riêng	220	1572	550105	Cần Thơ	Quận Ninh Kiều	Phường An Khánh	Nguyễn Văn Linh	Dương Bảo	0912345678	f	3
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
3	LEGO NINJAGO	LEGO NINJAGO\n\n	t	2025-04-16 06:10:15.953+00	2025-04-16 06:10:15.953+00
4	LEGO TECHNIC	LEGO TECHNIC\n\n	t	2025-04-16 06:15:06.681+00	2025-04-16 06:15:06.681+00
5	MINIFORCE	MINIFORCE\n\n	t	2025-04-16 06:18:52.398+00	2025-04-16 06:18:52.398+00
6	BOTTLEMAN	BOTTLEMAN	t	2025-04-16 06:22:12.293+00	2025-04-20 13:59:44.937+00
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
1	3
2	1
3	2
4	5
5	9
6	8
7	10
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.categories ("categoryId", "categoryName", slug, "isActive", "createdAt", "updatedAt", "categoryThumbnailId") FROM stdin;
3	Siêu anh hùng	sieu-anh-hung	t	2025-04-08 08:13:29.151+00	2025-04-08 08:13:29.151+00	12
4	LEGO	lego	t	2025-04-16 06:09:40.591+00	2025-04-16 06:09:40.591+00	19
5	Siêu robot	sieu-robot	t	2025-04-16 06:18:40.944+00	2025-04-16 06:18:40.944+00	41
6	Đối kháng	doi-khang	t	2025-04-16 06:22:02.973+00	2025-04-20 13:53:06.711+00	48
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.messages ("messageId", content, "isRead", "time", "senderId", "receiverId") FROM stdin;
1	xin chào, tôi cần tư vấn mô hình batman.	t	2025-04-17 09:37:12.395	3	\N
2	chào bạn	t	2025-04-17 09:37:52.538	1	3
3	bạn có thể cho shop biết thêm thông tin như màu sắc, mức giá mô hình mà bạn muốn mua không?	t	2025-04-17 09:38:31.429	1	3
5	xin chào, tôi cần tư vấn.	t	2025-04-17 11:03:20.472	2	\N
6	rất vui được hỗ trợ, bạn có thể cho tôi biết bạn cần tư vấn gì không?	t	2025-04-17 11:03:54.49	1	2
8	oke	t	2025-04-19 16:42:20.69	1	2
7	tôi cần tư vấn đồ chơi batman	t	2025-04-19 16:41:53.278	2	\N
9	xin chào	t	2025-04-20 09:56:24.899	5	\N
10	chào bạn, bạn cần giúp gì?	t	2025-04-20 09:56:39.915	1	5
11	bạn có ở đó không	t	2025-04-20 12:58:38.836	2	\N
12		t	2025-04-20 12:58:46.489	2	\N
13	chào bạn, bạn cần giúp đỡ gì	t	2025-04-20 13:05:40.224	1	2
14	tôi cần mua mô hình này	t	2025-04-20 13:56:31.109	2	\N
15	sản phẩm này đã hết hàng ạ!	t	2025-04-20 13:56:52.826	1	2
16	bạn có muốn mua sản phẩm khác không	t	2025-04-20 13:57:12.341	1	2
17	vậy sản phẩm lego thì sao	t	2025-04-24 05:01:57.045	2	\N
18	bạn có thể nói rõ hơn mô hình lego mà bạn muốn mua	t	2025-04-24 05:02:50.102	1	2
\.


--
-- Data for Name: newses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.newses ("newsId", title, slug, content, "createdAt", "updatedAt", upload_image_id) FROM stdin;
2	Chính sách đổi trả sản phẩm	chinh-sach-doi-tra-san-pham	<article>\n  <h2>Chính sách đổi trả sản phẩm</h2>\n  <p>Chúng tôi cam kết mang đến cho khách hàng những sản phẩm chất lượng và dịch vụ chăm sóc tốt nhất. Trong trường hợp sản phẩm bị lỗi do nhà sản xuất hoặc do quá trình vận chuyển, quý khách có thể đổi trả trong vòng <strong>7 ngày</strong> kể từ ngày nhận hàng.</p>\n  <ul>\n    <li>Sản phẩm phải còn nguyên tem, mác, chưa qua sử dụng.</li>\n    <li>Cần có hóa đơn mua hàng hoặc xác minh đơn hàng qua số điện thoại.</li>\n    <li>Không áp dụng cho sản phẩm giảm giá trên 50%.</li>\n  </ul>\n  <p>Mọi chi tiết vui lòng liên hệ hotline: <strong>1900 1234</strong> hoặc gửi email đến: <a href="mailto:hotro@cuahang.com">hotro@cuahang.com</a></p>\n</article>\n	2025-04-20 10:48:46.404+00	2025-04-20 11:02:40.899+00	55
3	Tiếp nhận góp ý & khiếu nại khách hàng	tiep-nhan-gop-y-and-khieu-nai-khach-hang	<article>\n  <h2>Tiếp nhận góp ý & khiếu nại khách hàng</h2>\n  <p>Chúng tôi luôn trân trọng mọi ý kiến đóng góp và phản hồi từ quý khách hàng. Mọi khiếu nại sẽ được xử lý trong vòng <strong>48 giờ</strong> làm việc kể từ khi tiếp nhận.</p>\n  <p>Hình thức tiếp nhận:</p>\n  <ul>\n    <li>Qua điện thoại: <strong>1900 5678</strong> (8h - 17h từ T2 đến T7)</li>\n    <li>Gửi email: <a href="mailto:khieunai@cuahang.com">khieunai@cuahang.com</a></li>\n    <li>Hoặc điền vào mẫu góp ý trực tuyến tại: <a href="https://cuahang.com/gopy" target="_blank">cuahang.com/gopy</a></li>\n  </ul>\n  <p>Chúng tôi xin chân thành cảm ơn sự tin tưởng và ủng hộ của quý khách!</p>\n</article>\n	2025-04-20 11:03:03.325+00	2025-04-20 11:03:03.325+00	56
\.


--
-- Data for Name: order_addresses; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_addresses ("orderAddressId", address, "contactName", "contactPhone") FROM stdin;
1	Nguyễn Văn Linh, Phường An Khánh, Quận Ninh Kiều, Cần Thơ	Dương Bảo	0912345678
2	Nguyễn Văn Linh, Phường An Khánh, Quận Ninh Kiều, Cần Thơ	Dương Bảo	0912345678
3	Đường 30 Tháng 4, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Dương Bảo	0912345678
4	Đường 30 Tháng 4, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Dương Bảo	0912345678
5	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
6	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
7	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
8	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
9	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
10	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
11	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
12	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
13	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
14	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
15	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
16	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
17	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
18	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
19	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
20	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
21	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
22	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
23	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
24	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
25	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
26	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
27	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
28	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
29	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
30	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
31	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
32	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
33	3/2, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
34	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
35	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
36	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
37	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
38	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
39	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
40	Hẻm 359/8 Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ	Duong Bao	0912345678
41	Hẻm 116, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	nguyen van b	0912345678
42	Hẻm 116, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	nguyen van b	0912345678
43	Nguyễn Văn Linh, Phường An Khánh, Quận Ninh Kiều, Cần Thơ	nguyen van a	0912345678
44	Hẻm 116, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	nguyen van b	0912345678
45	Hẻm 116, Phường Xuân Khánh, Quận Ninh Kiều, Cần Thơ	nguyen van c	0912345678
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.order_details ("orderDetailId", price, "discountedPrice", quantity, "orderId", "productId") FROM stdin;
1	299000	0	6	1	2
2	299000	0	3	2	2
3	299000	0	2	3	2
4	419000	0	1	3	6
5	299000	0	2	4	2
6	419000	0	1	5	6
7	419000	0	1	6	6
8	419000	0	1	7	6
9	419000	0	1	8	6
10	566000	0	1	9	7
11	566000	0	1	10	7
12	566000	0	1	11	7
13	566000	0	1	12	7
14	419000	0	1	13	6
15	419000	0	1	14	6
16	419000	0	1	15	6
17	299000	0	1	16	2
18	299000	0	1	17	2
19	299000	0	1	18	2
20	566000	0	2	19	7
21	566000	0	1	20	7
22	419000	0	1	21	6
23	419000	0	1	22	6
24	329000	0	1	23	12
25	329000	0	1	24	12
26	299000	0	1	25	2
27	329000	0	1	26	12
28	329000	0	1	27	12
29	299000	0	1	28	2
30	299000	0	1	29	2
31	299000	0	1	30	2
32	329000	0	1	31	12
33	359000	0	1	32	10
34	359000	0	1	33	10
35	329000	0	1	34	12
36	329000	0	1	35	12
37	329000	0	1	36	12
38	329000	0	1	37	12
39	329000	0	2	38	12
40	299000	0	2	39	2
41	400000	0	2	40	12
42	419000	0	1	41	6
43	566000	0	1	41	7
44	419000	0	1	42	6
45	566000	0	1	42	7
46	419000	0	1	43	6
47	1499000	0	1	44	9
48	566000	0	1	45	7
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
2025-04-10 08:13:19.521+00	1	1
2025-04-10 08:13:55.144+00	1	2
2025-04-10 08:14:01.152+00	1	3
2025-04-10 08:14:06.934+00	1	4
2025-04-16 05:30:10.997+00	2	1
2025-04-16 08:19:54.253+00	3	1
2025-04-16 08:53:57.146+00	4	1
2025-04-16 08:54:08.45+00	3	2
2025-04-16 08:54:11.208+00	3	3
2025-04-16 08:54:14.247+00	3	4
2025-04-17 05:51:10.148+00	4	5
2025-04-19 19:50:36.863+00	5	1
2025-04-19 19:51:46.9+00	6	1
2025-04-19 19:53:29.824+00	7	1
2025-04-19 19:53:59.774+00	8	1
2025-04-19 19:56:40.317+00	9	1
2025-04-19 19:57:11.971+00	10	1
2025-04-19 19:57:24.351+00	11	1
2025-04-19 19:57:52.895+00	12	1
2025-04-20 07:07:48.178+00	13	1
2025-04-20 07:10:36.293+00	14	1
2025-04-20 07:12:58.468+00	15	1
2025-04-20 07:14:23.488+00	16	1
2025-04-20 07:16:23.198+00	17	1
2025-04-20 07:18:31.727+00	18	1
2025-04-20 07:25:01.542+00	19	1
2025-04-20 07:26:58.111+00	20	1
2025-04-20 07:34:22.519+00	21	1
2025-04-20 07:37:09.781+00	22	1
2025-04-20 07:44:40.628+00	23	1
2025-04-20 07:48:28.283+00	24	1
2025-04-20 07:49:29.924+00	25	1
2025-04-20 09:16:36.011+00	26	1
2025-04-20 09:17:11.79+00	27	1
2025-04-20 09:31:24.848+00	28	1
2025-04-20 09:31:55.273+00	29	1
2025-04-20 09:38:12.612+00	30	1
2025-04-20 09:43:39.336+00	31	1
2025-04-20 09:46:51.856+00	32	1
2025-04-20 11:17:21.801+00	33	1
2025-04-20 11:19:35.86+00	29	2
2025-04-20 11:19:39.891+00	29	3
2025-04-20 11:19:43.372+00	29	4
2025-04-20 12:23:36.718+00	34	1
2025-04-20 12:24:04.039+00	35	1
2025-04-20 12:25:07.662+00	36	1
2025-04-20 12:25:19.957+00	37	1
2025-04-20 12:55:47.206+00	38	1
2025-04-20 12:57:12.965+00	38	5
2025-04-20 13:04:33.343+00	37	2
2025-04-20 13:36:42.552+00	36	5
2025-04-20 13:38:01.955+00	39	1
2025-04-20 13:47:57.585+00	39	5
2025-04-20 13:49:45.172+00	40	1
2025-04-20 13:50:43.839+00	40	2
2025-04-20 13:50:46.207+00	40	3
2025-04-20 13:50:48.625+00	40	4
2025-04-20 13:55:56.146+00	37	3
2025-04-24 07:22:37.477+00	41	1
2025-04-24 07:24:32.651+00	42	1
2025-04-24 07:30:09.173+00	43	1
2025-04-24 07:30:24.478+00	42	2
2025-04-24 07:30:27.742+00	42	3
2025-04-24 07:30:30.929+00	42	4
2025-04-24 07:30:34.809+00	43	2
2025-04-24 07:30:46.263+00	43	3
2025-04-24 07:31:56.455+00	43	4
2025-04-24 07:34:24.485+00	44	1
2025-04-24 07:34:59.708+00	44	2
2025-04-24 07:35:03.321+00	44	3
2025-04-24 07:35:06.497+00	44	4
2025-04-24 09:11:28.935+00	45	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.orders ("orderId", "totalPrice", "totalDiscount", "shippingFee", "finalPrice", "paymentStatus", "paidDate", "createdAt", "updatedAt", "userId", "orderAddressId", "paymentMethodId", "voucherId") FROM stdin;
1	1794000	0	22000	1816000	t	2025-04-10 08:14:07.007	2025-04-10 08:13:18.731+00	2025-04-10 08:14:07.008+00	3	1	1	\N
2	897000	0	22000	919000	f	\N	2025-04-16 05:30:10.981+00	2025-04-16 05:30:10.981+00	3	2	1	\N
4	598000	0	22000	620000	f	\N	2025-04-16 08:53:56.666+00	2025-04-16 08:53:56.666+00	1	4	1	\N
3	1017000	0	22000	1039000	t	2025-04-16 08:54:14.296	2025-04-16 08:19:53.731+00	2025-04-16 08:54:14.297+00	1	3	1	\N
5	419000	0	22000	441000	f	\N	2025-04-19 19:50:36.312+00	2025-04-19 19:50:36.312+00	2	5	2	\N
6	419000	0	22000	441000	f	\N	2025-04-19 19:51:46.363+00	2025-04-19 19:51:46.363+00	2	6	2	\N
7	419000	0	22000	441000	f	\N	2025-04-19 19:53:29.55+00	2025-04-19 19:53:29.55+00	2	7	2	\N
8	419000	0	22000	441000	f	\N	2025-04-19 19:53:59.506+00	2025-04-19 19:53:59.506+00	2	8	2	\N
9	566000	0	22000	588000	f	\N	2025-04-19 19:56:39.71+00	2025-04-19 19:56:39.71+00	2	9	2	\N
10	566000	0	22000	588000	f	\N	2025-04-19 19:57:11.669+00	2025-04-19 19:57:11.669+00	2	10	2	\N
11	566000	0	22000	588000	f	\N	2025-04-19 19:57:23.803+00	2025-04-19 19:57:23.803+00	2	11	2	\N
12	566000	0	22000	588000	f	\N	2025-04-19 19:57:52.592+00	2025-04-19 19:57:52.592+00	2	12	2	\N
13	419000	0	22000	441000	f	\N	2025-04-20 07:07:47.641+00	2025-04-20 07:07:47.641+00	2	13	2	\N
14	419000	0	22000	441000	f	\N	2025-04-20 07:10:35.63+00	2025-04-20 07:10:35.63+00	2	14	2	\N
15	419000	0	22000	441000	f	\N	2025-04-20 07:12:57.91+00	2025-04-20 07:12:57.91+00	2	15	2	\N
16	299000	0	22000	321000	f	\N	2025-04-20 07:14:22.899+00	2025-04-20 07:14:22.899+00	2	16	2	\N
17	299000	0	22000	321000	f	\N	2025-04-20 07:16:22.658+00	2025-04-20 07:16:22.658+00	2	17	2	\N
18	299000	0	22000	321000	f	\N	2025-04-20 07:18:31.165+00	2025-04-20 07:18:31.165+00	2	18	2	\N
19	1132000	0	22000	1154000	f	\N	2025-04-20 07:25:00.957+00	2025-04-20 07:25:00.957+00	2	19	2	\N
20	566000	0	22000	588000	f	\N	2025-04-20 07:26:57.534+00	2025-04-20 07:26:57.534+00	2	20	2	\N
21	419000	0	22000	441000	f	\N	2025-04-20 07:34:21.993+00	2025-04-20 07:34:21.993+00	2	21	2	\N
22	419000	0	22000	441000	f	\N	2025-04-20 07:37:09.223+00	2025-04-20 07:37:09.223+00	2	22	2	\N
23	329000	0	22000	351000	f	\N	2025-04-20 07:44:40.04+00	2025-04-20 07:44:40.04+00	2	23	2	\N
24	329000	0	22000	351000	f	\N	2025-04-20 07:48:27.7+00	2025-04-20 07:48:27.7+00	2	24	2	\N
25	299000	0	22000	321000	f	\N	2025-04-20 07:49:29.333+00	2025-04-20 07:49:29.333+00	2	25	2	\N
26	329000	0	22000	351000	f	\N	2025-04-20 09:16:35.107+00	2025-04-20 09:16:35.107+00	5	26	2	\N
27	329000	0	22000	351000	f	\N	2025-04-20 09:17:10.577+00	2025-04-20 09:17:10.577+00	5	27	2	\N
28	299000	0	22000	321000	f	\N	2025-04-20 09:31:23.776+00	2025-04-20 09:31:23.776+00	5	28	2	\N
30	299000	0	22000	321000	f	\N	2025-04-20 09:38:11.783+00	2025-04-20 09:38:11.783+00	5	30	2	\N
31	329000	0	22000	351000	f	\N	2025-04-20 09:43:38.177+00	2025-04-20 09:43:38.177+00	5	31	2	\N
32	359000	0	22000	381000	t	2025-04-20 09:47:43.954	2025-04-20 09:46:50.855+00	2025-04-20 09:47:44.656+00	5	32	2	\N
33	359000	50000	22000	331000	t	2025-04-20 11:17:51.732	2025-04-20 11:17:21.364+00	2025-04-20 11:17:51.733+00	5	33	2	\N
29	299000	0	22000	321000	t	2025-04-20 11:19:43.448	2025-04-20 09:31:54.386+00	2025-04-20 11:19:43.449+00	5	29	2	\N
34	329000	0	22000	351000	f	\N	2025-04-20 12:23:36.401+00	2025-04-20 12:23:36.401+00	2	34	2	\N
35	329000	0	22000	351000	f	\N	2025-04-20 12:24:03.654+00	2025-04-20 12:24:03.654+00	2	35	2	\N
36	329000	0	22000	351000	f	\N	2025-04-20 12:25:07.466+00	2025-04-20 12:25:07.466+00	2	36	2	\N
37	329000	0	22000	351000	t	2025-04-20 12:25:44.832	2025-04-20 12:25:19.515+00	2025-04-20 12:25:44.833+00	2	37	2	\N
38	658000	0	22000	680000	t	2025-04-20 12:56:27.474	2025-04-20 12:55:46.753+00	2025-04-20 12:56:27.475+00	2	38	2	\N
39	598000	50000	22000	570000	t	2025-04-20 13:38:32.42	2025-04-20 13:38:01.565+00	2025-04-20 13:38:32.421+00	2	39	2	\N
40	800000	50000	22000	772000	t	2025-04-20 13:50:48.658	2025-04-20 13:49:44.742+00	2025-04-20 13:50:48.659+00	2	40	2	\N
41	985000	50000	22000	957000	f	\N	2025-04-24 07:22:36.943+00	2025-04-24 07:22:36.943+00	9	41	1	\N
42	985000	50000	22000	957000	t	2025-04-24 07:30:30.991	2025-04-24 07:24:32.043+00	2025-04-24 07:30:30.992+00	9	42	1	\N
43	419000	50000	22000	391000	t	2025-04-24 07:31:56.509	2025-04-24 07:30:08.502+00	2025-04-24 07:31:56.51+00	8	43	1	\N
44	1499000	0	22000	1521000	t	2025-04-24 07:35:06.56	2025-04-24 07:34:23.871+00	2025-04-24 07:35:06.561+00	9	44	1	\N
45	566000	0	22000	588000	f	\N	2025-04-24 09:11:28.351+00	2025-04-24 09:11:28.351+00	10	45	1	\N
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
6	419000	2025-04-16 06:12:42.197	\N	6
7	566000	2025-04-16 06:14:35.517	\N	7
8	1453000	2025-04-16 06:16:23.019	\N	8
9	1499000	2025-04-16 06:18:02.008	\N	9
10	359000	2025-04-16 06:19:44.475	\N	10
11	383000	2025-04-16 06:20:59.885	\N	11
12	329000	2025-04-16 06:23:02.559	2025-04-20 13:00:51.184	12
2	299000	2025-04-08 08:14:27.7	2025-04-20 13:40:38.329	2
14	400000	2025-04-20 13:40:38.329	\N	2
13	400000	2025-04-20 13:00:51.184	2025-04-20 13:52:43.942	12
15	500000	2025-04-20 13:52:43.942	\N	12
\.


--
-- Data for Name: product_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_embeddings (product_embedding_id, embedding, product_id) FROM stdin;
5	[-0.031115703,0.07228415,-0.106388554,0.043647055,0.00306061,0.020159692,0.09521165,0.027221834,-0.005387294,0.027901523,0.019218389,-0.112000264,0.0018563436,0.0488095,0.0030558778,0.029106725,0.08257167,0.024552858,0.0022377793,0.013706387,-0.08618785,0.035027336,0.0043110363,-0.002094307,-0.04195081,0.02590925,-0.035425663,-0.022206582,-0.06656269,-0.07735975,-0.014562547,-0.05518462,0.021434372,0.028155526,0.0017880236,-0.060415175,0.016916232,0.13987748,0.012555221,-0.054061644,-0.020663274,-0.002142569,0.020796468,-0.04018836,0.054942742,0.0017032463,0.030149398,0.064522564,0.028236946,0.04097699,0.011436725,0.006963127,-0.091682926,0.012873764,0.053312507,-0.044712283,0.00060789695,-0.014268721,0.08004165,0.019581387,-0.009964154,-0.016231306,-0.02911001,0.0404317,0.061204888,-0.089236416,-0.056126866,-0.008785498,-0.041533243,0.038721927,-0.033809442,-0.017733024,0.06709637,-0.027331105,-0.037634276,0.010366075,0.10154866,0.037961185,0.048828386,0.010895335,0.023621531,-0.024475783,-0.04513793,0.051071163,0.0167029,-0.015936036,0.0423831,-0.023516996,-0.020003125,0.008048889,-0.078154236,0.027681101,0.018993001,0.037304677,-0.09866143,-0.02121924,0.003926739,-0.03595198,-0.0914941,0.25986558,-0.029016964,-0.0301425,0.03798526,-0.012666466,0.08355493,0.014381395,-0.019502316,0.0054552504,0.0525549,0.05115426,0.018647771,-0.026544923,-0.11564076,0.00432168,0.11497012,-0.01064604,0.021167176,0.032452904,-0.01603424,0.0944779,0.06268823,0.076284,0.008761549,0.010221969,-0.0072799483,-0.06711905,0.045354232,-5.1472833e-33,-0.05274931,-0.09021515,0.06404277,-0.024035083,0.03231217,-0.015459583,0.017687775,0.024408076,0.036328763,0.03152721,0.02706811,-0.044840857,-0.071060844,0.06081146,-0.030867783,0.08545552,0.021850046,-0.050776273,-0.026444802,-0.060615387,-0.09595441,0.011948198,0.0118841035,0.035735965,-0.027338922,0.00085013744,0.021897756,-0.093343616,0.096996784,0.023238491,0.0424502,0.074320704,-0.00046422743,-0.0070514674,0.04297516,0.016341709,0.039555565,-0.10292211,0.012693045,-0.009996685,0.004242249,-0.029532608,-0.001231707,-0.011501808,-0.025902377,-0.013002655,-0.027488058,0.01624502,-0.07353523,0.07590172,-0.004567293,-0.05945683,-0.067214765,0.021617364,-0.08331151,-0.026029097,-0.029709453,-0.0069855293,0.025664361,-0.015536498,-0.020079242,-0.015249678,-0.053062025,0.050366603,-0.00695169,-0.07905177,-0.004158168,-0.051272724,-0.00851935,-0.067158565,-0.0077539883,-0.039077368,0.10921228,-0.043081403,-0.016350068,0.018313551,-0.007555513,0.074705236,-0.064942606,-0.0027752153,-0.046365835,0.0894124,-0.01209092,-0.040578436,0.018526977,0.028221827,-0.102295734,-0.070762336,0.06795869,-2.4033466e-06,-0.021247335,-0.079932235,0.054541957,-0.015980044,-0.053902104,3.436758e-33,-0.06376286,-0.045281243,-0.021774549,0.043939915,0.12691003,-0.008611042,-0.12020278,0.045832694,-0.045076776,-0.03190971,-0.06129435,0.0029695074,0.0051841494,0.0638937,0.058803964,-0.00972761,0.031067504,-0.012976454,0.015443088,0.039650466,-0.006642382,-0.07527281,-0.04358823,-0.03307824,0.0029833785,0.049178787,-0.049766816,-0.016604112,0.028110355,0.00966607,-0.10917828,0.06274933,0.011362723,0.04222297,0.018765371,0.14383471,-0.030122185,-0.03611486,-0.021222137,0.032415412,-0.009015063,0.028820772,-0.024347443,0.07439961,0.03813218,0.013402507,0.059015572,0.08467386,0.025603844,0.1115872,-0.035668906,-0.011756397,-0.049935866,-0.043635316,-0.053453144,0.039308965,0.017147169,-0.060797095,-0.0027391743,-0.01163686,0.028110586,0.029075267,-0.041551612,0.009573736,-0.07064317,0.06790366,-0.054612182,0.027230915,-0.041912723,-0.04094825,0.008865465,-0.016495077,-0.017981388,-0.032453597,-0.036470808,0.009567278,0.037783932,0.029564966,-0.05345302,-0.04670081,-0.03349573,-0.009267942,0.010236081,0.10957913,-0.00913925,0.036869694,0.049150106,-0.022823665,-0.0006595467,0.004622467,0.0264094,0.021800397,0.08342987,-0.034040455,-0.054692578,-1.1962736e-08,-0.068481565,0.015895903,-0.03833171,-0.061045174,0.07435671,0.094246626,-0.03667804,-0.009494811,0.068623334,0.055429228,0.030179625,0.021368554,0.014376987,0.0061191344,0.020571562,0.03498421,-0.0112459585,-0.0730364,-0.030790096,8.463913e-05,-0.084109806,0.04203667,0.029912928,0.0014928693,-0.005495275,-0.023829367,-0.10482728,0.030382358,-0.022736691,0.119543225,-0.0005625575,0.14491454,-0.09116918,-0.04015874,-0.013110288,-0.034736536,0.08847141,-0.017164176,-0.009903389,-0.047842123,0.02129885,0.06486193,0.006834626,-0.037002858,-0.01825222,0.0018945584,0.058255803,-0.11133324,-0.048167173,-0.08254139,-0.07651462,0.046591192,0.032249898,-0.019351538,0.021261059,0.0038181373,-0.021939471,-0.018282112,-0.051854108,0.03037016,0.12141623,0.023353526,0.049209353,0.06536158]	2
6	[-0.016400883,-0.008609628,0.022247909,-0.0710979,-0.09926137,0.032137666,0.03323109,-0.037878886,0.04998749,0.0426789,0.12212531,-0.059770238,0.0077975257,-0.0781779,0.005455822,-0.0027765085,-0.04796766,0.078931905,-0.0901119,-0.08439725,-0.04898939,-0.050122913,-0.03400312,-0.0140001215,-0.06711596,0.094595246,-0.022920193,0.057081793,-0.06561476,-0.013073675,-0.031384815,0.13714108,0.016264392,-0.01840919,0.010459867,0.031166371,-0.01738399,-0.010883703,2.5164827e-05,0.019511048,0.025331337,-0.0020268552,0.010557132,-0.06729362,0.04329022,-0.015387498,-0.030117327,-0.01718796,0.05441139,-0.05669357,-0.046403572,0.126254,-0.031047856,0.108163215,-0.09648925,-0.017883755,0.026383907,0.061469834,0.03923987,0.013350316,-0.05675125,0.0051939134,-0.03388835,-0.014117966,0.04313707,-0.0275007,-0.07394706,-0.06740239,-0.026014706,0.119000025,0.0008139417,0.0019514733,-0.060120773,0.053717617,-0.06441171,0.059431188,0.015478354,-0.044773668,0.004384526,-0.04255109,-0.004092686,0.016070906,0.05955809,-0.07951987,-0.03906284,0.023559462,0.0028712635,-0.010940379,-0.023348492,-0.031807285,0.03498403,0.06348239,-0.0678561,-0.057370886,0.037221402,-0.04231855,-0.006425086,0.051197644,-0.047541253,-0.008740913,0.10654988,0.04260592,-0.021636693,-0.076041244,-0.036479127,0.06391573,0.10297667,0.031576965,0.023676656,-0.013056629,-0.08682493,0.0024752766,0.0062559606,-0.07231365,-0.014613984,0.018755918,0.029237876,-0.02553254,-0.015706938,0.09002568,-0.02539484,-0.053111758,-0.0535215,-0.003876334,-0.056160837,-0.110385366,0.032304,1.7316672e-32,-0.011213743,0.042516187,0.058545973,-0.102261506,0.08723859,-0.031093795,-0.022127682,0.002221505,-0.05586578,0.011429656,0.041853,-0.0876576,-0.04681405,-0.022386422,0.009908513,-0.058140628,-0.017070316,-0.092425086,-0.02617737,-0.007980578,0.029798394,0.0411107,0.024742136,-0.0214964,0.01174356,0.01622948,-0.017412212,-0.030273948,0.024031602,0.04562492,0.0003811383,-0.010292331,0.002488318,-0.06453805,-0.12357141,-0.016967833,-0.007163608,-0.0077868826,-0.0010910142,-0.015609107,0.03174982,-0.008534326,-0.019341322,0.022430407,-0.020277599,0.07611224,-0.01576905,-0.029086921,0.03370266,0.0047713234,0.027108012,-0.03974245,-0.09117835,0.03854507,0.07403894,-0.03782066,0.053324055,0.012116584,0.045008678,0.042501386,0.007057261,-0.0023985356,-0.00503312,0.06469836,-0.02045448,-0.016032226,-0.015099699,-0.047086876,0.05243829,-0.11685984,-0.08757371,-0.04357307,0.013839474,0.042654704,-0.0489451,-0.05243593,0.021134792,-0.046471182,0.023404121,0.005162933,0.06210091,0.011822541,-0.032580145,-0.042660568,-0.022161404,-0.022912098,0.0469851,-0.06535058,-0.09930017,-0.010433007,0.00988306,0.06782121,0.09862303,-0.031877752,-0.057665184,-1.4736326e-32,0.0148728,0.07139178,0.020296607,0.06546527,0.018473761,-0.013043029,0.04245437,0.019953271,0.066550285,-0.071603715,-0.00093709666,-0.08999051,-0.018562663,0.02768845,0.040368672,0.026279798,0.022376116,0.088541366,0.024704874,0.050723348,-0.008409848,-0.023710364,0.020318247,0.07343559,-0.041465215,0.03393994,0.02360099,0.050956093,0.05830498,0.052128397,-0.027869035,-0.095823936,-0.11966933,0.09376408,0.026549421,-0.06365921,0.054419313,0.0012191418,-0.076938495,0.0640669,-0.024496999,-0.014951523,-0.03336238,-0.010209777,-0.028168838,-0.021174721,0.111835584,0.050851073,-0.10386724,-0.030671075,0.076858446,-0.011300619,-0.07348854,0.043639854,0.0244483,0.021445472,0.013984121,-0.061777536,-0.07219613,-0.05637618,-0.05099456,0.041247897,-0.020521775,-0.08643699,0.078751825,0.03908947,0.09695242,0.026102524,0.017804226,-0.017526971,-0.15436414,-0.033382703,-0.052604392,-0.00710106,-0.0054264585,0.038386844,-0.035101797,0.042392056,-0.009065198,-0.01579792,-0.13761643,-0.022453122,-0.056806885,-0.0031582005,0.02293328,0.0973277,-0.011560134,-0.07065597,0.03197694,0.031826615,0.06949934,0.041110717,0.0484575,0.049914878,-0.030911362,-4.4347832e-08,0.022731883,-0.042110503,-0.0035130433,-0.0017554183,0.124958396,-0.013644102,0.030556133,-0.036847744,0.0081215715,-0.0106605105,0.1076875,0.034947753,0.0012846605,0.0043650144,-0.08707254,0.07337551,0.03344321,0.0005315589,0.0247233,-0.024023475,0.027247624,0.056140177,0.042149443,0.00011456473,-0.055735745,0.055937666,-0.06750614,0.04703094,-0.06510637,-0.0013284445,0.07021905,-0.03788802,-0.02557292,-0.059720557,0.08129602,-0.05522676,0.052003227,-0.032426767,-0.03594083,0.03281019,0.09738521,0.08503525,0.022236453,0.004993114,0.051669154,0.01750216,0.062382754,-0.009637138,-0.018093694,-0.025504505,-0.074241064,0.020506782,0.02923519,-0.026284473,-0.007847077,-0.023481857,-0.006438343,0.07965419,-0.025422443,0.0096068755,0.055234388,0.07449664,-0.09238695,-0.022877995]	2
7	[0.009901526,0.058095705,0.0432558,0.004091028,-0.047457084,0.025867764,0.07975478,0.0050921952,-0.0017302989,0.039251607,0.081602015,-0.065505825,-0.028170481,-0.052164823,-0.09548013,-0.018558435,-0.09418797,0.022159753,0.054605454,0.021624666,-0.0694252,0.0008442264,0.004385636,0.04225891,-0.04053706,-0.05035678,-0.005225049,-0.014038171,-0.0028677753,-0.097031884,0.008048802,0.008982375,-0.007037887,-0.06748998,0.031808995,0.047887072,0.044516787,-0.002801634,-0.101408295,0.03320115,0.020073375,-0.10598561,-0.033753853,0.016134223,0.04121165,0.004626025,-0.017733395,0.043928288,-0.04046473,0.035501037,-0.059515473,0.041294914,0.0030613663,0.012567768,-0.011514873,-0.035426304,0.07532218,0.046196233,-0.028038781,0.025119744,0.030706443,0.040928196,-0.07548079,0.029401956,0.022901943,-0.025210202,0.077635154,-0.016791718,-0.06680865,0.03390536,0.057509355,-0.090723075,-0.025682162,-0.06283007,-0.0047100447,0.026951307,-0.014552177,-0.033626385,-0.027867146,0.0023076728,-0.08866035,-0.06663179,-0.044428587,0.023871575,0.010758241,0.04643526,0.030750297,-0.055332724,-0.018024042,-0.06253221,-0.054112814,-0.042283304,-0.047496933,0.007128904,0.008346917,0.06431551,-0.010518525,-0.02036965,-0.11844278,0.046227288,-0.015078874,0.082607105,-0.034237176,0.08453422,-0.035941675,0.0673406,-0.06317322,-0.035409834,0.011183018,-0.040793072,0.014345342,-0.05555488,0.06855312,-0.013801346,0.049901042,0.02187072,-0.023651572,-0.04849501,-0.0034169748,0.021586154,0.07173831,0.048048183,-0.08847476,0.024856823,-0.00017232155,0.022447664,0.019601071,-1.4217854e-33,-0.009430527,-0.0018234869,0.016022788,0.035432264,0.024845997,-0.056424215,-0.08888337,0.05388056,-0.065263115,-0.028322294,-0.010635905,-0.09651117,-0.026745996,0.030095406,0.065523684,-0.03450728,0.16828038,-0.07382668,0.0882239,0.020738946,-0.06973378,-0.030548621,0.017925555,0.023744348,0.09136679,-0.0004338313,-0.00469393,-0.014114899,-0.1038162,0.07304545,-0.04431857,-0.03835491,0.040448956,-0.016755642,-0.048649598,-0.13788615,0.025659295,0.039876,-0.015773183,-0.010181572,0.007499169,0.03866827,0.053151578,-0.041983716,-0.045259465,0.022836462,-0.009402377,0.006193518,0.08343636,0.050280772,0.03867778,-0.024433088,-0.08062882,0.027184876,-0.019017445,0.0283678,-0.038966693,0.07378522,-0.037772052,0.056306828,0.08391782,0.050801367,-0.052081,0.04286591,-0.07594354,-0.020559924,0.030791953,0.025504746,0.006166098,-0.058478013,-0.13831648,0.026312103,0.07916502,0.014065137,-0.053218767,0.010811661,-0.059135985,-0.017925464,0.07531748,-0.0154953515,0.07399168,-0.01826769,-0.015633719,-0.0005099778,0.023849752,0.010986608,0.029774038,-0.017932553,0.005795476,0.050803386,-0.001184893,0.0075350287,0.15162624,-0.08091697,-0.091499925,-8.721852e-34,-0.0259632,-0.017392922,-0.041883584,0.007151692,0.0928872,0.0674492,-0.054284096,0.036508515,-0.06098039,-0.03214,-0.02095451,-0.023828024,-0.0502351,0.06324742,0.13809285,0.03994568,0.11451957,0.0010390161,0.009451327,0.017088562,0.018773476,-0.104899146,0.018629616,-0.023014026,-0.055922505,0.023990532,0.030814027,-0.021253379,-0.06481835,0.08464758,-0.025236996,-0.06768397,-0.07902536,-0.0008322827,0.072808236,0.076915346,0.10064953,0.032911193,-0.029343342,0.035012398,0.047582865,-0.007013683,-0.034817528,0.04811292,0.043632895,0.012979859,-0.103843205,0.060744364,-0.04919134,-0.018821422,-0.011213848,0.006938348,0.104818456,0.03213267,-0.04370924,-0.04315066,0.011141159,-0.051269297,-0.085971,-0.018847961,-0.05368828,-0.038429312,-0.060195804,0.01767124,0.053001102,-0.03334354,-0.019973269,-0.04249576,-0.05394194,0.002237401,-0.005705191,-0.0018634102,-0.025180914,0.0029576519,-0.08357997,-0.051514916,-0.03262118,-0.0008197929,0.04448178,0.027094387,-0.04083301,0.019096226,-0.07970192,-0.016399788,0.011173048,-0.013240948,0.002115591,-0.033751003,0.02999469,-0.05564523,0.04273212,0.017854892,-0.04196856,-0.0361579,0.001216656,-1.604538e-08,0.085167184,-0.09019776,-0.029146608,-0.037316326,0.023558341,-0.025173565,0.0030937379,0.00402462,0.013486255,0.040705502,0.040740695,0.112198666,-0.0005034129,0.110407,-0.023228044,0.025129454,0.017071802,0.010561822,-0.017406918,0.029190062,0.059410583,0.025998836,0.0044646338,-0.10639387,-0.073090434,0.04026561,-0.08499115,-0.068311,-0.017493436,0.0016863957,0.062076002,0.055455565,-0.053721767,-0.030147618,0.034892663,-0.059027165,0.104204446,0.025295986,0.040606108,-0.014737806,0.06729175,0.077840686,0.04234829,0.035338614,0.13000363,-0.0068736086,0.033369664,-0.0053691915,0.046333693,0.03114579,-0.06526549,0.044874292,0.016920064,0.043936037,-0.012167994,-0.07914618,0.02105921,-0.009256108,0.01042191,-0.056431938,0.12301812,0.07393019,-0.008706728,-0.004313719]	2
8	[-0.095404685,0.1282641,-0.06441123,-0.039136365,-0.06347727,0.036073033,0.04437321,0.05639997,-0.028292386,0.03771104,0.042011857,-0.105361864,-0.03039874,0.00889063,-0.025619315,-0.0045031123,-0.06345993,0.07503103,-0.034182552,0.053128965,-0.05891047,-0.0026351672,-0.014698262,-0.028595438,-0.025091909,0.022202583,-0.01715446,0.02729354,-0.012413321,-0.026920106,0.009272162,0.08862501,0.014182729,-0.04183187,0.09032102,-0.0274762,0.036273997,0.026822085,0.031521257,-0.00083847274,0.0063824872,-0.013038816,0.03625537,-0.04504063,0.09756026,0.050432704,-0.011280301,0.026407424,-0.020121519,0.020515863,-0.08563682,0.022033999,0.004104186,-0.009180715,-0.009872928,-0.08791977,-0.007922649,0.027451154,0.021440225,-0.028904902,-0.007059597,0.02410617,-0.089015685,-0.04629774,0.055260714,-0.114836864,-0.030685509,-0.07892452,-0.072625935,-0.020688172,0.030281216,-0.052107964,0.022990394,0.0017845187,-0.08092517,0.029134024,0.031187197,0.02678439,0.09287817,-0.05895104,0.10973099,0.049128484,0.0012918424,0.057427097,0.012657357,0.01837328,0.024817979,-0.049541,-0.0024424968,-0.03365646,-0.010296936,0.016200293,-0.04373837,0.010251875,-0.036626585,-0.08729854,0.06001448,0.042305782,-0.024534097,0.15996483,0.00152966,-0.010342569,0.0033829801,0.041252743,-0.028127879,0.033298615,-0.006941965,0.09151866,0.042739294,0.042987615,-0.0082787685,0.020779656,-0.1061169,-0.11343588,0.1053612,-0.026378812,-0.037015297,-0.00636863,-0.03359162,0.00455136,-0.030709231,-0.009226611,-0.020111373,-0.021688737,-0.0077557354,-0.08352905,0.1158506,8.581919e-33,-0.050643295,-0.025479529,0.020498237,-0.03687393,-0.03337001,-0.027117115,-0.040723715,-0.03463454,0.04008705,-0.05960599,-0.0025347306,-0.02465897,-0.017014978,0.01621702,-0.052981276,-0.002582221,0.032815695,-0.08299701,-0.016215198,-0.020969894,-0.069251455,-0.014106708,-0.0015445118,0.022022452,-0.026408963,0.0038700963,0.037392233,-0.11103181,0.02770019,0.067173004,0.12518422,0.04319652,-0.020976165,-0.082516335,-0.09764949,-0.008613696,0.0007281427,-0.0586993,-0.0082722055,-0.09341955,-0.0017009598,-0.009744922,0.002999342,-0.0104613565,-0.015767409,0.021120807,0.025660066,0.0047161956,0.03545746,0.045706768,-0.07586518,-0.01769342,-0.11683599,0.018009158,0.0007538446,-0.039988905,0.00010383485,0.03467335,-0.0031009766,-0.03232426,-0.015670726,0.014920984,-0.04708916,0.044057585,-0.0045705093,-0.09124688,0.0134651065,-0.10799178,0.057554428,-0.021389956,-0.041465323,-0.023346145,0.08637405,-0.026769133,-0.12737392,-0.0034227485,0.012233702,0.06860371,-0.07090343,0.027587608,-0.046109237,0.05048502,-0.0089763515,-0.093369335,0.062265825,-0.0052412003,0.028195374,-0.090086214,0.06469917,0.019651929,0.029102335,-0.029054968,0.034711204,-0.017052878,0.03383375,-9.692106e-33,0.042288844,-0.023103423,-0.084926106,0.02889326,0.0021010612,-0.009155031,-0.119097844,0.011562865,-0.088960096,0.00128345,-0.030756207,-0.03424924,0.053133894,0.056447115,0.05416114,-0.028452527,0.09147787,-0.0045718867,0.0344455,0.032081466,0.006125861,-0.041841842,-0.0992102,0.029482113,0.017449804,-0.0037201915,0.0009899475,-0.035544965,-0.029643748,-0.014201872,-0.06880125,-0.021104172,-0.039931726,0.11204615,0.05661082,-0.09518907,0.14590652,0.017738406,-0.028972888,0.055487107,-0.05399809,0.016755404,-0.09386904,0.0240978,-0.024234446,-0.003941371,0.0051212376,0.037084382,0.011195902,-0.0030713985,0.1323687,0.0013072054,-0.023359356,-0.07552627,-0.007945667,0.009918932,-0.00068461406,-0.07654873,0.029556815,0.038733687,0.07049199,0.02093257,-0.038066264,0.041998442,0.033428993,0.053779434,-0.039136477,-0.0031839514,0.083579004,-0.06562449,-0.047680184,-0.07626789,0.08761895,-0.013141303,-0.04701422,-0.049883932,0.04811406,0.069208026,-0.0034331924,-0.017548896,-0.019336764,-0.035261896,0.004170326,0.054289863,-0.022301387,0.030205397,0.060709465,-0.018174756,-0.006868762,-0.00041147004,0.0560688,0.07955179,0.05400062,0.0053204517,-0.0456642,-3.3524255e-08,0.029686594,-0.06692598,-0.049603842,0.047301207,0.04268524,0.016788142,-0.04148312,-0.08549501,0.036554884,0.10661366,0.019949049,0.018517755,-0.059537813,0.042499214,0.0132685285,0.0319282,-0.0295895,-0.0076952777,-0.00629088,0.0103999255,0.04666099,-0.035080675,0.016901083,-0.019883377,-0.029707931,0.022867812,-0.0248095,0.024529511,-0.027661135,0.0061041014,0.00649169,0.15768068,-0.043589454,-0.01624559,-0.042658497,0.02681873,0.084852576,-0.020916043,-0.08153537,-0.055681184,0.054376476,0.014583553,0.0684543,0.0025932924,0.111281,-0.026941901,0.07840981,-0.08488926,0.019773716,-0.06505253,-0.1383106,0.020134838,0.044607,0.023835722,-0.035765454,0.062292535,0.02403867,-0.042729143,0.005854457,0.05314791,0.063567534,0.03492365,-0.011563843,0.017001003]	2
9	[-0.14032274,0.08137949,-0.06672361,-0.08262005,-0.08643784,0.063144915,0.05825789,0.08227816,0.024162311,0.009078785,0.050576106,-0.10809407,0.014301802,-0.04430322,0.006828288,-0.017812472,0.0051751113,0.08794678,-0.0027738898,-0.10820216,-0.07787232,-0.10346034,0.015363736,0.0042474167,-0.09441402,0.02072956,0.067364685,0.081995144,0.023175469,-0.10323763,0.0099070715,0.13584027,-0.0034798344,0.018757658,0.084237255,-0.012919431,-0.021836946,-0.05656527,0.007669918,-0.07319395,-0.017911451,0.02161834,-0.0015307446,-0.079212405,0.11116544,0.024624433,-0.04659042,-0.018468738,-0.005000101,-0.060107,-0.014358983,0.018394653,0.070379406,0.03738084,0.034004103,-0.020059858,0.067664355,0.022381822,0.057503305,0.020430403,0.010980407,0.01584895,-0.025006698,-0.025894407,-0.008971424,-0.070689976,-0.05448114,0.031556685,-0.0323514,0.047796372,0.090806246,-0.02284834,0.015505601,0.024999738,-0.015991028,-0.015882336,-0.0030399882,0.007936993,0.001727377,-0.028448168,-0.034482736,0.017487464,0.018252548,-0.05029222,0.003800525,0.039063208,-0.04835027,0.024257615,0.036417764,0.04540123,0.0038628117,0.057151083,0.0072327,-0.010993074,-0.05770137,-0.0011504298,0.013387715,-0.08366697,-0.066225275,0.10297073,0.052658007,0.100011945,0.05716872,-0.0066069555,0.006832943,0.0014397041,0.103624605,0.029932445,0.020972947,0.019632682,-0.036038358,-0.0344033,-0.042215344,-0.072101735,0.012973017,-0.07997316,0.0059429808,0.018969713,-0.022112593,0.019425662,0.050051894,-0.023785397,-0.089286156,-0.033008423,-0.030518807,-0.005829953,0.052292995,7.7759025e-33,-0.021569224,-0.043991294,-0.009573026,-0.0122970035,0.010820713,-0.036968164,-0.03322846,-0.050219018,-0.025400762,0.005067481,0.006983559,-0.11316958,-0.05490345,0.0004807657,0.013476501,0.066428065,-0.048268095,-0.03243088,-0.04487109,0.007752334,-0.025874063,-0.016686495,0.01185801,-0.018546699,0.084509365,0.08972796,-0.0064052497,-0.11433138,0.048929792,0.053878304,0.009504186,0.016803209,-0.039993454,0.029280046,-0.05768656,-0.019502068,0.0048963963,-0.060986318,-0.005622807,-0.018859109,0.16319852,-0.07823191,-0.09221617,-0.028602762,-0.018446812,0.039395962,0.06332911,-0.016570691,0.06070505,-0.03675034,-0.011816463,-0.013220271,-0.1197511,-0.04229134,0.043270346,-0.06450499,0.015087789,-0.029085608,0.051982407,0.016685816,0.037046846,-0.01047099,-0.09938834,0.032432653,0.021200025,-0.062253144,0.021798275,-0.08045897,0.036762487,-0.065818906,-0.02910193,-0.13482976,0.014274891,0.022637784,-0.03590385,-0.022213716,0.0026995116,-0.012783397,-0.040243577,0.070466764,-0.010453609,0.022846308,-0.043807276,-0.025492884,0.05509435,0.096604474,0.025765736,-0.091570444,0.06540924,0.08825706,-0.016263,0.011589778,0.03573884,0.01944857,-0.0253814,-7.3957785e-33,0.00040684416,0.02728872,0.02845548,0.04826448,0.049494773,-0.0761396,-0.028212935,0.036603756,0.08616551,-0.033506557,-0.00082115916,-0.034155287,-0.0057462873,-0.026286246,0.09653122,0.116689876,0.044788405,0.09083456,-0.026749194,0.012583161,-0.04039354,0.018770583,0.026861103,0.102623135,-0.0861043,0.035850897,0.043137502,0.056352325,0.014511016,0.077929944,-0.012165685,-0.09293137,-0.025561476,0.10159324,-0.03206936,-0.07352057,0.010308894,0.016070185,-0.009047237,0.03899083,-0.023416258,0.014223027,-0.02908581,0.04708443,-0.02775774,-0.07825016,0.042310346,0.014203949,-0.017989088,-0.038624935,0.07179981,0.058900423,-0.064850554,-0.023978263,0.016979733,-0.006295097,0.027548002,-0.11865122,0.018332867,-0.026662903,0.06558608,0.028369302,-0.00094752095,0.009868677,0.013099144,0.03147723,0.04226912,0.03244583,0.005954192,-0.049972627,0.004673832,0.036211073,0.047319543,0.01613225,-0.08296477,0.043890137,-0.0815136,0.13579959,0.074559316,-0.019345712,-0.057503555,-0.0133741535,-0.058419857,0.049362242,-0.01526514,0.009583733,-0.030779984,0.015384168,0.04718965,-0.03907273,0.059814814,0.023375588,0.042467367,0.07091181,-0.04478625,-2.507825e-08,0.014447688,-0.10227071,-0.026691347,-0.047351558,0.059620235,0.0023950438,-0.030322388,-0.04935589,0.050834883,0.03690656,0.066337086,0.067161575,-0.01413752,0.039851923,-0.07596339,0.104812376,0.00045886377,0.03951182,0.021272847,0.012809279,0.041521717,0.015783563,0.0017111244,-0.053622622,-0.026729116,0.020187633,-0.1060537,0.04983921,0.01280494,-0.014900383,0.045789033,-0.0050579696,0.04416571,-0.042332627,0.08441008,-0.046021506,0.056356847,-0.03209738,-0.028797906,-0.029684206,0.061767112,-0.008286551,0.040190645,-0.042620685,-0.1021894,-0.041643895,0.028769737,-0.08315849,-0.037041306,-0.04360979,-0.1025196,-0.04173199,0.019985283,-0.0139082605,0.018819936,0.025135808,-0.014159196,-0.006768756,-0.044596456,-0.025902169,0.027803048,0.014622826,-0.02731011,0.0019187944]	6
10	[-0.09827544,0.09303674,-0.029625857,-0.017355638,-0.011681179,-0.009462471,0.06748801,0.023728164,-0.040336642,0.0052385307,0.022070969,-0.03889043,0.061557975,0.022150595,-0.03268522,0.0013568699,0.08429478,0.06360428,0.016069323,-0.03431002,-0.031276226,-0.08857678,0.023733467,0.023057897,0.016996829,0.054095164,0.017371703,0.034347028,-0.020051228,-0.074071005,-0.043624073,0.0652183,-0.044605263,0.018676989,0.06599975,-0.03435378,-0.007205227,-0.054991625,-0.042118795,-0.14209783,-0.07434835,0.037262496,0.014696364,0.01662975,0.0829086,0.0713407,-0.0061183716,-0.038249794,0.039520714,-0.0034175029,-0.013982302,-0.040037647,0.046694536,-0.0014953464,0.057544593,-0.02092082,-0.0016433143,-0.016924758,0.08308719,0.029372066,0.011957733,-0.03577737,0.0016420963,0.032200437,0.0620571,-0.06849083,-0.029804464,0.05334548,-0.06285714,-0.010217747,0.034291014,0.018599432,0.14109915,0.00038827836,-0.008828522,-0.04222801,0.014267948,-0.034415003,-0.038267367,0.058671746,-0.04015427,-0.053363353,-0.061538134,-0.018274883,0.039022446,0.067107394,0.020510387,0.02817956,-0.036193024,0.07166771,-0.041188788,-0.00020629291,0.07495697,0.08739441,-0.11207683,-0.006411679,0.059784967,-0.056080084,-0.06268937,0.15880741,-0.021678641,0.039591353,0.08795227,-0.09144471,0.06667628,-0.00028005496,0.0003011122,-0.011356985,0.044036265,0.044317067,-0.040925547,-0.066600405,-0.059889965,0.013636884,-0.022037288,-0.0335378,-0.0067780884,0.018601548,-0.01163749,0.07637762,0.12955937,0.012876062,-0.000120527875,-0.000111656416,0.032687455,-0.057173572,-0.019154279,-1.348699e-33,0.0033165524,-0.033061232,-0.005123491,-0.008273544,0.013674392,-0.045722373,0.058292948,-0.031009465,-0.09605738,0.068176076,-0.028032534,-0.011474978,-0.1100953,0.031188773,0.04337745,-0.0025755626,-0.105162956,-0.07222215,0.005860601,0.075504296,0.018939668,0.04382437,0.0043016453,-0.00029048062,-0.009351579,0.05044981,0.019408787,-0.061440095,0.007577983,0.07156393,-0.00815664,0.028591443,-0.04781461,0.038726762,0.06888241,-0.046313614,0.013360318,-0.101246975,-0.029394902,-0.015994398,0.05157015,-0.046221174,-0.13945678,0.02346582,0.056833856,-0.023857227,0.07795232,0.014607467,0.0060551306,0.014558596,-0.059540536,-0.0071259006,-0.012103413,-0.049884595,-0.033696346,-0.08036131,0.0135260215,-0.05464764,0.0036065737,0.0036574882,-0.026036397,0.058422543,-0.051742367,0.05007792,-0.027497046,-0.010624109,0.04023994,-0.009290568,0.02209697,-0.028308121,0.03317922,-0.042250425,0.03985175,0.0016728386,-0.008244159,-0.06818084,-0.04925681,0.07450638,-0.10155803,-0.0010938223,0.03598998,0.033200968,-0.06300854,0.033944108,0.059192188,0.09053526,0.012393187,-0.04281042,0.0042702667,0.022377387,-0.03723395,-0.07072021,0.033034537,-0.010021275,-0.0033456422,8.944859e-34,-0.006029618,-0.059041668,0.05261347,0.03744077,0.062057458,-0.057505537,-0.05180287,0.042259976,-0.009836575,0.04146707,-0.017696511,0.015603022,0.016988354,-0.0108179385,0.06757751,0.043149423,0.04975376,-0.0150701655,0.033146862,-0.04361591,-0.03482867,-0.06991729,-0.084592074,0.05089638,0.008246458,0.060587578,-0.016055137,0.0018400295,0.0029994855,0.072697446,-0.021964297,-0.041800708,0.044339456,0.07956006,0.031641744,-0.010985639,-0.08624953,0.021823434,-0.017979745,-0.100025676,-0.009955682,0.0049527837,-0.07597141,0.08108456,0.026371103,-0.049392555,0.003961026,0.054374535,0.10018386,0.015730482,0.011471342,0.05574394,-0.004604418,-0.16433202,0.022969568,-0.006818107,-0.021630937,-0.033208504,0.07656342,0.030798744,0.101969264,-0.023974037,-0.004282637,0.08164342,-0.04560824,0.0045159045,0.048907384,-0.0035452375,0.0010678956,-0.011575435,0.034407724,0.11143891,0.036293585,-0.048950102,-0.058268405,-0.027325893,-0.024859838,0.11554542,0.045733083,-0.039713968,0.018715777,0.012685542,0.016884074,0.10863647,0.016242262,0.032619808,-6.62162e-05,0.0690629,-0.03406012,-0.040645577,0.035071228,0.07488672,0.011366789,-2.698094e-05,-0.088215806,-1.2232051e-08,0.011119726,-0.0056268573,-0.0727456,-0.087459095,0.018379563,0.03264822,0.004843078,-0.0111700455,-0.009801305,0.007942927,0.10773784,0.08115572,0.011871368,0.075018734,-0.016355863,0.035931863,-0.009257952,0.024545003,-0.0023730367,0.040239453,0.014085671,-0.0043399422,-0.028273555,0.007147099,-0.07052259,-0.0044658408,-0.06614919,0.014284706,0.09038641,0.010216353,-0.010362612,-0.027296873,-0.020479042,-0.060221948,-0.017531047,-0.033140127,-0.058325384,0.028063819,0.015687061,-0.08056592,0.02168462,-0.06024712,0.06727091,-0.041032754,-0.15504733,-0.029841747,-0.022060921,-0.15340942,-0.030300193,-0.06534832,-0.009789156,-0.017551757,-0.07642398,0.028984945,0.08727048,0.08975481,0.030751878,-0.030184854,-0.042832814,-0.043810356,0.039569344,-0.023486124,0.005733708,0.08794368]	6
11	[-0.076538,0.0104834,0.010868099,-0.076737456,-0.0837952,0.024007007,0.027276838,-0.02008493,0.057172675,0.013169113,0.1474641,-0.0709511,0.060671203,-0.04677215,0.020233767,-0.0061218413,0.0059214314,0.09288506,-0.08387128,-0.08605412,-0.03176352,-0.024864316,-0.00622182,0.037826695,-0.05865595,0.0813499,-0.034125812,0.08221457,-0.0412101,-0.06788683,-0.034658782,0.15959391,-0.025069866,-0.020428909,0.011031206,0.005856743,-0.016385447,-0.029420141,0.013577797,0.008296346,-0.03733352,0.029635182,-0.014031731,-0.046725858,0.10281427,-0.022442177,-0.055099618,-0.05206276,0.055113453,-0.08628885,-0.028418312,0.07355081,0.02164768,0.12289431,-0.07168304,-0.05386159,0.015517131,0.029404307,0.12743957,0.013392841,-0.05233119,0.015190638,0.00939516,-0.009334607,0.012504083,-0.031064594,-0.10991081,-0.07121367,-0.028132694,0.08853727,-0.008914356,-0.027534213,-0.087894954,0.079791225,-0.053627804,0.031102886,-0.024526387,-0.015219885,-0.028044714,-0.0340299,-0.014863908,0.020365868,0.08358517,-0.063066274,-0.036493044,0.058234394,-0.006702857,-0.004836956,-0.00094852725,0.00061874505,0.041482218,0.088613525,0.007878935,-0.018906776,-0.011184229,-0.07360489,0.026920976,0.010556921,-0.03270746,0.04419521,0.09456178,0.023234116,0.0039828867,-0.02820453,-0.016911667,0.005825175,0.13693622,-0.0049757264,0.026178539,-0.01316943,-0.07748045,0.014099862,-0.006262679,-0.12436647,-0.014525677,0.040985063,0.030364368,-0.015280648,0.0057334197,0.09216767,0.0206228,-0.009492998,-0.05713372,-0.0064150095,-0.0032347152,-0.06388261,0.03076169,1.8156223e-32,0.0031203858,0.020192947,0.028750964,-0.08788213,0.0905328,-0.030585775,-0.03245205,-0.049688414,-0.05282726,-0.0010707772,0.02275687,-0.079352535,-0.08048038,-0.025232144,0.046577387,-0.060646918,-0.014942732,-0.112800926,-0.0049083116,-0.00046490505,0.03702058,0.011327443,0.029025873,0.003607132,-0.004694647,-0.000977303,-0.037666,-0.04439562,0.0129952505,0.04345188,0.04070358,-0.0064249756,-0.04255921,-0.08552437,-0.10805938,-0.017927196,0.020744704,-0.031743802,0.002781477,-0.00047705875,0.043180544,-0.032431655,-0.07955707,0.0059517967,0.03794538,0.049178164,-0.0021364235,0.0033882167,0.024833689,-0.01710017,-0.0025000405,-0.011535325,-0.096823566,0.04017498,0.073931254,-0.013073673,0.034797546,0.008126119,0.028807834,0.034635536,0.0024013373,0.010752733,-0.016222129,0.032466345,-0.00068160397,-0.031360697,-0.008527273,-0.047928073,0.044472653,-0.108907945,-0.07902181,-0.075366065,0.025399135,0.03443719,-0.032990288,-0.088603966,0.0030937456,-0.014288062,0.010901794,-0.0065243794,0.036347687,0.0071324087,-0.03214319,-0.010192319,-0.016439205,0.032069422,0.06368575,-0.08940359,-0.040349793,0.023549562,-0.047560606,0.04728082,0.09024321,-0.0052046753,-0.05401842,-1.5146672e-32,0.027171748,0.06799657,0.018810686,0.065585755,0.03819618,-0.046679582,-0.01778219,0.0068131546,0.075081326,-0.06601187,-0.012527734,-0.019561945,-0.018785693,-0.00068982976,0.009359926,0.05973057,0.014892837,0.071869746,0.014592056,0.047230262,-0.05645645,-0.034166798,0.024413377,0.05396683,-0.047833398,0.07232153,0.059800755,0.054796893,0.090502486,0.06499228,-0.02619215,-0.06384298,-0.11597303,0.0716862,0.010252595,-0.048110083,0.005681871,0.010707489,-0.05566991,0.047027484,-0.040333774,-0.01744181,-0.026869215,-0.05214509,-0.021804798,-0.030962493,0.12973492,-0.0046612066,-0.06463706,-0.040403485,0.09801924,0.039662406,-0.078971975,0.04251122,0.011452819,-0.0039408854,0.020544425,-0.07578218,-0.05547334,-0.075462565,-0.021880671,0.062006943,-0.004994114,-0.055944424,0.08877964,0.013592508,0.045364466,0.04513128,0.057901382,-0.044799518,-0.11489287,-0.017070662,0.0057601887,-0.036325432,0.021587525,0.051175904,-0.039791964,0.034507636,0.00966945,-0.040641256,-0.13078459,0.034824573,-0.07973472,-0.0068503926,-0.010937755,0.08032837,-0.08422541,-0.010069389,0.054264504,0.02215345,0.05967759,0.013176312,0.050502747,0.04454339,-0.0041804938,-4.650671e-08,0.01150639,-0.05538959,-0.0015612383,0.022968808,0.11984655,0.005130147,0.01476832,-0.081665695,-0.01419138,-0.004719084,0.11607247,0.11061516,-0.0107163,0.011479381,-0.09751108,0.10329094,0.05260684,0.039100535,0.034239985,-0.021279927,0.016205387,0.03816241,0.044128846,-0.038886648,-0.07379974,0.017921729,-0.08193087,0.05173467,-0.062679,0.016323084,0.05460262,-0.019259999,-0.02498964,-0.09566183,0.12485122,-0.059599414,-0.022629151,-0.005717888,-0.034317717,0.043379407,0.04630904,0.001936489,0.045845043,-0.025058003,-0.018995373,-0.0008190975,0.04335363,-0.012062941,0.023173593,-0.05169345,-0.02931601,-0.04098224,0.06102243,-0.011188543,-0.0072361804,0.044630595,0.0277613,0.019575093,-0.017979646,-0.027018972,0.041891374,0.020979485,-0.025873896,-0.009805436]	6
12	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	6
13	[-0.073337995,0.1060319,-0.075460784,-0.05822208,-0.07064011,0.081582315,-0.011922764,0.04769902,-0.043983527,-0.07556973,0.049919426,-0.13206898,-0.029770443,-0.032696884,0.003275328,-0.004327367,-0.050855007,0.06814179,-0.0119573595,-0.06009362,-0.016589973,-0.11884563,-0.022717552,0.028715529,-0.10173149,0.043313812,-0.0086795995,0.108178146,0.053661328,-0.12311537,0.047732808,0.14444183,0.017186737,-0.0010314038,0.038946796,-0.061077476,0.023676215,-0.081611164,0.03376063,-0.04630259,-0.041809477,-0.016827805,0.010946443,-0.04668357,0.08807122,0.031149166,0.0017587795,-0.005794842,0.010013289,-0.05943476,-0.079298966,0.024535881,0.016433781,-0.0034950653,0.06409372,-0.0010892755,0.059023146,0.0073883487,0.010288886,-0.07749533,0.06948296,-0.066349015,-0.0057210918,-0.025452023,-0.04471734,-0.042753126,-0.08584532,0.006962993,-0.0006710091,0.07211882,0.12851109,-0.034167845,0.00597992,-0.0010437663,0.030109957,0.00024169538,0.039610118,0.017175332,-0.026811365,-0.055045974,-0.025464758,-0.04295937,0.04383229,-0.087594196,0.009418725,0.03796253,-0.026003841,0.043513607,-0.007793392,0.023550708,-0.03584126,0.008349271,0.016094211,-0.04494691,-0.035898678,0.0037922391,0.014529169,-0.03395714,-0.026544575,0.07264506,-0.0008725282,0.07417529,0.0029351185,0.028320933,-0.043752067,0.05716328,0.029105565,0.08208163,-0.05459189,0.01632279,-0.017775796,-0.01378531,-0.0062610204,-0.09428993,-0.09982225,-0.040599555,-0.05871802,0.04065786,0.010619558,0.003399421,0.0239236,-0.03474063,-0.056244764,-0.03894171,-0.0030156784,-0.055244677,-0.011780586,7.548513e-33,-0.029441379,-0.024036879,-0.026194025,-0.026559768,0.011934549,-0.025123987,-0.0043047857,-0.017943146,-0.008460585,0.040186316,-0.044574954,-0.1026634,-0.06663863,-0.028503207,0.029028157,-0.02046581,-0.033855665,-0.060274795,-0.09464341,-0.06743352,0.056724224,0.01575537,0.02949528,-0.0029213498,0.11578791,0.112812005,0.020946842,-0.09485847,-0.013340441,0.08461138,-0.03828145,-0.0070691123,-0.052018084,0.027640797,-0.05298168,-0.010269246,-0.031500056,-0.0382941,-0.010050804,0.037549112,0.12592736,-0.051732875,-0.0772747,-0.04941215,-0.06668809,0.05266288,0.08472545,0.022362351,0.094312586,0.05830125,-0.056552794,-0.04317778,-0.085667014,-0.029385326,0.0272635,-0.04330557,-0.017533643,-0.0072048567,-0.05307193,0.052284457,0.033648033,-0.00816293,-0.06284842,-0.012060392,0.012733383,0.00097237714,0.023345169,-0.023586234,0.051376093,-0.006318973,-0.02610077,-0.09840663,0.07020175,-0.03407255,0.020603739,-0.014720358,-0.057095606,-0.075960524,-0.04760369,0.0017236393,-0.047672752,0.046160664,-0.06447516,-0.014331772,0.08405198,0.05011326,0.012163152,-0.011499612,0.027304552,0.049360763,-0.054001417,-0.04647252,0.06616146,0.02271127,-0.047447383,-7.4256955e-33,0.025310444,-0.008600546,0.11844048,0.05583093,0.042234063,-0.007866102,0.016371263,0.03808589,0.056333534,0.08006297,0.0001888465,-0.0123614,-0.026370876,-0.033391673,0.047751494,0.06493932,0.03354443,-0.0019352201,-0.007234009,-0.013787648,0.0021075953,0.035345614,0.026780723,0.095022954,-0.04364032,0.02195954,0.06848959,0.029000103,0.046137273,0.06788083,-0.012438371,-0.09121586,-0.0114996685,0.084564,0.010219374,-0.031789545,0.051367044,0.027097788,-0.022884436,0.047573943,-0.07026817,0.039769966,0.018543178,0.09690606,-0.007820934,-0.035650194,0.008341082,-0.02373691,0.047465328,-0.0076336847,0.10616771,0.0049534123,-0.032161545,0.023956876,-0.028237911,-0.019532602,-0.00496599,-0.036960095,-0.043915316,0.0011841141,0.11805593,-0.0168185,-0.018476149,0.0372406,0.0065349266,-0.06118981,-0.037020605,-0.0012052781,0.010620573,0.0015163494,-0.0066493517,0.026523821,0.009674778,0.052604005,-0.10988981,-0.010055522,-0.07515413,0.1180542,0.13590685,0.03557896,-0.008695179,-0.04247334,0.02436869,0.0595062,0.00211384,-0.017634885,0.005489628,0.019943843,0.0715532,-0.039737504,0.06359827,0.057198673,0.060098544,0.094020136,-0.061809298,-2.8389058e-08,0.053570017,-0.120764345,-0.068138085,-0.016770685,0.027284222,-0.036728714,-0.075871006,-0.0148645155,-0.016505372,0.03195362,0.067947775,0.05648376,0.016461832,0.033942156,-0.06663464,0.009533654,-0.042819902,0.08783289,-0.018708225,-0.04639755,0.042251125,-0.012694384,-0.017834945,-0.034292478,-0.021028355,-0.038350746,-0.08214368,-0.014232187,0.032363135,-0.015920656,0.029226018,-0.025695002,0.0753001,-0.006896959,0.07995629,-0.03577542,0.04545211,0.053433076,0.0014324125,-0.018532282,0.12063349,-0.039294425,-0.0065170885,-0.0036258127,-0.011570913,-0.06191617,-0.0024951533,-0.07629884,-0.08405453,-0.03385842,-0.041921858,-0.010270656,-0.041249786,0.032184623,0.01719133,0.06638678,-0.066741146,0.07152602,0.0053128973,-0.036607705,0.045851868,0.07051621,0.057548758,-0.022086455]	7
14	[-0.056515403,0.009685577,0.012228105,-0.07715576,-0.09600131,0.038330555,0.00042300296,0.018864667,-0.023767645,-0.027988957,0.095844194,-0.09522144,-0.0055558416,-0.06175277,0.011646182,-0.035944734,-0.002593238,0.07508294,-0.08457714,-0.072327465,0.0028089778,-0.07342136,-0.05254294,0.032906026,-0.04889616,0.06931572,-0.05873178,0.09144743,-0.008311706,-0.08683982,0.01170016,0.1809209,-0.015976291,-0.0017050967,0.07193096,-0.0220315,-0.038755123,-0.033144098,0.016262991,-0.032653127,-0.039410885,-0.057377245,-0.027027518,-0.037107088,0.09180046,-0.020591153,0.014063619,-0.024839533,0.032699745,-0.04654808,-0.0893308,0.09610509,0.023556095,0.05024474,-0.06370475,-0.048089057,0.04294854,0.023651732,0.039559618,-0.038888365,-0.014047119,-0.025203412,0.002040486,-0.022376286,-0.033544593,-0.034631032,-0.1018046,-0.038155723,-0.031622097,0.16194074,0.0956885,-0.0024847165,-0.04524503,0.09284642,-0.030537885,0.053901147,-0.012878029,-0.03261535,-0.012083189,-0.0146122435,0.00646598,0.019964442,0.08948393,-0.11712018,-0.048131607,0.032499034,0.0017556506,0.01256901,-0.04245486,-0.006707605,0.034165338,0.041602295,-0.00040841548,-0.020358955,-0.00822482,-0.03709165,-0.006413978,0.011439398,-0.033281885,0.021896746,0.04438926,0.041438125,-0.008746559,-0.0027859265,-0.08766462,0.06182834,0.069648705,0.048819598,0.023663409,0.005357491,-0.04447705,0.009021944,-0.03412514,-0.1107818,-0.11904371,-0.0061343424,-0.01145557,0.0043476447,-0.0057744295,0.06563514,-0.016877942,-0.043674335,-0.044264473,-0.021673607,-0.011237963,-0.11550826,0.01875342,2.3773602e-32,0.008831919,0.0041742525,0.012633372,-0.061438713,0.051529683,-0.008179266,0.021855783,-0.024293056,-0.082549855,0.018732958,0.026309531,-0.068366684,-0.1158498,-0.04733191,0.07005401,-0.005529752,-0.05272122,-0.11497544,-0.07041872,-0.021452596,0.05329292,0.03085715,0.069306225,0.021005588,0.019293843,0.024736261,-0.0057396065,-0.0718072,-0.030092636,0.06770888,0.003963251,0.007788494,-0.02941586,-0.06412165,-0.07748031,-0.013571516,-0.013767396,-0.036435653,-0.046006255,0.015094464,0.06401086,-0.034095876,-0.052948862,-0.010160198,-0.021745505,0.06491002,0.033258986,0.016419923,0.07626215,0.028548244,-0.022125497,-0.044953518,-0.09045277,-0.013965165,0.12249185,-0.03758778,-0.01293249,-0.016189339,-0.0035724363,0.042272236,-0.015500204,-0.02907554,0.0017228649,0.032441422,-0.079418264,0.033475958,0.025119225,-0.024440236,0.056212205,-0.03435495,-0.05602682,-0.1332129,-0.007708284,0.026314843,0.020376848,-0.055214785,-0.0009257947,-0.043454066,-0.035486132,0.008336254,0.015778424,0.041415706,-0.054228947,-0.0036388321,0.033971976,0.016149098,0.055137035,-0.029372636,-0.021420348,-0.004513351,-0.04376051,0.010510623,0.056926277,-0.015022741,-0.08531807,-2.0619476e-32,0.045840185,0.022273794,0.08513302,0.0866719,0.013870106,-0.044906735,0.037568368,0.01198115,0.12666516,0.020973705,-0.02853385,-0.02375479,-0.050042327,-0.005244299,-0.0016131,0.012299487,0.040061165,-0.022971293,0.008139679,0.0006058613,0.0015899931,-0.02086028,0.011954751,0.071106076,-0.05558866,0.00339061,0.03748363,0.05740844,0.0717871,0.037269145,0.0039197663,-0.07505289,-0.080011405,0.12762934,-0.0048120073,-0.06157547,0.049889524,0.02488945,-0.037767477,0.054175854,-0.076203145,-0.03110564,-0.04077162,-0.016248832,-0.03394782,-0.070992075,0.050045714,-0.020363092,-0.02202946,0.0020742377,0.12781556,0.04885565,-0.061994933,0.016638443,-0.03277445,-0.015400915,-0.025220277,-0.031263143,-0.06714871,0.0031802955,0.07588476,0.057957444,-0.0039270003,-0.025010893,0.041606158,-0.03642461,0.018639557,-0.00581565,-0.012880623,-0.017148862,-0.12347363,-0.017101279,-0.04350645,0.012633428,-0.029941829,0.021412116,-0.073707454,0.08520466,0.10120457,-0.023787042,-0.093383335,-0.02058212,-0.02332917,0.019971676,0.03061583,0.08410104,-0.027249105,-0.022299903,0.08922493,0.04512652,0.10655106,0.05651921,0.098534964,0.06891504,-0.030633027,-5.810513e-08,0.035511997,-0.048231397,-0.04737802,0.0073309843,0.06393726,-0.03634966,0.007513827,-0.017011026,-0.011673756,-0.0033663802,0.14340496,0.03932267,-0.0061139036,0.0012003127,-0.08229091,0.09339578,-0.02205848,0.035662886,0.0074496316,-0.03762387,0.047464415,0.050910253,-0.018716967,0.02108179,-0.06334971,-0.032844417,-0.08035576,0.027883502,-0.014937177,0.008595325,0.077718325,-0.05620214,0.062852144,-0.045388814,0.10273984,-0.082782924,0.02136493,0.019669969,-0.034761183,0.03373746,0.11694928,-0.02741853,0.020651055,-0.03797236,0.0045972858,-0.011977784,0.021605182,-0.054930367,-0.032762393,-0.01772586,-0.031215353,-0.017192112,-0.0028166466,0.047990978,0.02775241,0.044358663,-0.016728044,0.0667613,0.009113629,-0.014286031,0.06623196,0.036017213,-0.008192065,-0.014324273]	7
15	[-0.0935072,0.11781589,-0.03838722,-0.08990624,-0.043864485,0.06448523,0.024755238,-0.018773101,-0.038507707,-0.041638102,0.04077389,-0.111078225,0.030559368,-0.01799416,-0.024753405,-0.014560226,0.066564776,0.058143444,-0.070740774,-0.05853327,-0.036710016,-0.13715622,-0.009380269,0.03723173,-0.02217611,0.054639645,-0.06633359,0.02124165,-0.012631704,-0.12245546,0.023665264,-0.0160453,-0.046571385,0.029907398,-0.014236431,-0.039361663,0.04921992,0.0068766777,0.009740894,-0.05340389,-0.027835572,-0.059777502,-0.010253239,0.058575764,0.064183176,0.012135758,0.047721945,-0.036301125,-0.022157839,0.0248587,-0.04850866,-0.002393328,0.049465217,-0.08618968,0.0712218,0.0019263091,0.07712242,0.0018036029,0.043710973,-0.034142237,-0.018886844,-0.046445273,0.022260321,0.004814833,-0.022456814,-0.093727805,-0.018767983,0.13416983,-0.0140467845,0.06628507,0.029015724,-0.012468305,0.11847853,0.03802282,0.05468525,-0.0018187234,-0.020003382,-0.02361872,0.003084238,-0.0029730753,-0.029377067,-0.13402362,-0.06561096,-0.039707445,0.023711419,0.056796346,0.042446077,0.024981564,-0.024042638,-0.029692087,-0.04762907,-0.011523717,0.08900093,0.07066499,-0.018817822,0.048210323,-0.03329484,-0.11136229,-0.07731998,0.11234714,-0.048403442,0.009841855,-0.019176668,0.044438977,0.065970935,0.012534916,0.050228443,0.073773354,0.047271796,0.050355274,0.037170503,-0.04775613,-0.037841644,-0.014773882,-0.10270629,-0.026039533,-0.064056545,0.05413481,0.088514045,-0.02784493,0.07120787,0.012365186,0.007745424,-0.013913183,0.04967454,-0.08295706,-0.00906155,-1.7997957e-33,-0.047958877,-0.057086296,-0.006909417,-0.0089470465,-0.013531716,-0.018906841,0.024431126,-0.0074870847,-0.040413745,-0.018299282,-0.07162755,-0.07979567,-0.06782624,0.022210559,0.007539142,0.0022174243,-0.06992591,-0.048529867,-0.015309472,0.012393944,0.02717314,0.07857116,0.006166622,0.045260727,0.03558596,0.032278687,-0.016083604,-0.049536377,0.06762552,0.063605405,0.03777945,-0.027287219,-0.033778705,0.033954684,0.031358533,0.107434995,-0.010856482,-0.09438517,0.020925205,0.07202106,0.005468032,-0.09865012,-0.10991469,-0.0058691436,-0.06528928,0.015736291,0.04399642,0.033907235,-0.043089904,-0.008556869,0.008422849,0.017599134,-0.079037115,-0.052919663,0.04735597,-0.08959457,-0.0050174217,0.013877779,-0.0045707347,0.06717452,-0.04043273,0.06015839,-0.03361451,0.04617563,-0.055534545,-0.018961025,0.03435409,0.007356869,0.044620495,-0.018836034,0.008508281,-0.06500525,0.030348284,-0.054997616,0.044626698,-0.07411655,-0.021839686,0.0595691,-0.11291692,-0.0024779686,-0.019569758,0.079956025,-0.038989518,-0.034493104,0.04397013,-0.023593957,-0.0138456095,-0.01764718,-0.011754264,-0.030390846,-0.0067031365,-0.07184949,0.03347137,0.065283895,-0.053690948,1.7756467e-33,-0.00051881035,-0.0762261,0.111751825,0.055091042,0.07533628,0.0074024284,0.035778187,0.05627482,-0.0024083126,0.10129449,8.801526e-05,0.016869731,-0.06065717,-0.033740804,0.096976005,-0.03566926,0.070161745,-0.01165928,0.041794967,-4.748523e-05,0.03162157,-0.0061685964,-0.052082576,0.059143383,-0.0035617533,0.01834212,0.026144302,0.014188375,-0.030949315,0.006955472,0.009995532,0.010523136,-0.010042893,0.047695633,0.029385164,0.056221426,-0.07536017,-0.0009546001,-0.03177139,-0.05015284,-0.02356718,-0.034204897,-0.052602686,0.11305181,0.021322582,0.012362155,0.006517784,0.017410105,0.02814771,0.08010541,0.06026805,0.04238044,0.016324714,-0.047099702,0.029771762,0.019383535,-0.06513719,0.013875098,0.046856515,0.049268786,0.08435645,-0.061054874,0.008844921,0.12256832,-0.03764121,0.004715535,0.03183217,-0.02007416,-0.044174977,0.046787385,-0.026765928,0.10001091,-0.03500079,-0.010993383,-0.07529661,-0.060824275,-0.025879055,0.12914282,0.01742838,0.005139955,-0.06851451,0.045948103,0.08338555,0.062369745,-0.012956281,0.015146991,0.04719785,0.025376229,0.072346024,-0.01696779,0.09624749,0.011467741,0.056295518,0.009809641,-0.013642295,-1.1743697e-08,0.00033224648,0.0042498936,-0.077270836,-0.05580499,-0.015499776,0.09488449,-0.05542418,0.012207529,-0.007158198,0.038210686,0.109293565,0.04494227,0.011111249,0.006198123,-0.012380044,-0.00093818206,-0.056480266,0.005088537,-0.0033436518,0.010547729,-0.018646605,0.03808761,-0.0068872105,0.02266432,-0.055116232,-0.0057998938,-0.042293817,-0.0260809,0.07135511,-0.010811003,0.0359694,-0.0380267,0.030769946,-0.050224997,0.06667693,-0.02797661,0.0054569924,0.12816422,0.038019303,0.01924286,0.023227116,-0.03103689,0.02847288,-0.06281453,-0.02156366,-0.03113819,-0.06797243,-0.091050394,-0.05008388,-0.049904786,0.008564311,0.045674216,-0.10162686,0.016721098,0.0060341433,0.052275736,-0.049593456,-0.0383968,-0.048739057,-0.008276334,0.09693248,-0.009866162,0.11584036,0.03999342]	7
16	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	7
17	[-0.1297354,0.10881833,-0.004001036,-0.09689732,-0.09491632,0.0065049212,0.07091022,0.1009676,-0.04039014,-0.01936553,0.07570068,-0.07598978,0.023503976,-0.08199131,-0.037187006,0.0021276984,-0.052973025,0.038033087,0.0018899032,-0.045687255,0.029280137,-0.105300434,0.019070644,0.0008931649,-0.058061052,0.026555266,0.062199153,0.07010461,0.069091626,-0.11668881,-0.005472492,0.12504737,-0.013085206,-0.015180668,0.058051445,0.007072263,0.027029727,-0.105548136,-0.011790108,-0.082639605,-0.0032705532,-0.005945131,0.031258184,-0.08171603,0.059259973,0.08779403,-0.03658275,-0.05254439,-0.04672212,0.0066608377,-0.06880226,0.06489896,0.025960738,-0.041623008,0.024795271,-0.026705902,0.070344076,0.06592775,0.017787788,-0.029340014,0.026407704,0.0004695482,-0.005248468,-0.00041052848,0.024846103,-0.07294044,-0.037131548,0.012840375,-0.047519386,0.067389056,0.1226111,-0.046760842,0.019442178,0.014908617,-0.019230928,0.03534221,0.06000814,-0.034167103,0.0005756304,-0.02379462,-0.01390482,0.045450073,-0.0007642933,-0.080984846,-0.0066870195,0.02936341,-0.053976405,0.075167425,0.016414143,0.029128382,0.0020920276,0.04647903,-0.002660228,0.008710782,0.04304259,0.013791759,-0.008511919,-0.07691486,-0.031133622,0.047434714,0.017620591,0.0896615,0.10358232,0.04141104,-0.03287487,0.015286276,-0.009479546,-0.009871488,-0.011644458,0.0035101902,-0.053987436,-0.094905935,0.007378309,-0.08927416,-0.04220838,-0.06414027,-0.042650197,0.010759064,-0.04276174,-0.031905342,0.05190974,-0.07189072,-0.049946897,-0.032991238,-0.049717404,-0.06296394,0.0043687117,1.0420253e-32,-0.0609751,-0.018760417,-0.066748925,-0.056935206,-0.026356505,-0.07423945,-0.011760079,-0.008295528,-0.047022987,0.04991292,-0.042773843,-0.09887433,-0.0883543,0.012070255,-0.008772582,-0.040901475,-0.036912926,-0.024835223,-0.11136921,0.02381244,-0.021675121,-0.024445498,0.07373798,-0.020061005,0.085149795,0.09759586,0.014788261,-0.055890147,-0.0049419315,0.044898566,0.01644637,-0.0018268531,-0.03435682,-0.011529962,-0.096018724,-0.00962775,-0.031701874,-0.06452847,-0.014051755,-0.0073284092,0.13611022,-0.07265475,-0.04950654,2.048525e-06,0.0070284354,0.024727503,0.039125107,-0.02280885,0.10601713,-0.011636315,-0.041759074,-0.04732178,-0.09582218,-0.043114204,0.06698823,-0.094242275,-0.028704882,0.021062654,-0.02118012,-0.007003386,0.011888408,-0.028778305,0.011628345,0.024738593,0.011831336,0.008468746,0.033380043,-0.06082557,0.040712073,-0.04235282,-0.011538599,-0.123583354,0.05541173,0.0018548369,-0.008217653,0.0026051176,-0.017067488,0.024598943,-0.06416047,0.05534796,-0.04303846,0.024778092,-0.05502447,-0.022218904,0.09147945,0.056184545,0.046555594,-0.022344245,0.056292377,0.09314572,-0.018879555,-0.049569294,0.020667192,0.0043581207,-0.051407073,-9.7332695e-33,0.02829737,0.06097096,0.058533646,0.054918975,0.02251559,-0.08282048,-0.01597009,0.040974606,0.012810165,0.025058487,0.019262955,-0.054298103,0.031048425,-0.029701618,0.075276926,0.059923463,0.089086294,0.01167946,0.023067832,-0.0008065568,0.0056260885,0.018754594,-0.012829286,0.06911937,-0.06831414,0.016703812,-0.016759071,-0.0131155355,0.023307182,0.05587884,-0.01870332,-0.06856871,-0.018548416,0.11291855,0.03152575,-0.072769284,0.12613747,0.03700754,-0.045435466,-0.025997458,-0.005705619,0.076413505,-0.010641401,0.08119715,-0.009087461,-0.043163948,0.025001848,-0.034497544,-0.03323295,-0.008159424,0.11131455,0.050280854,0.02596781,-0.11154736,0.014064126,0.008296792,-0.029814687,-0.046683386,-0.069357544,0.03114815,0.10655325,-0.049457394,0.05187747,-0.0049048243,-0.0005393363,0.007664231,0.044899,0.026227059,-0.042596273,-0.009830206,0.023972081,0.042539198,-0.02993165,-0.040046178,-0.030549517,0.014560135,-0.1001253,0.114115134,0.12430377,-0.046015125,0.004235668,-0.020496134,0.015971497,0.053167995,0.035090502,0.03618655,-0.01706757,0.061173476,0.032472916,-0.075127326,0.05188041,0.057326276,0.06957561,0.04937083,-0.024202963,-3.7220303e-08,0.029378692,-0.05242005,-0.030643973,-0.057984732,0.040107742,-0.043518495,-0.03716358,-0.044451647,-0.0011940208,0.009215979,0.049802914,-0.021298377,-0.018930053,0.05316662,-0.007014244,0.0063911607,-0.082365386,0.1132965,-0.011353588,-0.029992346,0.07824528,-0.0076242466,0.0053895577,-0.0005542132,-0.030021293,0.016698955,-0.050897535,-0.012903337,0.043732114,-0.0041024233,0.0058608293,0.008469771,0.019211203,0.0063940072,0.08119469,-0.043341033,0.041864783,0.07329096,0.025850803,0.008704459,0.09388672,-0.055082176,0.03761277,0.012056467,-0.04656045,0.01128112,0.0050594914,-0.12993658,-0.044966582,-0.036185883,-0.060532346,-0.0004456904,-0.027700923,-0.036749735,0.059437256,0.039446883,-0.015636731,0.09498002,-0.0005734899,-0.015709778,0.01877278,0.043370947,-0.0102537405,-0.00655772]	8
18	[-0.083186515,0.022026083,0.035701096,-0.10232592,-0.075390905,-0.00016700686,0.08936096,-0.0056916187,0.020030037,0.011914129,0.12826695,-0.09321049,0.0058418624,-0.07647973,-0.004579136,-0.030557869,-0.055017482,0.041339993,-0.08624273,-0.118286125,-0.013251286,-0.036138453,-0.00015377963,0.0066057323,-0.047764022,0.079375364,-0.011136709,0.056914225,0.032455154,-0.048719898,0.0083613,0.19022863,-0.03632037,-0.008440635,0.0032671236,0.027465986,-0.01089697,-0.020399645,0.0007410766,0.0009165319,0.019687667,-0.02347383,0.043729078,-0.10251335,0.084918104,0.011352459,-0.050406642,-0.026078144,0.027200243,-0.057891954,-0.043024946,0.09408639,0.03474203,0.048337948,-0.08146281,-0.04293461,0.08690081,0.048862766,0.038187936,-0.029422361,-0.035556376,-0.007862858,0.0042202123,-0.036322996,0.032430794,-0.042380568,-0.07415576,-0.033685796,-0.044366375,0.14130531,0.060912292,-0.013641382,-0.090104654,0.055023044,-0.06277938,0.07418742,0.023559282,-0.022148248,0.010476485,-0.07359575,0.045995746,0.07976921,0.078954704,-0.100406446,-0.04859677,0.040503584,-0.0042377454,0.013189334,-0.048154373,-0.033707544,0.03746186,0.062602155,-0.033261865,-0.05263321,0.04600194,-0.01315869,0.0016607705,-0.007890815,-0.040718663,0.022903034,0.070910186,0.024098761,-0.010285089,-0.06968786,-0.055727854,0.042817216,0.06774983,0.041961003,0.060413226,0.012482832,-0.056003716,0.02424437,-0.013940168,-0.08882489,-0.021814497,-0.012593369,-0.026435498,-0.0026530118,-0.034528714,0.041737515,0.00017088426,-0.037346713,-0.07983626,-0.029929636,-0.033387087,-0.07883591,0.045609552,2.3058087e-32,-0.0072790566,0.032964632,0.030245759,-0.114581496,0.101384096,-0.025811195,-0.02830154,-0.020606384,-0.037308924,0.024091601,0.02043997,-0.1028026,-0.09012252,-0.04618527,0.008994579,-0.029805029,-0.008103535,-0.119323954,-0.0634336,-0.015809037,0.024179097,0.034944855,0.044238877,0.023515739,0.016777808,0.006355647,-0.012231786,-0.038489766,0.028433014,0.04162964,0.010233895,0.0225089,0.017113065,-0.057011157,-0.13094603,-0.037511833,-0.043027647,-0.060403965,-0.017687595,0.026147794,0.07570622,-0.040771235,-0.02850279,0.02668201,-0.02946532,0.049580593,0.029670738,-0.026323652,0.04514328,0.022791559,-0.0052330955,-0.015738498,-0.10145871,0.008139421,0.11035856,-0.051173396,0.044807933,-0.010066167,0.063524514,0.024720006,0.025369009,-0.0075392057,0.020244066,0.026488734,-0.06564917,-0.02878208,0.012619368,-0.025765745,0.05357623,-0.08509447,-0.061152566,-0.08943235,-0.012444529,0.031922832,0.0017450801,-0.032717437,0.022163015,-0.043701105,-0.004545934,0.014286176,0.023951124,0.03048478,-0.02566531,-0.034760997,0.023695184,-0.0042987266,0.033467323,-0.07983272,-0.037235074,0.034537338,-0.06615163,0.04622042,0.062526286,-0.0031662416,-0.063077904,-1.9149286e-32,0.032586843,0.0830605,0.014057455,0.06682209,0.031462252,-0.06303897,0.051447723,-0.007509842,0.10278103,-0.05321722,-0.01275895,-0.07794309,-0.014673555,0.023424545,0.069455564,0.042460658,0.03211528,0.090471156,0.026226306,0.071020834,-0.006743675,-0.03179988,0.0054329475,0.059589136,-0.03407159,0.030205049,0.011235223,0.03437752,0.084654346,0.045208003,0.032678675,-0.09248639,-0.1081606,0.09614085,0.013304539,-0.07563809,0.11890273,-0.032930247,-0.044643268,0.057912294,-0.012453571,-0.016575184,-0.046230968,0.023249919,-0.0538871,-0.038914584,0.057998255,0.0003568794,-0.08681898,-0.03562241,0.12879853,0.018170778,-0.038388796,0.019424662,-0.0035222878,0.00046475907,0.021396834,-0.053029977,-0.09301752,-0.031725425,-0.0009289149,0.011769346,6.342062e-05,-0.059012566,-0.0034088914,0.02709575,0.073432334,0.04509498,0.0071902294,-0.037516467,-0.06558519,-0.04434012,-0.050141647,-0.044244844,-0.034134105,0.049349852,-0.06327226,0.041619066,0.0543009,-0.06720013,-0.075054854,-0.031839818,-0.026759844,-0.0011371813,0.0046515604,0.101210676,-0.040936753,-0.0030586892,0.04011243,0.036059786,0.06695618,0.029143134,0.067909084,0.08279013,0.013294261,-5.5573516e-08,0.016540427,-0.04752335,-0.0058006896,-0.025988217,0.111997016,-0.047125135,0.01836152,-0.053237036,0.018410793,0.0077621522,0.0372581,-0.0047963425,-0.01770613,0.0037786565,-0.088239126,0.118368804,-0.031367462,0.003754221,0.029020762,-0.04591897,0.063594855,0.039220143,0.0132540325,0.01949906,-0.09244327,0.04110614,-0.040018097,0.047030456,-0.052592546,-0.016030092,0.045767408,-0.036401127,-0.04092476,-0.04631834,0.10824329,-0.07962642,0.025177091,0.003239591,0.00495025,0.025267737,0.076469846,0.029477766,0.035036385,-0.01850665,0.0031651834,0.017209997,0.04558141,-0.021160437,-0.01075724,-0.0050752643,-0.060555834,-0.017713478,0.022314211,0.031339467,0.018695593,0.004207365,0.008058837,0.0727908,0.009657063,0.0020399445,0.022698712,0.0593057,-0.028576208,-0.06820433]	8
19	[-0.10188518,0.086122006,0.03133154,-0.07223981,-0.02280043,-0.0690279,0.0964356,0.04954258,-0.04341814,0.011831311,0.015929002,-0.048068706,0.089384235,0.0014683218,-0.077575155,-0.023313334,0.007829042,-0.043275528,0.010115992,-0.049039416,-0.024210887,-0.046903115,0.0052451086,0.029960955,-0.0107901795,0.045782905,0.044087734,-0.0064013666,-0.04523087,-0.08369403,-0.06180785,0.074064836,-0.062286984,0.005469047,0.021295808,-0.014664672,0.007938556,0.017928114,-0.009776981,-0.10481614,-0.065126024,-0.100403726,0.010883657,0.05986139,0.07549167,0.056414895,0.0078803925,-0.13877517,0.032721024,0.07311181,-0.06399015,-0.050743345,0.027385704,-0.028394623,0.050980985,-0.014956663,0.095558025,-0.026927067,0.012036974,-0.0030472204,0.037609007,-0.0734897,-0.024686014,-0.000523004,0.07924921,-0.04077816,-0.04740685,0.04215088,-0.017693182,-0.03676363,0.041703794,0.020617187,0.11180809,0.04065774,0.04476164,-0.011595972,0.06383271,-0.059631884,0.01708351,0.013641419,-0.009416008,-0.055918135,-0.12844849,-0.032515366,0.009248422,0.04836611,0.011816744,0.043508686,-0.013470602,0.017549498,-0.075233,0.03602184,0.060050543,0.06603871,-0.037769917,-0.014506658,-0.014750762,-0.10439161,-0.026271304,0.09252694,-0.004269295,0.0726301,0.009473026,0.0021557673,-0.0074126124,-0.024334554,-0.030078694,0.02544576,0.04508999,0.004552586,-0.013410596,-0.050754458,-0.018613733,0.00082239823,-0.08115866,0.0018487312,-0.050281744,0.052809447,0.059532825,-0.011694849,0.1162795,0.0038562685,-0.017068574,0.03557434,0.0013933609,-0.065801874,-0.026782624,-1.5326719e-33,-0.01057018,0.05846194,-0.060037136,0.098633304,0.014291898,0.00058606354,0.03131179,-0.007761875,-0.1082693,0.003710892,-0.02514915,-0.016050696,-0.098691,0.02461255,0.037915774,-0.06375643,-0.10674571,-0.03753757,-0.04031763,0.02386713,-0.006677069,0.04340038,0.030895364,0.026637854,0.052977175,-0.0028419173,-0.01645344,0.016924031,-0.00040930242,0.032977,-0.03626464,0.039816655,0.028134003,0.0027940432,0.08849549,0.0043221503,-0.033371657,-0.061556827,0.0030669805,0.03089148,0.055638183,0.0010565786,-0.061095256,0.042583812,0.041954495,-0.011706847,0.053621113,0.012633155,0.004305991,-0.011537821,-0.0041070734,0.025695173,-0.05021654,-0.054235067,0.007558678,-0.10412996,0.024460113,-0.018908937,0.014195207,-0.003444339,0.016500862,0.085603386,0.005475083,0.06674617,-0.029954473,0.06429894,0.05179979,0.049685627,0.0512603,0.048914768,-0.02465097,-0.03240325,0.012174337,-0.0018044623,-0.0040979832,-0.007853207,-0.05094302,0.005897441,-0.1103618,-0.01612004,-0.03926592,0.04264917,-0.030026164,0.04241335,0.053776957,-0.04321285,-0.045484256,-0.0025020984,0.05421678,-0.008167102,-0.0034594205,-0.09375697,0.020794906,0.0064889677,-0.066843584,6.3553446e-34,-0.02221081,-0.032286715,0.03189846,0.06734109,0.008708737,-0.10052653,-0.015284738,0.06147167,-8.429298e-05,0.13787997,0.08128833,0.02341892,0.02823074,-0.041281976,0.0725236,0.060646668,0.073860705,-0.024288146,0.030410301,-0.015422438,0.03707043,-0.04108476,-0.10203025,0.05957595,-0.013004118,0.07045347,-0.046633013,-0.0073850295,-0.013650942,0.044078425,-0.011499815,-0.059723005,0.014047878,0.12804006,0.027695,0.0005268406,0.030645933,-0.009311249,0.04684094,-0.07822972,0.022504201,0.0031576124,-0.048862673,0.11701327,-0.035538048,-0.060509436,0.04934488,0.009007913,0.0091782585,0.057556674,0.05789231,-0.0079676425,0.03835811,-0.17514655,0.04270165,-0.017219655,0.000619319,0.04473385,0.06869266,0.010273536,0.12353637,-0.07097646,0.028596586,0.0036766792,-0.13462399,-0.0066859606,0.029753402,0.07041314,-0.015923375,0.02086748,0.0310625,0.14203626,-0.006321971,-0.10676499,-0.02785392,-0.019771954,0.0028717692,0.087906204,0.025334904,-0.014833381,-0.013621156,0.028145853,0.0626579,0.049928345,0.0036436066,0.09202536,0.008791665,0.03374343,-0.03542992,-0.07056292,0.0015373826,0.054191027,0.05046543,-0.03097276,-0.037267186,-1.3486804e-08,0.012927442,-0.01052599,-0.08490542,-0.097597785,0.01369952,-0.04187738,-0.009236407,0.012717376,0.018999169,-0.04541981,0.016189264,0.0059721805,0.020901917,0.070051126,0.046896514,0.027526816,-0.083654225,0.06557952,-0.055531077,-0.01374532,-0.010636353,0.014519722,0.018594123,0.019258622,-0.071483,0.040335413,-0.041272312,-0.034082245,0.09262677,-0.0036276793,0.0030962978,-0.051984824,-0.050699275,-0.046128877,0.051331356,-0.025255319,-0.006529539,0.055958733,0.03949882,-0.0427165,0.043357287,-0.030837117,-0.0688805,0.036642138,-0.08992475,-0.054777183,-0.07293432,-0.124443,-0.05946783,-0.03459037,0.025362775,0.05206969,-0.08829546,0.01336271,0.04379818,0.064647816,-0.034731656,0.024736002,-0.050364498,0.0069723944,0.03496937,0.010616547,0.058883328,-0.0038798342]	8
20	[-0.098972976,0.09241092,-0.018688953,-0.034221414,-0.038502872,-0.039618455,0.0805909,0.039431367,-0.03711105,0.0013003916,-0.001076185,-0.032994717,0.021713905,0.008326186,-0.04902806,-0.004402417,0.054157678,0.0071763764,-0.040725406,-0.06924088,-0.03658302,-0.06652549,-0.016081743,0.032731276,0.02979307,0.10182565,-0.0024003831,-0.010592814,0.025767272,-0.11039709,0.007136399,0.04868058,-0.040221382,0.024913346,0.058577497,0.0004981376,0.024137767,-0.049358003,0.017779468,-0.13673702,-0.011146556,-0.049800307,-0.01012455,0.017349293,0.004073689,0.07528607,0.06754896,-0.054930784,-0.0031309277,0.012856977,-0.0062942896,-0.0126860365,-0.0049111024,-0.06328786,0.01923149,-0.0040706405,0.022969244,-0.017094884,0.04463115,-0.037682448,0.009228997,-0.024935845,0.023000313,0.0107987,0.025225168,-0.03970165,-0.031400353,0.06595192,-0.024456669,-0.00088179344,0.07114344,0.021895243,0.12818845,0.041523956,0.053472947,-0.011868357,0.043429535,-0.025145205,0.029683271,0.013330597,-0.06309508,-0.016298916,-0.09692265,-0.04043824,0.028501367,0.06056884,0.026837662,0.100120865,-0.053140882,0.0068322173,-0.120821096,-0.04544918,0.06653957,0.12745292,-0.12222421,0.013819835,0.02016274,-0.07624457,-0.080941655,0.16513082,-0.024046673,0.050954092,0.040281262,0.0119281225,0.041003034,-0.013783667,-0.06190119,-0.00092927157,0.04453687,0.026328964,-0.058309942,-0.06765083,-0.015559065,0.023726713,-0.09466078,-0.074835755,-0.027836585,-0.027128184,0.004485123,0.029293275,0.11552133,-0.007449581,0.04471179,0.0012808583,-0.044004507,-0.064297654,-0.030461578,-5.1897058e-33,-0.020213323,-0.045361962,-0.0073031858,0.035328817,-0.008552514,0.016479407,0.060285464,0.035229776,-0.059609227,0.03433457,-0.0015642263,-0.05408159,-0.08052068,0.049464293,0.052780923,-0.027759459,-0.11872423,-0.031299803,-0.036489967,0.039751098,-0.03330716,0.052913558,0.017756574,0.05036767,0.07455406,-0.03148192,0.04776055,-0.047894616,0.018899508,0.054904535,0.005502489,0.05878223,0.014696404,-0.001956512,0.03654045,-0.0058672293,-0.022290848,-0.07865734,-0.027180264,-0.0011062829,0.0698918,-0.03606965,-0.06713677,0.011110192,0.041354753,0.014501562,0.060702097,0.043835044,-0.029362349,0.014675996,-0.037294023,0.0033968368,-0.047262967,-0.049850605,0.012288567,-0.12959844,-0.010348614,-0.062303517,0.02094884,-0.0141031705,-0.0060395873,0.08563856,-0.039341647,0.06566741,-0.066948876,0.04014,0.046780016,0.019140702,0.022687223,0.022048017,0.0030256675,-0.051008407,0.02795172,-0.0043085394,-0.019050641,-0.003736502,-0.019552793,0.057098705,-0.10631897,0.04789842,0.038517706,0.079011865,-0.037238907,0.00286076,0.05054026,0.033279687,-0.056053527,-0.06575437,-0.018594654,0.033184323,-0.023134546,-0.10514446,-0.00025215695,-0.006378743,0.0010601018,4.2177325e-33,-0.040550098,-0.06960784,0.038132034,0.047753006,0.04124197,-0.08212371,0.016850175,0.03433833,0.06407923,0.11760572,-0.052567177,-0.007969646,0.077311784,0.023177953,0.035551585,0.041915502,0.049788795,-0.0068429844,0.0852775,-0.025603916,-0.022862341,-0.028217942,-0.09927573,0.015221747,-0.017841348,0.052999638,-0.048015326,-0.019530706,0.014627215,0.016538141,-0.005286608,-0.029419286,-0.022858212,0.06562426,0.022838857,-0.012471167,0.0015192416,-0.00035774813,0.01067952,-0.15022169,0.02641025,-0.013754376,-0.018883927,0.12559977,-0.020332359,-0.04747378,0.011823308,0.053537905,0.07650141,0.062040962,-0.013206043,0.056547347,0.03260603,-0.12919816,0.03582537,0.003272091,-0.040977094,0.03800834,0.06538793,0.049720455,0.07502631,0.010666469,0.026206512,0.11563014,-0.107600324,0.0065281275,0.020856302,-0.036703557,-0.019765107,0.013290313,0.041572873,0.12842259,0.011392127,-0.036001824,-0.029763205,0.00464105,-0.054297704,0.11858233,0.033271983,-0.025089385,0.02005039,-0.025750104,0.04213219,0.088912755,-0.0063232393,-0.011065945,0.00051025953,0.071600705,-0.029200241,-0.03244956,0.016528368,0.05613132,0.023722408,-0.004927065,-0.018340968,-1.0940606e-08,0.045174696,-0.047025606,-0.07222136,-0.11524371,0.020439005,0.014829692,0.018836822,0.05938026,0.0007429791,0.02303348,0.06772162,0.03648965,-0.0020408556,0.05371313,-0.016296927,0.003195734,-0.020278586,0.013786645,-0.006318201,-0.021382108,0.015638798,0.025622237,0.033572048,0.060102236,-0.09238845,-0.028782174,-0.0040137465,-0.018015621,0.07975255,0.0038543572,0.025538567,-0.00979191,0.015952446,-0.02422735,-0.022090934,-0.06637354,0.0055222046,0.08052159,0.015978541,-0.05831348,0.02482916,-0.04064665,0.020657482,-0.078613855,-0.045946345,-0.00704835,-0.11277233,-0.0879265,-0.06612581,-0.050753314,-0.017284796,0.04052775,-0.08530708,0.021585539,0.08960207,0.04357903,-0.023267323,-0.023442658,-0.014435162,-0.025829444,0.119782254,0.013539653,0.062157333,0.11234956]	8
21	[-0.020681204,0.014384915,0.037404478,-0.11686418,-0.08310849,0.034169592,0.06251276,0.048325118,0.0049199224,0.07332954,0.14992632,-0.120275415,-0.013960966,-0.0023593965,0.012571477,-0.009659792,-0.012659921,0.05906727,-0.11798063,-0.03237859,0.057263166,-0.018626377,-0.0040389216,0.012437936,-0.088966124,0.036899175,-0.044967357,0.053575687,0.019452913,-0.09570456,0.017864829,0.14771883,-0.007806791,0.0070020524,0.030473027,0.02085305,0.003943825,-0.04242467,0.040562365,0.0195299,-0.031040635,-0.0315154,-0.0021481232,-0.081643745,0.06895687,0.04486306,-0.032493707,0.0064321226,0.039198965,-0.05255166,-0.03810738,0.08381418,0.015163996,0.07146428,-0.049868938,-0.083831325,0.0100209,0.033620454,0.07658568,-0.007647817,-0.0026188206,0.044201043,-0.04341289,-0.0068191527,-0.006637747,-0.07594929,-0.12198169,-0.07059652,-0.021798601,0.08656391,-0.039815683,-0.04692441,-0.07296344,0.050785866,-0.066491336,0.06266332,-0.004856885,0.011946112,0.014437269,-0.09750592,-0.00391408,0.023955168,0.08420947,-0.07157827,-0.03556619,0.060143873,-0.040789656,0.002462905,-0.007485924,-0.035635393,0.030265678,0.060666207,-0.03705185,0.013359622,-0.008299302,-0.08694574,-0.032547664,0.018305076,-0.016300581,0.056829236,0.06326544,0.04258104,-0.0019795117,-0.026631229,-0.031144328,0.040494557,0.084178,0.016260315,0.028593453,0.009898738,-0.054281846,0.019289792,-0.0116971675,-0.12107015,-0.034094773,0.039043758,-0.038573083,-0.02774356,-0.05611405,0.031703528,0.001466775,-0.038589224,-0.02541189,-0.004518534,-0.017113375,-0.06885806,0.04547595,2.3865267e-32,-0.014530646,0.052195746,-0.0018140464,-0.13065152,0.043207534,-0.016715117,-0.032337625,-0.02151281,-0.04725374,0.043862417,0.0153444465,-0.109132946,-0.04176037,-0.024288766,0.04264339,-0.032591213,0.028468305,-0.11741484,-0.021491485,-0.05497858,-0.0089039905,-0.0008717348,0.021113925,-0.0045425273,0.044202257,0.044594597,-0.0072761206,-0.09722797,0.00560638,0.052191097,0.038767137,0.016897894,-0.026821246,-0.085235685,-0.121078596,-0.02860932,-0.018056938,-0.0979042,-0.057068687,-0.014952804,0.028855987,-0.050713383,-0.018287705,0.015334054,-0.019828599,0.058394715,-0.0052317437,-0.06510555,0.018875465,-0.01242576,0.045735076,-0.025788072,-0.06751222,0.004957859,0.062606275,-0.055482294,0.0059825615,-0.025284199,0.045322724,0.010507658,-0.025727836,-0.05033856,-0.021103716,0.057033222,-0.0021059737,-0.08703089,-0.0058042537,-0.057711914,0.011067784,-0.026625158,-0.04649047,-0.10509268,0.019037941,0.008147562,-0.049842503,-0.04189529,0.04238998,-0.028765192,-0.019834762,0.012460717,-0.025703695,0.035682604,-0.01930998,-0.061371118,0.0331326,-0.026875526,0.07510407,-0.0833535,0.041093007,-0.009317208,-0.04165783,0.028077262,0.06914477,-0.04423685,-0.03744735,-2.09477e-32,0.019814447,0.138915,-0.05338165,0.07173902,0.047434457,-0.0018718657,0.007008771,0.03233617,0.029793886,-0.053588904,-0.027998118,-0.05775184,-0.016399635,0.039699122,0.08062949,0.05899894,0.0292512,0.06336246,0.0072924807,0.072040245,0.038451377,0.0023496947,-0.012653483,0.035184957,-0.03906161,0.043223355,0.03398547,0.035698157,0.026388748,0.043033853,-0.042093623,-0.061480355,-0.08653255,0.106013276,0.008415834,-0.10030596,0.0585492,0.021974487,-0.038024705,0.03455451,-0.03501233,0.0030278484,0.0006629267,-0.010490451,-0.08708987,-0.05606222,0.07836992,0.009269564,-0.07537333,0.013080141,0.10928326,0.017609255,-0.037516084,0.012567592,-0.013204484,0.02084609,0.053341463,-0.12664008,-0.10868853,-0.061801147,-0.01230541,0.016805846,0.036927216,-0.04280011,0.056398313,0.0055041085,-0.006749728,0.033767637,0.038302172,-0.06794595,-0.06907911,-0.014629556,-0.009420077,0.03132856,-0.0006674665,0.012247386,-0.03483229,0.022113273,0.008640199,-0.00082907145,-0.091002055,0.00047884582,-0.013633351,0.031570412,0.0320326,0.08358789,-0.078726,0.042542923,0.026907265,0.007863255,0.04370937,0.074316226,0.11399612,0.09293466,0.046062075,-5.9420724e-08,-0.02749119,-0.05825408,-0.0041472525,-0.015477841,0.1238488,6.5975632e-06,-0.0548973,-0.04146807,-0.03255769,-0.009835788,0.09654822,0.05390549,-0.019359699,0.02080867,-0.03108272,0.08461706,0.012986559,0.013213686,-0.021415886,-0.024735434,0.001840512,0.05570387,0.028893659,0.00917193,-0.09118383,0.052500382,-0.04096093,0.060020436,-0.099523395,0.035792083,0.09949621,0.041276857,0.026409004,-0.074150115,0.08226264,-0.024315504,0.033149663,0.019900776,-0.017930787,0.06691571,0.051604852,-0.00867034,0.041268922,0.0059765712,0.010228932,-0.03538396,0.064871944,-0.083601154,0.009105283,-0.012379471,-0.081394084,0.007142408,0.030248316,0.017446201,0.046157915,0.011163781,-0.037492033,0.037852854,0.01556665,-0.002125951,0.09060274,0.022331819,-0.049779944,-0.04486307]	9
22	[-0.031115703,0.07228415,-0.106388554,0.043647055,0.00306061,0.020159692,0.09521165,0.027221834,-0.005387294,0.027901523,0.019218389,-0.112000264,0.0018563436,0.0488095,0.0030558778,0.029106725,0.08257167,0.024552858,0.0022377793,0.013706387,-0.08618785,0.035027336,0.0043110363,-0.002094307,-0.04195081,0.02590925,-0.035425663,-0.022206582,-0.06656269,-0.07735975,-0.014562547,-0.05518462,0.021434372,0.028155526,0.0017880236,-0.060415175,0.016916232,0.13987748,0.012555221,-0.054061644,-0.020663274,-0.002142569,0.020796468,-0.04018836,0.054942742,0.0017032463,0.030149398,0.064522564,0.028236946,0.04097699,0.011436725,0.006963127,-0.091682926,0.012873764,0.053312507,-0.044712283,0.00060789695,-0.014268721,0.08004165,0.019581387,-0.009964154,-0.016231306,-0.02911001,0.0404317,0.061204888,-0.089236416,-0.056126866,-0.008785498,-0.041533243,0.038721927,-0.033809442,-0.017733024,0.06709637,-0.027331105,-0.037634276,0.010366075,0.10154866,0.037961185,0.048828386,0.010895335,0.023621531,-0.024475783,-0.04513793,0.051071163,0.0167029,-0.015936036,0.0423831,-0.023516996,-0.020003125,0.008048889,-0.078154236,0.027681101,0.018993001,0.037304677,-0.09866143,-0.02121924,0.003926739,-0.03595198,-0.0914941,0.25986558,-0.029016964,-0.0301425,0.03798526,-0.012666466,0.08355493,0.014381395,-0.019502316,0.0054552504,0.0525549,0.05115426,0.018647771,-0.026544923,-0.11564076,0.00432168,0.11497012,-0.01064604,0.021167176,0.032452904,-0.01603424,0.0944779,0.06268823,0.076284,0.008761549,0.010221969,-0.0072799483,-0.06711905,0.045354232,-5.1472833e-33,-0.05274931,-0.09021515,0.06404277,-0.024035083,0.03231217,-0.015459583,0.017687775,0.024408076,0.036328763,0.03152721,0.02706811,-0.044840857,-0.071060844,0.06081146,-0.030867783,0.08545552,0.021850046,-0.050776273,-0.026444802,-0.060615387,-0.09595441,0.011948198,0.0118841035,0.035735965,-0.027338922,0.00085013744,0.021897756,-0.093343616,0.096996784,0.023238491,0.0424502,0.074320704,-0.00046422743,-0.0070514674,0.04297516,0.016341709,0.039555565,-0.10292211,0.012693045,-0.009996685,0.004242249,-0.029532608,-0.001231707,-0.011501808,-0.025902377,-0.013002655,-0.027488058,0.01624502,-0.07353523,0.07590172,-0.004567293,-0.05945683,-0.067214765,0.021617364,-0.08331151,-0.026029097,-0.029709453,-0.0069855293,0.025664361,-0.015536498,-0.020079242,-0.015249678,-0.053062025,0.050366603,-0.00695169,-0.07905177,-0.004158168,-0.051272724,-0.00851935,-0.067158565,-0.0077539883,-0.039077368,0.10921228,-0.043081403,-0.016350068,0.018313551,-0.007555513,0.074705236,-0.064942606,-0.0027752153,-0.046365835,0.0894124,-0.01209092,-0.040578436,0.018526977,0.028221827,-0.102295734,-0.070762336,0.06795869,-2.4033466e-06,-0.021247335,-0.079932235,0.054541957,-0.015980044,-0.053902104,3.436758e-33,-0.06376286,-0.045281243,-0.021774549,0.043939915,0.12691003,-0.008611042,-0.12020278,0.045832694,-0.045076776,-0.03190971,-0.06129435,0.0029695074,0.0051841494,0.0638937,0.058803964,-0.00972761,0.031067504,-0.012976454,0.015443088,0.039650466,-0.006642382,-0.07527281,-0.04358823,-0.03307824,0.0029833785,0.049178787,-0.049766816,-0.016604112,0.028110355,0.00966607,-0.10917828,0.06274933,0.011362723,0.04222297,0.018765371,0.14383471,-0.030122185,-0.03611486,-0.021222137,0.032415412,-0.009015063,0.028820772,-0.024347443,0.07439961,0.03813218,0.013402507,0.059015572,0.08467386,0.025603844,0.1115872,-0.035668906,-0.011756397,-0.049935866,-0.043635316,-0.053453144,0.039308965,0.017147169,-0.060797095,-0.0027391743,-0.01163686,0.028110586,0.029075267,-0.041551612,0.009573736,-0.07064317,0.06790366,-0.054612182,0.027230915,-0.041912723,-0.04094825,0.008865465,-0.016495077,-0.017981388,-0.032453597,-0.036470808,0.009567278,0.037783932,0.029564966,-0.05345302,-0.04670081,-0.03349573,-0.009267942,0.010236081,0.10957913,-0.00913925,0.036869694,0.049150106,-0.022823665,-0.0006595467,0.004622467,0.0264094,0.021800397,0.08342987,-0.034040455,-0.054692578,-1.1962736e-08,-0.068481565,0.015895903,-0.03833171,-0.061045174,0.07435671,0.094246626,-0.03667804,-0.009494811,0.068623334,0.055429228,0.030179625,0.021368554,0.014376987,0.0061191344,0.020571562,0.03498421,-0.0112459585,-0.0730364,-0.030790096,8.463913e-05,-0.084109806,0.04203667,0.029912928,0.0014928693,-0.005495275,-0.023829367,-0.10482728,0.030382358,-0.022736691,0.119543225,-0.0005625575,0.14491454,-0.09116918,-0.04015874,-0.013110288,-0.034736536,0.08847141,-0.017164176,-0.009903389,-0.047842123,0.02129885,0.06486193,0.006834626,-0.037002858,-0.01825222,0.0018945584,0.058255803,-0.11133324,-0.048167173,-0.08254139,-0.07651462,0.046591192,0.032249898,-0.019351538,0.021261059,0.0038181373,-0.021939471,-0.018282112,-0.051854108,0.03037016,0.12141623,0.023353526,0.049209353,0.06536158]	9
23	[-0.0798296,0.050141573,-0.06729656,-0.06333461,0.034629554,0.076502256,0.017972132,0.107505545,-0.08962351,0.11679944,0.1232692,-0.133751,0.03074943,0.053539835,-0.018283222,0.05185923,0.01111271,-0.005360048,-0.015975468,0.09104076,0.0069762273,0.03054999,0.0549122,-0.020530824,-0.10125968,-0.0025833058,-0.061316263,0.008021392,-0.028616676,-0.07157405,0.04974102,0.056756765,0.038153253,0.032074813,0.0702764,-0.029578421,0.06745795,0.04944549,0.06441661,-0.046019513,-0.026543824,-0.007605036,0.017954458,-0.062884584,0.041980606,0.09870024,0.025568256,0.020662397,0.06650139,0.03717208,0.041939694,0.009502934,0.010835752,-0.013904718,0.08477233,-0.008312542,0.0018279487,-0.021472793,0.074429564,-0.017369466,0.047229156,-0.015386698,-0.021462614,0.0021112028,-0.035940483,-0.13595791,-0.11549682,-0.05216057,-0.011769998,-0.014976044,0.037905954,-0.06611784,0.0068987366,-0.021246452,-0.042844146,0.07532077,0.074845396,0.022539498,0.015932482,-0.029093798,-0.03300514,-0.107473984,-0.03320315,0.06729079,0.05595037,0.0071646078,0.04650633,-0.020960158,0.05156436,0.059125435,-0.06732373,0.06482829,-0.0033930005,-0.012461212,-0.08118758,-0.034554362,0.041578915,-0.0067900573,-0.07117827,0.095714726,0.009553956,-0.0046775406,0.07717409,0.03587359,-0.00774482,-0.008385148,0.0109958965,0.019689756,0.050745368,-0.0038338415,0.027323581,0.013825643,-0.07978029,-0.027169865,0.052807935,-0.0122947,-0.066358164,0.025106158,-0.015468819,-0.042327575,0.030197537,0.019618308,-0.0077762795,0.037266538,0.013403415,-0.053605154,0.05451583,4.0255976e-33,-0.051304888,0.0015384967,-0.035639204,-0.022140523,0.017242715,-0.0591036,0.002161128,0.015256385,0.04825149,0.05448384,-0.0041106935,0.007833593,-0.005141661,-0.0125079425,-0.07848433,-0.038834002,0.005908395,-0.09238759,-0.066731386,-0.08169906,-0.046775922,-0.034494024,-0.016084556,-0.008246601,0.08751228,0.0937782,0.031105908,-0.09317596,0.13217482,0.04040542,-0.008357146,0.052243207,0.0037525252,-0.014102939,0.0048724096,0.0003622125,0.008014106,-0.12301529,-0.07932371,0.010874682,0.04932511,-0.040936425,-0.102139644,-0.030263877,-0.021902854,-0.09162197,0.056747247,0.005982038,0.05307632,-0.002802198,-0.06472279,-0.05339217,-0.01553716,-0.015724147,-0.033054028,-0.0069798343,-0.012618349,0.010261742,0.017091587,-0.041546762,0.025009295,-0.0024448643,-0.02149841,0.0036803647,0.04826644,-0.06808826,-0.081222855,-0.15758069,0.021825517,-0.027101299,-0.0028516978,-0.074302696,0.09983338,-0.06268909,0.004794665,-0.0012430097,-0.042338055,0.053585358,-0.06776404,0.006724605,-0.01260486,0.059363835,-0.07776425,-0.025442466,0.047655217,-0.045839302,-0.0030499117,-0.09505494,0.032999355,-0.034041196,-0.0030700383,-0.08186796,-0.015125094,-0.033774514,0.0005387876,-4.930584e-33,-0.01562533,0.003139365,-0.038750112,0.05772545,0.07602348,0.06263865,-0.055255275,0.03507546,-0.08071412,-0.032795247,-0.046122767,-0.03290901,-0.038452737,0.010508074,0.09532284,0.056667913,0.065905586,0.038183145,-0.017983967,0.036889136,0.034878626,0.0033181454,0.024940755,0.03394041,0.061589055,0.05315731,0.022350809,0.06321258,0.022982886,0.035661675,-0.1297031,0.021578886,0.045605026,0.1081824,-0.045643967,0.03202604,0.032558553,0.02951441,-0.03343883,-0.004448301,-0.0499343,0.000622753,-0.029142104,0.068389855,-0.045950517,-0.02451294,0.08956804,-0.0091069,0.0062835016,0.08887858,0.07724993,-0.023459416,-0.061842635,-0.02229914,-0.0014347134,-0.0049988558,0.0404241,-0.059641607,-0.0145981675,-0.050386466,0.07014884,0.04988287,-0.028823564,0.037236,0.00515913,0.013794894,-0.0743864,0.026002612,-0.02074164,-0.064868115,-0.012411895,0.020281369,0.08267867,-0.042037692,-0.031369213,-0.021082906,0.028620224,0.020454507,-0.02169276,-0.05229992,0.00051977404,-0.007034425,-0.00430867,0.09070693,-0.047505684,0.07505585,-0.027161688,0.07475334,-0.042482793,-0.014917041,-0.00872851,0.10875407,0.08678248,0.079450265,-0.008769725,-2.2282189e-08,-0.047382772,0.023463864,-0.027893452,-0.03261013,0.08570063,0.05617799,-0.036318924,-0.051102057,0.03168508,-0.029113686,0.056024134,0.03664233,0.04829017,0.009162727,-0.058461864,-0.0049259225,-0.07199083,0.010855923,-0.046716347,0.020183846,-0.038924914,0.038635157,0.0042951186,-0.056899592,-0.0027720034,0.0055691786,-0.100384146,0.012905986,-0.08784386,0.012177429,0.021975182,0.113033436,-0.04142558,-0.057256028,0.029515648,0.04179542,0.05359513,-0.032241274,-0.020426389,-0.019663267,0.0017961636,0.04521232,-0.016437389,0.01701022,-0.029910197,-0.004403031,-0.019315882,-0.116138205,-0.016168939,-0.10289997,-0.09223088,-0.021797108,-0.029838646,-0.05220998,0.0023537178,0.0882649,-0.04432161,-0.06425563,-0.004788173,0.023600088,-0.002702071,-0.032603387,-0.009736778,-0.021954129]	9
24	[0.009901526,0.058095705,0.0432558,0.004091028,-0.047457084,0.025867764,0.07975478,0.0050921952,-0.0017302989,0.039251607,0.081602015,-0.065505825,-0.028170481,-0.052164823,-0.09548013,-0.018558435,-0.09418797,0.022159753,0.054605454,0.021624666,-0.0694252,0.0008442264,0.004385636,0.04225891,-0.04053706,-0.05035678,-0.005225049,-0.014038171,-0.0028677753,-0.097031884,0.008048802,0.008982375,-0.007037887,-0.06748998,0.031808995,0.047887072,0.044516787,-0.002801634,-0.101408295,0.03320115,0.020073375,-0.10598561,-0.033753853,0.016134223,0.04121165,0.004626025,-0.017733395,0.043928288,-0.04046473,0.035501037,-0.059515473,0.041294914,0.0030613663,0.012567768,-0.011514873,-0.035426304,0.07532218,0.046196233,-0.028038781,0.025119744,0.030706443,0.040928196,-0.07548079,0.029401956,0.022901943,-0.025210202,0.077635154,-0.016791718,-0.06680865,0.03390536,0.057509355,-0.090723075,-0.025682162,-0.06283007,-0.0047100447,0.026951307,-0.014552177,-0.033626385,-0.027867146,0.0023076728,-0.08866035,-0.06663179,-0.044428587,0.023871575,0.010758241,0.04643526,0.030750297,-0.055332724,-0.018024042,-0.06253221,-0.054112814,-0.042283304,-0.047496933,0.007128904,0.008346917,0.06431551,-0.010518525,-0.02036965,-0.11844278,0.046227288,-0.015078874,0.082607105,-0.034237176,0.08453422,-0.035941675,0.0673406,-0.06317322,-0.035409834,0.011183018,-0.040793072,0.014345342,-0.05555488,0.06855312,-0.013801346,0.049901042,0.02187072,-0.023651572,-0.04849501,-0.0034169748,0.021586154,0.07173831,0.048048183,-0.08847476,0.024856823,-0.00017232155,0.022447664,0.019601071,-1.4217854e-33,-0.009430527,-0.0018234869,0.016022788,0.035432264,0.024845997,-0.056424215,-0.08888337,0.05388056,-0.065263115,-0.028322294,-0.010635905,-0.09651117,-0.026745996,0.030095406,0.065523684,-0.03450728,0.16828038,-0.07382668,0.0882239,0.020738946,-0.06973378,-0.030548621,0.017925555,0.023744348,0.09136679,-0.0004338313,-0.00469393,-0.014114899,-0.1038162,0.07304545,-0.04431857,-0.03835491,0.040448956,-0.016755642,-0.048649598,-0.13788615,0.025659295,0.039876,-0.015773183,-0.010181572,0.007499169,0.03866827,0.053151578,-0.041983716,-0.045259465,0.022836462,-0.009402377,0.006193518,0.08343636,0.050280772,0.03867778,-0.024433088,-0.08062882,0.027184876,-0.019017445,0.0283678,-0.038966693,0.07378522,-0.037772052,0.056306828,0.08391782,0.050801367,-0.052081,0.04286591,-0.07594354,-0.020559924,0.030791953,0.025504746,0.006166098,-0.058478013,-0.13831648,0.026312103,0.07916502,0.014065137,-0.053218767,0.010811661,-0.059135985,-0.017925464,0.07531748,-0.0154953515,0.07399168,-0.01826769,-0.015633719,-0.0005099778,0.023849752,0.010986608,0.029774038,-0.017932553,0.005795476,0.050803386,-0.001184893,0.0075350287,0.15162624,-0.08091697,-0.091499925,-8.721852e-34,-0.0259632,-0.017392922,-0.041883584,0.007151692,0.0928872,0.0674492,-0.054284096,0.036508515,-0.06098039,-0.03214,-0.02095451,-0.023828024,-0.0502351,0.06324742,0.13809285,0.03994568,0.11451957,0.0010390161,0.009451327,0.017088562,0.018773476,-0.104899146,0.018629616,-0.023014026,-0.055922505,0.023990532,0.030814027,-0.021253379,-0.06481835,0.08464758,-0.025236996,-0.06768397,-0.07902536,-0.0008322827,0.072808236,0.076915346,0.10064953,0.032911193,-0.029343342,0.035012398,0.047582865,-0.007013683,-0.034817528,0.04811292,0.043632895,0.012979859,-0.103843205,0.060744364,-0.04919134,-0.018821422,-0.011213848,0.006938348,0.104818456,0.03213267,-0.04370924,-0.04315066,0.011141159,-0.051269297,-0.085971,-0.018847961,-0.05368828,-0.038429312,-0.060195804,0.01767124,0.053001102,-0.03334354,-0.019973269,-0.04249576,-0.05394194,0.002237401,-0.005705191,-0.0018634102,-0.025180914,0.0029576519,-0.08357997,-0.051514916,-0.03262118,-0.0008197929,0.04448178,0.027094387,-0.04083301,0.019096226,-0.07970192,-0.016399788,0.011173048,-0.013240948,0.002115591,-0.033751003,0.02999469,-0.05564523,0.04273212,0.017854892,-0.04196856,-0.0361579,0.001216656,-1.604538e-08,0.085167184,-0.09019776,-0.029146608,-0.037316326,0.023558341,-0.025173565,0.0030937379,0.00402462,0.013486255,0.040705502,0.040740695,0.112198666,-0.0005034129,0.110407,-0.023228044,0.025129454,0.017071802,0.010561822,-0.017406918,0.029190062,0.059410583,0.025998836,0.0044646338,-0.10639387,-0.073090434,0.04026561,-0.08499115,-0.068311,-0.017493436,0.0016863957,0.062076002,0.055455565,-0.053721767,-0.030147618,0.034892663,-0.059027165,0.104204446,0.025295986,0.040606108,-0.014737806,0.06729175,0.077840686,0.04234829,0.035338614,0.13000363,-0.0068736086,0.033369664,-0.0053691915,0.046333693,0.03114579,-0.06526549,0.044874292,0.016920064,0.043936037,-0.012167994,-0.07914618,0.02105921,-0.009256108,0.01042191,-0.056431938,0.12301812,0.07393019,-0.008706728,-0.004313719]	9
25	[-0.0739528,0.05695687,-0.049776386,-0.06937605,-0.029769275,0.0006602994,0.02280741,0.050216656,-0.05314668,0.06900362,0.14165187,-0.04960508,0.05716599,-0.061057094,-0.038759086,-0.012561488,0.03267691,0.024633856,0.023489527,-0.021052478,-0.027775219,0.010188135,-0.010794201,-0.018105354,-0.16226971,0.0034352646,0.024633145,-0.0058525065,0.03902979,-0.106510304,0.04839252,0.11997464,-0.007913341,0.012373637,0.088418014,0.03785304,0.019571325,-0.08158929,-0.013489843,-0.011391635,-0.032984354,-0.039427094,0.027165158,-0.08930068,0.070427984,0.05222231,-0.041389603,0.004052306,0.08142137,-0.056282025,-0.03660896,0.07060501,0.071661904,0.020581944,-0.013418603,-0.094138436,0.01787316,0.021727981,0.08605199,-0.025179181,0.015803777,0.017342445,0.019417802,-0.04778971,0.077221036,-0.06386075,-0.053724874,-0.15694985,-0.017967021,0.058529906,-0.00029989664,-0.048272334,-0.008545267,0.05336524,-0.06312521,0.009360814,0.03666329,0.0067123533,0.063936114,-0.042694274,-0.011091793,-0.029862087,-0.036934167,0.06269201,-0.008786546,0.03565677,-0.038955763,0.013521978,0.06147769,-0.017808776,0.046886347,0.018448297,-0.039315935,-0.019992048,-0.13307501,-0.015579096,-0.033407435,0.010189531,-0.04309706,0.078307524,0.06801573,0.04638248,-0.020041483,-0.019854188,-0.09639811,0.031159617,0.0859948,-0.060194235,0.05361989,0.04595758,-0.016573887,-0.06346714,0.017885312,-0.06887479,-0.00055109774,-0.022149542,-0.066468984,0.028783208,-0.042889237,-0.02670197,0.021284057,-0.057861447,-0.058334332,-0.016197992,0.08293822,-0.04511006,0.0662305,8.3197435e-33,-0.0048012706,0.018772779,0.040790584,-0.06626883,0.03744741,-0.018155258,0.03339445,0.011339115,-0.015310218,0.01880454,-0.023723725,-0.016477505,-0.089125946,-0.0415513,0.02711665,-0.0631915,0.064183526,-0.080723666,-0.03228361,-0.0033911897,0.0011131002,-0.028498584,0.012378538,-0.0075888894,0.13211593,0.07067422,-0.014214084,-0.024027996,0.04211378,0.06490427,0.0024674926,0.0073890104,-0.052512124,0.04588439,-0.09733212,-0.06538971,-0.0054070624,-0.035420608,-0.075325966,0.015991507,0.010644211,0.018640533,-0.027940592,-0.041521654,-0.10244918,0.020781172,0.09469692,0.006468277,0.06487178,-0.0069008647,-0.06584005,-0.024458596,-0.13604723,-0.041097105,0.032591097,-0.05385306,0.01816353,-0.0053937957,-0.0655434,0.0017560208,0.059070434,0.046309628,0.011078275,0.023498852,0.006390919,-0.08825467,0.00018464586,0.0045234365,0.07468269,-0.0118312,-0.055946905,0.00891077,0.088952474,-0.022027826,-0.0073259333,-0.05944257,0.02385111,-0.037027754,-0.02914394,0.0058891987,-0.114380494,0.0017109151,-0.05117935,0.0045413747,0.06195957,0.02733277,0.03346019,0.008026056,0.023101132,0.009612672,-0.068910755,-0.07561707,0.022695964,0.075913355,-0.03899722,-8.929135e-33,-0.052455373,0.018662313,-0.0041904883,-0.007741752,-1.4024775e-05,-0.01546048,-0.011716767,0.039523024,-0.007150551,0.036356457,-0.053883146,-0.04478725,0.05145576,0.013471054,0.083447106,0.043517426,0.028892174,-0.03425073,-0.011414895,0.007045176,0.014738668,0.07157526,0.0022336305,0.051806446,0.038785413,0.03385232,0.072295986,0.07033147,-0.03524771,0.08426345,-0.036397733,-0.075888894,-0.046719223,0.11904538,-0.02913266,-0.03457836,0.06755703,0.0013673821,-0.022699805,-0.014503117,-0.00166924,0.034454703,0.0065486534,0.013185934,-0.05420678,-0.11492551,0.04328032,0.008947591,-0.05705686,-0.05709015,0.104746595,0.01995284,0.012057156,0.020101754,-0.0022161382,0.049296733,-0.043951213,-0.0054130564,-0.03708562,-0.024909995,0.08161176,0.019946357,-0.073949054,0.053841557,-0.010051809,-0.006867572,-0.029025098,0.038435433,0.026244042,-0.032664105,0.010627729,-0.0059550167,0.09047582,0.07569609,-0.035759114,-0.019942587,-0.04976692,0.005281641,0.09596375,-0.006076653,-0.029509,-0.014062266,-0.044277605,0.0451771,-0.008711916,0.04832066,-0.014734591,0.01595149,0.047157027,0.02765617,-0.012554311,0.08068952,0.047736388,0.04687178,-0.10778044,-3.0344346e-08,-0.012996979,-0.12943386,-0.021153206,-0.029911729,0.046404213,-0.065889314,-0.035185315,-0.1132583,-0.044054367,-0.033730384,0.074405946,0.026279097,-0.007666363,0.025778817,0.00924438,0.032973252,0.052581694,0.006015216,-0.029165203,-0.030490406,0.041119196,-0.08951585,-0.039184578,0.020938987,-0.04840297,0.05415522,-0.11026081,-0.06013389,-0.047200732,0.02437358,-0.037223045,-0.01424236,-0.019787932,-0.010699907,0.105130754,0.054713868,0.01127279,0.0025431048,-0.025845049,0.0470277,0.05093017,0.04967396,0.020663897,0.0041391067,0.015116939,0.010782989,-0.0017124511,-0.16881293,0.0062458487,-0.048599973,-0.03092145,-0.086049415,0.030541044,0.05978457,0.036470234,-0.0007176385,0.01257862,-0.0065777595,-0.048443403,0.05338305,0.047891848,0.116849504,0.011374184,0.026153319]	10
26	[-0.043283314,-0.05231092,0.028292773,-0.087141596,-0.065614015,0.030607829,0.047290243,0.007834598,0.021957854,0.05695921,0.14518791,-0.07916738,-0.0012244694,-0.060987506,0.008133724,-0.044067703,0.0069217486,0.031517122,-0.037118044,-0.053796105,-0.04093029,-0.0036208255,-0.015931757,0.005105156,-0.07008248,0.06518633,-0.0024824808,0.07414538,0.012237244,-0.082800455,0.011858768,0.16434066,0.033448555,0.018855121,0.080634974,0.04737293,-0.00844254,-0.050453175,-0.011349567,0.043385316,-0.054772057,-0.012525144,-0.03650719,-0.03933743,0.050913487,-0.016290583,-0.07377474,-0.024545088,0.048557665,-0.03522156,-0.074550524,0.10485233,0.035840224,0.12770098,-0.101637475,-0.030407881,-0.022016486,0.06318506,0.06974586,-0.04038321,-0.07472574,0.0008637254,-0.012118968,-0.036943283,0.011374325,-0.0012975743,-0.061259728,-0.0653182,-0.009629973,0.1104243,-0.03241043,0.010583174,-0.076875664,0.096035294,-0.06408966,0.04939763,0.0069965734,-0.027821628,-0.011855345,-0.06445714,0.012780682,0.035202865,0.03102906,-0.028939713,-0.05177192,0.041081846,-0.046763763,-0.018233908,-0.01851344,-0.03277965,0.053768374,0.055018023,-0.041149367,-0.05931878,0.00032538344,-0.045001548,-0.015055765,0.09144723,0.012087927,0.01431332,0.07685898,0.004948332,-0.04711912,-0.08405107,-0.0622774,0.03560349,0.07746832,-0.02213783,0.05435604,0.025164362,-0.053222816,-0.034632538,-0.0060687144,-0.09256779,-0.042459637,0.014481538,-0.019718435,-0.0026365232,-0.057659473,0.020428903,-0.013961283,-0.07421515,-0.056637116,-0.035352785,-0.06492953,-0.10473602,0.033732176,1.8546447e-32,0.033794995,0.033298146,0.023990277,-0.103904486,0.04102285,-0.025816299,0.0049692597,-0.016762955,-0.060431737,-0.0006866443,0.013699409,-0.059590284,-0.09058966,-0.084268324,0.05994127,-0.028617777,0.050038815,-0.123459496,-0.029802702,-0.021769976,0.02889151,0.028202033,0.027095364,-0.030928124,0.06173837,0.030791158,-0.021906817,-0.032792293,0.011640122,0.06559808,0.0152215045,0.019258842,-0.022649914,0.0029516737,-0.09650764,-0.033604737,-0.019203736,-0.055362217,-0.07244973,-0.021628318,0.008995604,-0.0036057518,-0.018783368,0.035010375,-0.043882202,0.027590347,0.0013393307,-0.036488246,0.040897287,0.010912364,-0.018205801,-0.022533504,-0.13115332,0.020235019,0.08841948,-0.04710461,0.015985789,-0.07207993,-0.001328497,0.050465975,-0.0062487726,-0.01358819,0.021213112,0.037338663,-0.025230395,-0.0617411,0.0028566963,0.020786608,0.071186565,-0.051559966,-0.058747146,-0.033111855,-0.011992778,0.045217704,-0.043192204,-0.024023281,0.03430321,-0.030339716,0.003384445,0.02998136,0.00069521513,0.0026244642,-0.011730601,0.008124703,0.04539506,-0.009276009,0.057576686,-0.052401066,-0.036522493,0.003532136,-0.03169453,0.002389615,0.088038385,0.002145191,-0.09153054,-1.6083227e-32,0.035553124,0.06376664,-0.022798546,0.06423617,-0.04071461,-0.018040026,0.0583805,0.027510995,0.03909801,-0.04709843,-0.072111964,-0.059469584,0.019590758,-0.017726788,0.067029305,0.045972675,0.056895077,0.0015582218,0.002825123,0.050262656,0.006695315,-0.025253925,-0.0111806365,0.046066646,-0.02113745,0.04818959,0.047716394,0.09273575,0.010993136,0.114936225,-0.0021166764,-0.07608214,-0.10867716,0.09998706,-0.026541747,-0.046493866,0.086108826,0.00025499795,-0.058399025,0.023231197,-0.016677994,-0.045674257,-0.022614699,-0.031413678,-0.079746306,-0.056850623,0.07223325,0.043126836,-0.0983927,-0.020057173,0.11372456,0.020850463,-0.037551545,0.04425588,-0.0023433995,0.02960427,-0.043907266,-0.03852342,-0.10463592,-0.05096814,0.031839646,0.029081931,-0.038715117,-0.012614887,0.019013688,0.011832717,0.061959025,0.03851524,0.034680095,-0.080987655,-0.07043287,-0.022493757,0.016016131,0.015844291,0.0073753702,0.02172876,-0.06027165,0.0033873175,0.04695085,0.033721916,-0.11520349,0.011040796,-0.08265875,0.033674516,0.042460952,0.14713587,-0.05035738,-0.0036024954,0.041075703,0.018738981,0.060169872,0.05625357,0.066479996,0.08215627,-0.024267422,-5.1104664e-08,0.020576073,-0.102098696,-0.009794451,-0.010603318,0.09809418,-0.05082496,-0.010948851,-0.048414916,-0.022155758,-0.0023405876,0.08754922,0.026552703,-0.014537349,-0.018371955,-0.021556199,0.06939461,0.041779105,0.0339589,-0.0012110759,-0.04802477,0.024700046,0.011282117,0.028011428,0.058496617,-0.051554836,0.046497032,-0.08826946,0.02611708,-0.071965486,0.042845137,0.030794924,-0.05158525,-0.045870427,-0.04100509,0.141251,-0.053850196,0.01350188,-0.02301953,-0.04048721,0.09454526,0.104619846,0.037727974,0.008069001,0.03459987,0.03007878,0.027588934,0.06755846,-0.08514676,0.0053809574,-0.031663164,-0.017916007,-0.030884538,0.045644153,0.024639515,-0.0012786419,0.019263607,0.029304244,0.035504866,0.0040406613,0.04981792,0.039743297,0.06950292,-0.062108807,0.00413671]	10
27	[-0.023075467,0.023366345,-0.017643012,-0.0807887,0.0046147476,-0.06498238,0.058094177,0.046227664,-0.011240124,0.008594966,0.10615317,-0.053825945,0.026220977,-0.034910727,-0.0009903545,-0.03895014,-0.018830765,0.046175163,0.00069849,0.022853855,-0.025159607,-0.024718033,0.04504448,-0.016568348,-0.08766736,0.033575866,0.014768152,-0.071255304,0.027465396,-0.10841287,0.012025809,0.040612023,0.015686285,-0.037540734,0.038102143,0.02919374,-0.033455234,-0.023594528,-0.095684,-0.031173533,-0.065121405,-0.08886873,-0.0073731984,-0.06031219,0.059694473,0.07335728,-0.033550505,-0.01465067,0.018900892,-0.008804357,-0.1206995,-0.03158145,0.05048219,0.011629727,-0.04965574,-0.03742973,0.055538375,0.025414996,0.07939932,-0.023546424,0.06870456,-0.0033413244,-0.022310842,0.028188037,0.02949698,-0.018788898,-0.020012166,-0.11842417,-0.044811998,0.051200215,0.057710767,-0.06463645,0.0056382874,0.020753706,0.017222753,-0.038081802,0.01663614,-0.009205715,0.05892286,0.048483994,-0.032940403,0.0017021057,-0.053199384,0.0585441,0.02458816,0.06576391,0.02755862,0.0002448559,0.039096825,-0.04073671,-0.074877106,-0.041391462,-0.050490163,-0.050622437,-0.04887916,-0.026427235,-0.057630274,-0.05050948,-0.015965596,0.094684385,-0.014002819,0.044547986,-0.025459923,0.047118656,-0.032525774,0.09067427,0.055266105,-0.014043099,0.08991349,0.062843986,-0.026415791,-0.09276344,0.06769388,-0.028041674,0.02261374,-0.027121086,0.01703226,0.080256745,0.0019391971,0.004402899,0.06659197,-0.030538881,-0.057567246,-0.028821371,0.07302588,-0.025068173,0.031062318,-2.8654995e-33,0.00086658885,0.0028236785,0.016935041,-0.045716017,0.02143022,-0.03984379,-0.0028670118,0.028217444,-0.093721114,-0.03595876,-0.075354174,-0.042406,-0.080542535,0.025320595,0.060704228,-0.047635842,0.11537598,-0.036765557,0.03135722,-0.035987917,0.059630506,0.012927955,0.021185063,0.016933667,0.059804328,0.03526655,-0.0075157285,-0.016706195,-0.010736246,0.05357967,-0.044387516,0.010436907,-0.04449936,0.057898745,-0.030377222,-0.04871226,-0.01906374,-0.009881611,0.02167804,0.029732103,-0.0014064368,-0.004737264,0.0033302743,-0.11165953,-0.07275631,0.012948695,0.049216326,0.02207927,0.031198034,-0.019265246,-0.013380459,0.019651614,-0.10554183,0.035621665,-0.0055252505,-0.033102073,0.047467414,0.014433653,-0.04940415,-0.009379075,0.052737847,0.04390274,0.03452419,0.069379844,0.026840458,-0.06322454,0.017762272,0.05190596,0.1192178,-0.021664731,-0.101372235,-0.0013503878,0.06023818,-0.021826647,-0.02891103,0.037268937,-0.0067108544,-0.04747655,0.03817135,-0.032111596,-0.060815867,0.0007292431,-0.03236783,-0.032371666,0.073255315,0.02997817,-0.014220352,-0.008482689,-0.0037594766,0.007532797,-0.027207594,-0.088516586,0.027848799,0.043285493,-0.13382144,1.9370599e-33,-0.019813692,0.03227686,0.05903096,0.0023531409,0.03375912,-3.7631185e-06,-0.03665493,-0.001248386,-0.09933419,0.05371095,-0.04729083,-0.05647206,0.04719487,0.032177992,0.069322914,0.07966319,0.09850524,-0.08222358,-0.0005761188,-0.02442688,0.012897353,0.037978526,-0.06605812,0.0010842625,-0.039653827,0.043706987,0.09563539,0.025058517,-0.08151475,0.07036665,-0.08514081,-0.07665798,-0.012789421,0.03820907,0.09259397,0.04182285,0.041394886,0.028825326,0.010475981,-0.03891081,0.009061809,0.018324565,-0.029880852,0.09580248,0.05752699,-0.082337216,-0.010511714,0.028240256,-0.040724006,0.03659264,0.06355997,0.025040979,0.022060141,-0.07463054,-0.04445793,0.010538272,-0.035028014,-0.022347962,-0.06319881,-0.0185467,0.023049094,-0.011606011,-0.052050665,0.07539936,-0.016154213,0.05339813,-0.01459425,0.06172929,0.02504635,-0.118351154,0.06932401,0.026461432,0.0840586,0.031210432,-0.053862095,-0.063702725,-0.03272271,0.005798629,0.096287034,0.0186634,-0.055235915,-0.047189075,-0.011719597,0.10742421,-0.033799477,0.05125945,-0.04243343,-0.036993556,0.070342295,0.02351007,-0.016372884,0.123255536,0.045404743,0.019083673,-0.012640547,-1.2363854e-08,0.015288575,-0.080934174,-0.02313734,-0.041513287,0.059931803,-0.041955184,-0.028668037,-0.056267656,-0.04439867,-0.020920277,0.029246477,0.06390528,-0.009650436,0.06142868,0.068553396,0.05634658,0.10201103,0.050631132,0.002047001,0.0006408579,0.09342328,-0.0067117815,0.026967147,-0.01984513,-0.063796595,-0.051022906,-0.12780009,-0.05104541,-0.06801189,-0.00242071,0.0051361495,0.033665583,-0.031028567,-0.00027494584,0.059492316,0.021886691,0.020743173,-0.022032246,0.012608255,0.003508217,0.070475206,0.13797194,-0.009016634,0.009759654,0.015038685,0.02180947,-0.013151336,-0.15572158,-0.040523566,-0.037869357,-0.09799113,0.006522259,0.013442906,0.10825507,0.07157148,0.016832298,-0.016747428,-0.024034806,-0.042012252,0.08092911,0.09289712,0.10657557,0.064652555,-0.031906553]	10
28	[0.030543383,0.07264626,-0.03878768,-0.004412745,0.0087105315,0.06509757,-0.030460432,0.098440655,0.017274652,0.079013,0.0710094,-0.011500616,-0.047957566,0.0095277075,-0.09583695,0.07859297,0.073685944,0.0789541,-0.048439644,0.040741235,-0.089964636,-0.032245763,-0.002788671,-0.0027833006,-0.111822404,0.07533136,-0.07527207,0.09229803,0.066533044,-0.10893306,0.022538409,0.028048642,0.0022440671,-0.010899776,-0.08409987,0.026575493,0.0051984484,0.023556612,-0.027548568,-0.020234864,-0.0703661,-0.03834172,0.02777476,0.022330139,0.011057551,0.005634943,0.028286535,0.02177538,0.08308687,-0.043867305,0.041580684,-0.035712115,-0.023740962,-0.021848703,0.055273816,-0.02100523,-0.013837008,-0.07578663,0.0597546,-0.036080107,0.103236,-0.025674677,0.0056798025,0.041340496,0.048178297,-0.094694145,0.0002797974,-0.06388536,-0.019262541,0.043919478,0.022805287,-0.017252944,-0.055151176,0.0085580805,0.0654863,-0.04317254,0.07988774,0.027559219,0.059603497,0.026334163,0.016395722,-0.06353757,-0.07440574,0.028551215,-0.040663566,-0.020459928,-0.0019142794,0.014225491,0.080674835,-0.055698536,-0.05946685,0.05262771,-0.006371162,0.041375965,-0.110419765,-0.04002247,-0.042231888,-0.039470218,-0.11045988,0.17905945,0.04225604,0.053945694,0.02827836,0.0056123715,0.02916418,0.014456039,0.041024357,-0.017161086,0.03746476,0.042854346,-0.025329828,0.0071002264,-0.06280543,0.00528786,-0.00046259968,-0.009562115,-0.013078511,-0.051487442,-0.027571965,0.04425152,-0.0032047674,-0.05453431,-0.05135755,-0.00044679584,0.014401657,-0.0028856874,-0.0023242452,-2.6782263e-33,0.021174585,-0.010286261,0.044210054,-0.046773236,0.01481342,-0.0051584896,0.02851324,-0.015112107,-0.022283558,0.044764854,-0.034326423,-0.026655868,-0.024785314,-0.013623146,0.08916213,-0.11652647,0.0070658214,-0.022345107,-0.04131044,-0.019931102,-0.041353248,0.048074424,-0.006042488,-0.069633305,0.019620888,0.029337015,0.030213358,-0.02877006,0.005545368,0.034599937,-0.021620637,-0.07011321,-0.043899596,0.0052392646,0.010932462,0.020911759,0.05621207,-0.068654135,-0.019959291,0.04341166,-0.07118185,-0.012637052,-0.05254635,-0.034242388,-0.016658239,0.044041548,0.1761448,0.011988511,-0.05202223,-0.03355913,-0.044126995,0.0078980485,-0.03478617,0.038113534,-0.005604365,0.0330055,0.0011041183,-0.052468654,-0.08104956,0.007800531,0.00719826,-0.02121644,-0.011839431,-0.0058103856,-0.048401617,-0.027259354,0.03872472,0.00439141,0.054726426,0.017437363,-0.08954159,0.017911203,0.1553004,-0.03155827,0.06752283,0.0420903,0.072132446,-0.04124252,-0.020241074,-0.073548205,-0.079328634,0.0045149187,-0.033337645,0.010937445,-0.025895024,-0.034476917,-0.008871374,-0.051338896,-0.028592698,-0.03956011,-0.1853451,-0.041226704,0.03834697,0.0035847067,0.0067100227,1.6156701e-33,-0.09802427,-0.051013708,0.018748054,0.059588008,0.049465712,0.043204248,0.021946825,0.016842073,-0.05960248,0.076197974,-0.019422743,0.036058832,0.05786719,-0.04880173,0.016808525,0.073948555,0.032782756,-0.07198744,0.07379033,0.007951871,0.07459412,0.05373783,0.024109395,0.016652143,0.05281843,0.041030295,0.0978443,-0.066783376,-0.065091826,0.048556462,0.038177665,-0.039515555,0.019624773,0.06526446,-0.0875786,0.03832883,-0.04732115,-0.02304665,0.0025464077,-0.021851,0.032648858,0.04725402,0.07653383,0.020483714,-0.031138761,-0.06966796,-0.033850852,0.020915773,0.022787193,0.031764045,-0.13164367,-0.038822524,-0.050591048,0.010786365,-0.031739704,-0.022374652,0.022467941,0.033355135,0.06759347,0.062498868,-0.024522282,-0.028820876,-0.09879448,-0.0016152138,-0.014539913,0.09441335,-0.0008417297,0.031047953,0.005945536,-0.0056165727,0.028869586,0.11838718,0.05578068,0.0695378,-0.048129454,-0.02756262,0.030269904,-0.02559289,0.03457535,-0.009071244,0.026373316,-0.053813454,0.031036433,0.005655475,-0.003912334,-0.0016484987,-0.03126257,0.09561021,0.01274563,0.006277257,-0.0033302298,0.09290152,0.16015767,-0.048202924,-0.07931509,-1.164201e-08,-0.05274019,0.00083486823,0.02888488,-0.004135513,-0.042502854,0.025606751,-0.029956859,-0.0870616,-0.04190346,-0.0045075007,0.052699115,-0.013566142,0.01650658,0.043582875,0.029476458,0.033080045,-0.022388158,-0.027596777,-0.07354289,-0.0014715671,-0.0393774,0.03996854,-0.0009855038,-0.032379396,-0.03602361,-0.015823923,0.037041835,0.035303246,0.006504668,-0.021711243,-0.044738192,0.12677567,-0.054207694,-0.011158776,-0.038746797,0.09418057,0.014513503,0.04034181,-0.08036183,0.015024829,-0.02939455,-0.014741943,-0.010098655,-0.048110235,-0.004130298,0.086695746,-0.023906505,-0.09428025,0.04289603,-0.0895937,0.03692514,-0.01823587,0.011516544,0.091035485,0.060016993,0.044034712,-0.033050753,0.0007141693,-0.061177444,-0.048057318,0.039225604,0.094032586,0.019760584,0.036258604]	10
29	[0.030543383,0.07264626,-0.03878768,-0.004412745,0.0087105315,0.06509757,-0.030460432,0.098440655,0.017274652,0.079013,0.0710094,-0.011500616,-0.047957566,0.0095277075,-0.09583695,0.07859297,0.073685944,0.0789541,-0.048439644,0.040741235,-0.089964636,-0.032245763,-0.002788671,-0.0027833006,-0.111822404,0.07533136,-0.07527207,0.09229803,0.066533044,-0.10893306,0.022538409,0.028048642,0.0022440671,-0.010899776,-0.08409987,0.026575493,0.0051984484,0.023556612,-0.027548568,-0.020234864,-0.0703661,-0.03834172,0.02777476,0.022330139,0.011057551,0.005634943,0.028286535,0.02177538,0.08308687,-0.043867305,0.041580684,-0.035712115,-0.023740962,-0.021848703,0.055273816,-0.02100523,-0.013837008,-0.07578663,0.0597546,-0.036080107,0.103236,-0.025674677,0.0056798025,0.041340496,0.048178297,-0.094694145,0.0002797974,-0.06388536,-0.019262541,0.043919478,0.022805287,-0.017252944,-0.055151176,0.0085580805,0.0654863,-0.04317254,0.07988774,0.027559219,0.059603497,0.026334163,0.016395722,-0.06353757,-0.07440574,0.028551215,-0.040663566,-0.020459928,-0.0019142794,0.014225491,0.080674835,-0.055698536,-0.05946685,0.05262771,-0.006371162,0.041375965,-0.110419765,-0.04002247,-0.042231888,-0.039470218,-0.11045988,0.17905945,0.04225604,0.053945694,0.02827836,0.0056123715,0.02916418,0.014456039,0.041024357,-0.017161086,0.03746476,0.042854346,-0.025329828,0.0071002264,-0.06280543,0.00528786,-0.00046259968,-0.009562115,-0.013078511,-0.051487442,-0.027571965,0.04425152,-0.0032047674,-0.05453431,-0.05135755,-0.00044679584,0.014401657,-0.0028856874,-0.0023242452,-2.6782263e-33,0.021174585,-0.010286261,0.044210054,-0.046773236,0.01481342,-0.0051584896,0.02851324,-0.015112107,-0.022283558,0.044764854,-0.034326423,-0.026655868,-0.024785314,-0.013623146,0.08916213,-0.11652647,0.0070658214,-0.022345107,-0.04131044,-0.019931102,-0.041353248,0.048074424,-0.006042488,-0.069633305,0.019620888,0.029337015,0.030213358,-0.02877006,0.005545368,0.034599937,-0.021620637,-0.07011321,-0.043899596,0.0052392646,0.010932462,0.020911759,0.05621207,-0.068654135,-0.019959291,0.04341166,-0.07118185,-0.012637052,-0.05254635,-0.034242388,-0.016658239,0.044041548,0.1761448,0.011988511,-0.05202223,-0.03355913,-0.044126995,0.0078980485,-0.03478617,0.038113534,-0.005604365,0.0330055,0.0011041183,-0.052468654,-0.08104956,0.007800531,0.00719826,-0.02121644,-0.011839431,-0.0058103856,-0.048401617,-0.027259354,0.03872472,0.00439141,0.054726426,0.017437363,-0.08954159,0.017911203,0.1553004,-0.03155827,0.06752283,0.0420903,0.072132446,-0.04124252,-0.020241074,-0.073548205,-0.079328634,0.0045149187,-0.033337645,0.010937445,-0.025895024,-0.034476917,-0.008871374,-0.051338896,-0.028592698,-0.03956011,-0.1853451,-0.041226704,0.03834697,0.0035847067,0.0067100227,1.6156701e-33,-0.09802427,-0.051013708,0.018748054,0.059588008,0.049465712,0.043204248,0.021946825,0.016842073,-0.05960248,0.076197974,-0.019422743,0.036058832,0.05786719,-0.04880173,0.016808525,0.073948555,0.032782756,-0.07198744,0.07379033,0.007951871,0.07459412,0.05373783,0.024109395,0.016652143,0.05281843,0.041030295,0.0978443,-0.066783376,-0.065091826,0.048556462,0.038177665,-0.039515555,0.019624773,0.06526446,-0.0875786,0.03832883,-0.04732115,-0.02304665,0.0025464077,-0.021851,0.032648858,0.04725402,0.07653383,0.020483714,-0.031138761,-0.06966796,-0.033850852,0.020915773,0.022787193,0.031764045,-0.13164367,-0.038822524,-0.050591048,0.010786365,-0.031739704,-0.022374652,0.022467941,0.033355135,0.06759347,0.062498868,-0.024522282,-0.028820876,-0.09879448,-0.0016152138,-0.014539913,0.09441335,-0.0008417297,0.031047953,0.005945536,-0.0056165727,0.028869586,0.11838718,0.05578068,0.0695378,-0.048129454,-0.02756262,0.030269904,-0.02559289,0.03457535,-0.009071244,0.026373316,-0.053813454,0.031036433,0.005655475,-0.003912334,-0.0016484987,-0.03126257,0.09561021,0.01274563,0.006277257,-0.0033302298,0.09290152,0.16015767,-0.048202924,-0.07931509,-1.164201e-08,-0.05274019,0.00083486823,0.02888488,-0.004135513,-0.042502854,0.025606751,-0.029956859,-0.0870616,-0.04190346,-0.0045075007,0.052699115,-0.013566142,0.01650658,0.043582875,0.029476458,0.033080045,-0.022388158,-0.027596777,-0.07354289,-0.0014715671,-0.0393774,0.03996854,-0.0009855038,-0.032379396,-0.03602361,-0.015823923,0.037041835,0.035303246,0.006504668,-0.021711243,-0.044738192,0.12677567,-0.054207694,-0.011158776,-0.038746797,0.09418057,0.014513503,0.04034181,-0.08036183,0.015024829,-0.02939455,-0.014741943,-0.010098655,-0.048110235,-0.004130298,0.086695746,-0.023906505,-0.09428025,0.04289603,-0.0895937,0.03692514,-0.01823587,0.011516544,0.091035485,0.060016993,0.044034712,-0.033050753,0.0007141693,-0.061177444,-0.048057318,0.039225604,0.094032586,0.019760584,0.036258604]	11
30	[-0.05740097,0.07121347,-0.067628875,-0.07809377,-0.040492576,0.09543715,-0.01633126,0.0683281,-0.04328145,0.070254594,0.15533711,-0.060889263,0.044576462,-0.019167952,-0.016170941,0.017418465,0.022916652,-0.0009934898,0.018881569,-0.016400788,-0.032859385,0.029190201,0.0059196586,-0.042769253,-0.13254862,0.025213562,-0.0013050761,0.035080682,0.029913073,-0.11716509,0.042484455,0.06501583,-0.0046845763,0.02719283,0.10294718,-0.02283179,0.017691724,-0.056163263,-0.030792944,-0.016011884,-0.056233253,-0.02257062,0.011716971,-0.06182907,0.06880552,0.13296866,-0.03024046,-0.030307466,0.077959724,-0.04790633,-0.044532064,0.037835978,0.06629655,-0.0063647456,0.0070384457,-0.08907828,0.024555424,0.041576035,0.07659644,-0.058124118,0.004144067,-0.00878343,0.021094058,-0.040229667,0.043748736,-0.05101204,-0.056225736,-0.114643015,-0.0077665094,0.03522719,0.0210176,-0.03302073,0.008732302,0.014984556,-0.016030012,0.017435476,0.021020252,0.003375115,0.07848098,-0.03436381,-0.007872786,-0.008340846,-0.08264054,0.054591075,0.026126869,0.06276043,-0.019434813,0.010649496,0.07127883,-0.083452106,0.0036469507,-0.058365438,-0.009804698,0.00123631,-0.08687323,-0.004161881,0.0052217906,0.0016249582,-0.051222533,0.07473811,0.10081773,0.040915746,-0.060448706,-0.03199357,-0.09694418,0.050993588,0.0790493,-0.02651548,0.06616167,0.028316986,-0.0036005862,-0.032504734,0.0026360347,-0.06908963,-0.010930523,-0.021346118,-0.003176486,0.045383994,-0.055083565,-0.012333101,0.0148425205,-0.07344915,-0.06878334,-0.015254698,0.04420909,-0.0141907865,0.03695407,7.0102435e-33,0.019575492,-0.0032757197,-0.0061571198,-0.03786281,0.019755617,-0.0060643917,0.039039534,0.025095722,-0.022933593,0.0003316461,-0.059833635,-0.041401695,-0.08751725,-0.03567778,-0.005970002,-0.06161207,0.02180057,-0.055588428,-0.05784136,0.01395573,0.038145542,-0.029782804,-0.01723793,-0.023930507,0.11383405,0.110279925,-0.014426435,-0.035059985,0.07753637,0.05141917,0.0044595106,-0.0015667346,-0.09563759,0.05867153,-0.082783066,-0.03241495,-0.0014397805,-0.023234097,-0.06543304,0.004649752,0.004748929,0.030385088,-0.0862241,-0.04023966,-0.069567725,-0.030298177,0.09191455,0.043197054,0.095462866,-0.044701345,-0.099886924,-0.0059701796,-0.11354347,0.004442741,0.04577666,-0.038983077,0.023630451,0.006663126,-0.097253166,-0.0027937705,0.045076374,0.04973947,0.0059027383,0.051472,0.024630526,-0.07089036,-0.029635621,-0.013164053,0.091757216,-0.0064823325,-0.037979603,-0.025817495,0.1152116,-0.04569812,-0.030781759,-0.039159972,0.041895427,-0.030728307,0.009752389,-0.013452352,-0.06348715,0.0009984222,-0.06616014,0.05157471,0.060029283,0.0043587885,0.011642287,-0.04633196,-0.008039499,-0.010982927,-0.053728964,-0.091402866,0.035425775,0.053001776,-0.054876756,-7.374804e-33,-0.048071742,0.025017282,-0.011417668,-0.0155023215,0.010022769,-0.012845528,-0.043144442,0.036716852,-0.078034535,0.06511902,-0.035796538,-0.016785005,0.05778213,0.008420637,0.07347443,0.06353612,0.04439817,-0.0033536777,0.061085485,0.024326598,0.025211066,0.09054322,-0.0001985406,0.004151721,0.07386945,0.067136124,0.09183652,0.05363104,-0.016578645,0.08703502,-0.016735349,-0.060572937,-0.09453106,0.0770274,0.017415354,-0.029031038,0.05154211,0.0039755614,-0.030430006,-0.061820734,-0.010617989,0.042069413,-0.027402466,0.045241687,-0.01838317,-0.12575391,0.018645449,-0.03717489,0.027866218,-0.012835895,0.039637104,-0.029492706,0.0077484134,-0.0091293845,-0.06022723,0.017625831,-0.028936587,-0.0070667816,-0.031357393,-0.022248048,0.022771074,0.011096739,-0.07444609,0.07806589,-0.04260928,0.024891557,0.00028428668,0.043069113,0.03588975,-0.07674812,-0.014524283,0.021627711,0.14038023,0.093007945,-0.03571615,-0.0338738,-0.054194245,0.028984163,0.1083843,0.004391224,-0.012703135,-0.025295842,-0.042779002,0.035873927,-0.018923482,0.06832656,-0.0094572045,0.044555146,0.036809824,0.019350005,-0.0023179108,0.071361005,0.06186285,0.058131736,-0.09898514,-2.7204463e-08,0.02408579,-0.08408476,-0.0036295739,-0.018235775,-0.022039553,-0.058809593,-0.031317573,-0.12565261,-0.058877863,-0.00081973517,0.09802296,0.050017025,-0.028735831,0.03750839,0.012065592,0.004378418,0.052041642,-0.0035824657,-0.035261545,-0.045564957,-0.009692666,-0.07189299,0.02292714,-0.0076898416,-0.053742934,0.0827872,-0.07177912,-0.050013594,-0.04793147,0.00097096374,-0.020460166,0.041693084,-0.038336903,-0.011502166,0.046489626,0.0509261,0.034368616,0.027930558,-0.029989155,0.016594294,0.02426833,0.02695843,-0.013093568,0.031624928,0.0576066,-0.028833097,-0.05009992,-0.1624721,-0.0025556856,-0.07266794,-0.0417922,-0.060454432,0.007988677,0.0636382,0.008666988,0.03984623,-0.01660769,-0.017876454,-0.040175967,0.044920813,0.04924787,0.1109603,0.006096212,0.024222204]	11
31	[-0.015490344,-0.02601832,0.059057586,-0.09694616,-0.0802145,0.044831824,0.05471798,-0.018967789,0.031745184,0.06814353,0.13595125,-0.09124963,0.007831333,-0.07157052,0.030087955,-0.025531359,0.0026466427,0.049637333,-0.071556315,-0.07850132,-0.009672526,-0.005448152,-0.037967134,0.0048324754,-0.058336083,0.031196283,-0.016268902,0.101375826,-0.010106949,-0.07147275,-0.009599175,0.15186286,0.014144525,0.0034998662,0.05232999,0.054682475,-0.0238713,-0.06080423,-0.034219798,0.032371324,-0.071662836,-0.00696283,-0.027112694,-0.04282416,0.050509933,-0.010670046,-0.049403463,-0.05360521,0.07340192,-0.049758513,-0.07245158,0.11143193,0.037136037,0.09932202,-0.09766771,-0.011377461,-0.0187196,0.06633364,0.08239539,-0.04522764,-0.09203032,0.007082859,-0.005063038,-0.04450354,0.0146663105,-0.004443976,-0.039363213,-0.047270384,-0.018435657,0.096365996,-0.019026414,0.028373636,-0.07085606,0.080258064,-0.050688013,0.0473144,0.005260989,-0.026022157,0.006937843,-0.058269914,0.011172334,0.05832815,0.022150442,-0.06394632,-0.047605168,0.03667914,-0.015924964,-0.0073908037,0.013794141,-0.052387614,0.03176716,0.02997606,-0.039986745,-0.028151143,0.04272222,-0.03638982,-0.024381218,0.0925387,0.0049326727,0.021421527,0.09392382,0.0060566417,-0.031037169,-0.07970742,-0.068790436,0.05702035,0.07739388,-0.011133073,0.047868747,0.016355583,-0.06837638,-0.032431383,0.0040321387,-0.10122512,-0.057410646,0.04764845,0.015118899,-0.040863458,-0.059309196,0.009682986,0.001888756,-0.09309773,-0.03161772,-0.015097193,-0.04414406,-0.097749144,0.036588494,1.8739099e-32,0.053617522,0.015448458,0.046879638,-0.09787877,0.044927347,-0.036235053,0.012835633,-0.0017222193,-0.07890067,-0.014973328,0.0076267943,-0.050298423,-0.08249588,-0.08799159,0.033509217,-0.0513908,0.021450473,-0.113517396,-0.04220211,-0.011625244,0.014606263,0.04228549,0.010724734,-0.03789956,0.025350865,-0.003432083,-0.024269808,-0.031712096,0.011003906,0.046986066,0.03312354,-0.008800701,-0.011813276,-0.0015674665,-0.11155945,-0.022898383,-0.034646485,-0.033446956,-0.04031492,-0.000668336,-0.0063839504,0.012645602,-0.018827168,0.044262804,-0.019644475,0.025741514,-0.013650172,-0.025433294,0.026177268,0.004550887,-0.02340813,-0.010208571,-0.12577091,0.020135975,0.103325285,-0.03011438,0.02212068,-0.03193587,0.006084674,0.049335033,-0.018693753,0.0157043,0.019789906,0.0805681,-0.041330602,-0.04231588,-0.0075901495,0.0052762968,0.08405119,-0.073596545,-0.05675567,-0.068280496,-0.022564134,0.049175173,-0.045768503,-0.03891913,0.047401346,-0.042310566,0.018104112,0.019803917,0.024933659,-0.005323184,-0.017688962,0.022901397,0.026906576,-0.023802552,0.033467364,-0.087858476,-0.0474672,-0.020411426,-0.016692337,0.038732186,0.096826985,-0.021042882,-0.080165684,-1.6253458e-32,0.030239778,0.09172407,-0.017152822,0.05792975,-0.026374646,-0.02070185,0.06798456,0.0154317785,0.033708286,-0.065971196,-0.052637808,-0.05964276,0.016954452,-0.031099537,0.037202414,0.0220008,0.05839312,0.020058803,0.03355431,0.06871665,-0.016004514,-0.00085551623,-0.02287359,0.0116687985,-0.0069965925,0.023987543,0.056791376,0.08278845,0.04917673,0.10245654,0.02434538,-0.07160615,-0.11887664,0.0932979,0.017696597,-0.070625365,0.06806795,-0.022130078,-0.047825478,0.017422704,-0.05050075,-0.04209441,-0.0065473444,-0.048498232,-0.06256082,-0.045538504,0.06491415,-0.0094767045,-0.09177999,-0.021977833,0.10390123,-0.0034737913,-0.0456243,0.015185193,0.0035249868,0.034217007,-0.026763944,-0.05329061,-0.08817212,-0.05645785,0.010954736,0.031023039,-0.02177867,-0.0125355795,0.01145971,0.03906384,0.06199055,0.033191267,0.05745522,-0.08523783,-0.11063898,-0.025214154,-0.0007116027,0.0047759037,-0.0022662892,0.02467259,-0.058611356,0.052909736,0.038147412,0.0029753998,-0.11859615,0.0050076023,-0.063121036,-0.0077148178,0.01341918,0.15861706,-0.04566487,-0.008586454,0.030329399,0.039357062,0.057519704,0.03523373,0.059801724,0.08714731,-0.029768331,-5.1645912e-08,0.015925875,-0.076923005,0.008815251,-0.002832999,0.06720354,-0.03726647,0.030693142,-0.0575776,-0.02433571,0.02066354,0.09951083,0.061031677,-0.021394664,-0.026460206,-0.036229618,0.082340114,0.044925783,0.02762939,-0.010444532,-0.054746356,0.031726517,0.024305439,0.023094775,0.04455227,-0.04808735,0.05181912,-0.07378609,0.031484444,-0.06482201,0.007119768,0.04428141,-0.039921913,-0.05372991,-0.059065532,0.12750582,-0.03665521,-0.0036451805,-0.005979123,-0.04294163,0.07120702,0.072911024,0.06991814,0.030549638,0.029811176,0.06762274,0.02155796,0.062589265,-0.08417651,-0.005225167,-0.060978435,-0.0033514118,-0.0020679142,0.033027336,0.026073953,0.0059880204,0.060951095,0.016434053,0.06568677,-0.008144954,0.032258324,0.051868513,0.08712859,-0.0691465,0.013831849]	11
32	[-0.023075467,0.023366345,-0.017643012,-0.0807887,0.0046147476,-0.06498238,0.058094177,0.046227664,-0.011240124,0.008594966,0.10615317,-0.053825945,0.026220977,-0.034910727,-0.0009903545,-0.03895014,-0.018830765,0.046175163,0.00069849,0.022853855,-0.025159607,-0.024718033,0.04504448,-0.016568348,-0.08766736,0.033575866,0.014768152,-0.071255304,0.027465396,-0.10841287,0.012025809,0.040612023,0.015686285,-0.037540734,0.038102143,0.02919374,-0.033455234,-0.023594528,-0.095684,-0.031173533,-0.065121405,-0.08886873,-0.0073731984,-0.06031219,0.059694473,0.07335728,-0.033550505,-0.01465067,0.018900892,-0.008804357,-0.1206995,-0.03158145,0.05048219,0.011629727,-0.04965574,-0.03742973,0.055538375,0.025414996,0.07939932,-0.023546424,0.06870456,-0.0033413244,-0.022310842,0.028188037,0.02949698,-0.018788898,-0.020012166,-0.11842417,-0.044811998,0.051200215,0.057710767,-0.06463645,0.0056382874,0.020753706,0.017222753,-0.038081802,0.01663614,-0.009205715,0.05892286,0.048483994,-0.032940403,0.0017021057,-0.053199384,0.0585441,0.02458816,0.06576391,0.02755862,0.0002448559,0.039096825,-0.04073671,-0.074877106,-0.041391462,-0.050490163,-0.050622437,-0.04887916,-0.026427235,-0.057630274,-0.05050948,-0.015965596,0.094684385,-0.014002819,0.044547986,-0.025459923,0.047118656,-0.032525774,0.09067427,0.055266105,-0.014043099,0.08991349,0.062843986,-0.026415791,-0.09276344,0.06769388,-0.028041674,0.02261374,-0.027121086,0.01703226,0.080256745,0.0019391971,0.004402899,0.06659197,-0.030538881,-0.057567246,-0.028821371,0.07302588,-0.025068173,0.031062318,-2.8654995e-33,0.00086658885,0.0028236785,0.016935041,-0.045716017,0.02143022,-0.03984379,-0.0028670118,0.028217444,-0.093721114,-0.03595876,-0.075354174,-0.042406,-0.080542535,0.025320595,0.060704228,-0.047635842,0.11537598,-0.036765557,0.03135722,-0.035987917,0.059630506,0.012927955,0.021185063,0.016933667,0.059804328,0.03526655,-0.0075157285,-0.016706195,-0.010736246,0.05357967,-0.044387516,0.010436907,-0.04449936,0.057898745,-0.030377222,-0.04871226,-0.01906374,-0.009881611,0.02167804,0.029732103,-0.0014064368,-0.004737264,0.0033302743,-0.11165953,-0.07275631,0.012948695,0.049216326,0.02207927,0.031198034,-0.019265246,-0.013380459,0.019651614,-0.10554183,0.035621665,-0.0055252505,-0.033102073,0.047467414,0.014433653,-0.04940415,-0.009379075,0.052737847,0.04390274,0.03452419,0.069379844,0.026840458,-0.06322454,0.017762272,0.05190596,0.1192178,-0.021664731,-0.101372235,-0.0013503878,0.06023818,-0.021826647,-0.02891103,0.037268937,-0.0067108544,-0.04747655,0.03817135,-0.032111596,-0.060815867,0.0007292431,-0.03236783,-0.032371666,0.073255315,0.02997817,-0.014220352,-0.008482689,-0.0037594766,0.007532797,-0.027207594,-0.088516586,0.027848799,0.043285493,-0.13382144,1.9370599e-33,-0.019813692,0.03227686,0.05903096,0.0023531409,0.03375912,-3.7631185e-06,-0.03665493,-0.001248386,-0.09933419,0.05371095,-0.04729083,-0.05647206,0.04719487,0.032177992,0.069322914,0.07966319,0.09850524,-0.08222358,-0.0005761188,-0.02442688,0.012897353,0.037978526,-0.06605812,0.0010842625,-0.039653827,0.043706987,0.09563539,0.025058517,-0.08151475,0.07036665,-0.08514081,-0.07665798,-0.012789421,0.03820907,0.09259397,0.04182285,0.041394886,0.028825326,0.010475981,-0.03891081,0.009061809,0.018324565,-0.029880852,0.09580248,0.05752699,-0.082337216,-0.010511714,0.028240256,-0.040724006,0.03659264,0.06355997,0.025040979,0.022060141,-0.07463054,-0.04445793,0.010538272,-0.035028014,-0.022347962,-0.06319881,-0.0185467,0.023049094,-0.011606011,-0.052050665,0.07539936,-0.016154213,0.05339813,-0.01459425,0.06172929,0.02504635,-0.118351154,0.06932401,0.026461432,0.0840586,0.031210432,-0.053862095,-0.063702725,-0.03272271,0.005798629,0.096287034,0.0186634,-0.055235915,-0.047189075,-0.011719597,0.10742421,-0.033799477,0.05125945,-0.04243343,-0.036993556,0.070342295,0.02351007,-0.016372884,0.123255536,0.045404743,0.019083673,-0.012640547,-1.2363854e-08,0.015288575,-0.080934174,-0.02313734,-0.041513287,0.059931803,-0.041955184,-0.028668037,-0.056267656,-0.04439867,-0.020920277,0.029246477,0.06390528,-0.009650436,0.06142868,0.068553396,0.05634658,0.10201103,0.050631132,0.002047001,0.0006408579,0.09342328,-0.0067117815,0.026967147,-0.01984513,-0.063796595,-0.051022906,-0.12780009,-0.05104541,-0.06801189,-0.00242071,0.0051361495,0.033665583,-0.031028567,-0.00027494584,0.059492316,0.021886691,0.020743173,-0.022032246,0.012608255,0.003508217,0.070475206,0.13797194,-0.009016634,0.009759654,0.015038685,0.02180947,-0.013151336,-0.15572158,-0.040523566,-0.037869357,-0.09799113,0.006522259,0.013442906,0.10825507,0.07157148,0.016832298,-0.016747428,-0.024034806,-0.042012252,0.08092911,0.09289712,0.10657557,0.064652555,-0.031906553]	11
33	[-0.11767116,0.058440566,-0.014250796,-0.07683392,-0.011243025,-0.021077646,0.082571745,0.028072933,-0.038605962,0.009310622,0.09637515,-0.08129678,0.032193396,0.0006526614,0.05232345,0.0021323098,-0.03333476,0.040419113,-0.00086942955,-0.04915258,-0.004229186,0.0036292525,0.09188233,0.087422594,-0.06485457,0.030731067,0.048457198,0.022795562,0.028205397,-0.062146526,-0.030900206,0.10269514,0.037135728,-0.018848252,0.06253356,0.044866476,-0.027721645,-0.097435564,0.03648322,-0.033447444,0.024015978,-0.019217344,0.084469974,-0.083751634,0.066350445,0.062461358,-0.095144734,-0.0037365777,0.11698737,0.020102514,-0.1316098,0.032765266,0.04589999,-0.00034171162,0.0032498525,-0.052037526,0.016363384,0.05652061,0.05469365,-0.07875456,-0.01705995,-0.03180773,-0.02011907,0.036856655,0.032544855,-0.04901022,-0.07353341,-0.087827496,-0.017834371,0.08070902,0.001191213,0.00089065795,0.029820241,-0.0007211954,-0.10916538,-0.01265183,0.062880665,-0.0266313,-0.041322757,0.043978196,-0.021233259,-0.039730124,-0.0101520475,0.037104923,-0.009135655,0.027201846,0.0041401857,-0.0016759859,0.008444109,0.026598116,-0.015700022,0.057114832,-0.02119861,-0.029997276,-0.15869097,-0.024448622,-0.0022736618,-0.0009219894,-0.05530999,0.14093944,0.007348161,0.010517816,-0.0051321513,-0.031993754,-0.017931502,0.030404234,-0.020094002,-0.04599959,0.09605402,0.014435041,-0.06045331,-0.098343864,-0.0042703636,-0.034730002,0.009326113,-0.013108388,-0.041085888,0.052089345,-0.046348438,-0.0025312735,0.0446071,-0.0704112,-0.03004313,-0.024191508,-0.013323175,-0.07300216,0.0013873754,4.0551657e-33,0.021292962,-0.051300988,0.06557551,-0.008972635,0.041402623,-0.0051484187,-0.0043125106,0.018522874,-0.052234925,-0.032604128,-0.06853393,0.006335427,-0.076674215,-0.008189228,0.0392155,-0.057227567,0.06598329,-0.058074843,-0.041167032,-0.0145589765,0.05943909,-0.01803835,-0.0039535514,-0.08484379,0.060418624,0.056231022,0.038772985,-0.027446631,0.039497115,0.06053387,-0.006745599,-0.0046218545,-0.028821155,0.027422983,-0.05479569,-0.09565474,-0.061699327,-0.062106647,-0.06372246,-0.06124776,-0.054676376,0.009215247,-0.025681622,-0.02447726,-0.023880824,0.000579789,0.03692967,0.029290617,0.044591334,0.0351111,-0.07229549,0.037247237,-0.07514372,-0.005146249,0.03824981,-0.12527305,0.030676855,0.0009383654,-0.08131968,0.00984849,0.057029072,0.05744816,0.011494984,0.0055159875,0.07909628,-0.013419063,0.024463914,-0.064578295,0.07690685,-0.0024220082,-0.03754781,-0.053589024,0.059472166,0.05454135,0.019478016,-0.020299595,0.038667362,-0.047693692,-0.039366677,0.027746802,-0.08878115,0.019071987,-0.03443845,0.0047747022,-0.043583445,0.025901018,0.042458367,-0.043482233,0.039393052,0.028718004,-0.0820842,-0.104305886,0.024190662,0.06457359,-0.0678703,-5.2559912e-33,0.032329183,0.0191118,0.021410873,0.038277652,-0.010426627,-0.08563509,0.041493785,0.05953071,-0.029596463,-0.058687437,-0.027916262,-0.024374751,0.05567121,0.0648617,0.115608506,0.08701028,0.08130722,-0.0041576806,-0.08578278,0.006400165,0.018699659,0.1225162,-0.06032243,0.03099082,-0.03147503,0.02965206,0.05691929,0.06594161,0.01002507,0.061424926,-0.057247337,-0.020288715,-0.08451431,0.07471029,-0.0069976323,-0.032382708,-0.0051106852,-0.027681533,0.0011599615,-0.009070234,0.07158377,-0.0313956,-0.02740066,0.017510481,0.030687824,-0.112278916,-0.070244506,0.037553947,-0.032993913,-0.006705556,0.0019180891,0.03748165,-0.039558973,-0.018748373,-0.013826573,-0.0033614538,-0.02814437,-0.051537406,0.011222693,-0.026995203,0.048599232,-0.06248176,-0.020415062,0.0626636,-0.053106505,0.029960293,0.041428693,0.016550593,0.08570231,-0.061658625,0.050232694,0.003994087,0.029593714,0.11226402,-0.048443057,0.027887026,-0.08547691,-0.006703915,0.032260504,-0.040692747,-0.019536493,0.0372078,-0.050102998,0.091355145,-0.040424753,0.054178443,0.09019568,-0.1133535,-0.024784971,-0.00450765,0.06312633,0.052680317,0.027509538,0.08181908,-0.100545414,-2.3515332e-08,0.004478349,-0.06883432,0.04694243,-0.017255452,0.062345758,0.023745906,-0.038100757,-0.04930866,-0.01718549,0.004177606,0.087447286,0.02599358,0.061078124,0.072096735,0.022761315,0.027086006,0.03844771,0.008962095,-0.024712663,-0.07620247,0.035633806,-0.052869193,0.0017877483,-0.027513308,-0.04004133,0.032576825,-0.107382074,0.06709729,-0.059522018,0.0072283735,0.016126996,0.010963686,0.0001897859,0.057428204,0.074133895,0.04608493,-0.040962,0.009459735,-0.059024297,0.003538364,0.013765146,0.0061304974,-0.0050699804,0.036009803,0.0129279485,-0.020998308,0.088160686,-0.12996988,-0.024286322,-0.003979836,0.015991462,-0.040439617,0.046737976,0.0045004007,0.05380836,-0.0032795046,0.010287283,-0.060654573,-0.049996782,0.09212155,0.08486665,-0.027013764,0.004527306,-0.029887747]	12
34	[-0.06848103,0.074194595,-0.07104325,-0.052027695,0.03492444,0.003032864,0.09432772,-0.019755568,-0.07471821,-0.055408638,0.017195996,-0.050602023,-0.054401387,0.030434983,0.022958234,0.052582223,-0.01964551,0.048485346,0.010848252,-0.08794291,-0.089091875,0.013260959,0.033294324,0.0644238,-0.0026484085,0.031457096,0.017938958,0.065422535,-0.011144976,-0.054072067,-0.016884174,0.02432819,-0.02942483,-0.07133205,-0.025085289,0.008222856,-0.036159884,-0.008138292,0.03978352,0.010211224,0.018639252,-0.07560254,-0.017756717,0.008389202,0.018981094,-0.0448211,-0.01125444,0.06746927,0.08023899,0.014453564,0.024619194,-0.017552773,0.04027914,-0.029036084,0.0292572,-0.05249387,0.098399594,0.03237219,-0.013555323,0.046555232,0.020606743,-0.03255513,-0.058059756,0.07633928,0.0960654,-0.029527698,-0.062367696,0.045636628,-0.035966452,-0.000726369,-0.0054977653,-0.07902788,-0.039108355,-0.007827158,-0.024395505,-0.0616341,0.018435048,-0.029975096,-0.011154274,0.14479238,0.02319771,-0.065639876,-0.068232566,-0.016049547,-0.023927592,0.018147944,-0.007939072,0.032413278,-0.05736398,0.037965853,-0.08045739,0.02256356,-0.0011852554,-0.00842981,-0.08590661,0.0064333198,-0.013705362,0.010135957,-0.038721148,0.20189175,-0.0466678,-0.030000022,-0.0460002,-0.06902828,0.029699374,-0.05007715,0.0016016011,0.010971238,0.03456595,0.01596152,-0.0121904425,-0.026266884,-0.04911169,0.031124666,0.0188005,-0.0015559784,-0.04398427,-0.01725868,-0.06944233,0.00029677743,0.032017518,0.071670346,-0.021600079,0.008823544,0.024380486,-0.031411193,0.01819059,-3.163371e-33,0.018089548,-0.11711621,0.0723458,0.06133633,0.04757592,0.09734523,-0.00788411,-0.014707816,0.0064813183,-0.01083816,0.004474613,-0.031192385,-0.07923128,0.0013327254,0.034103774,-0.008367435,-0.01269579,-0.008078858,-0.003590569,-0.05476186,-0.008141749,0.07347532,-0.07531655,0.016814793,0.024032926,0.009389047,0.0033708226,-0.002515179,0.080866545,0.044305455,-0.013734036,0.0218507,-0.006740796,0.022696873,0.02511639,-0.07622281,-0.08430531,-0.0460071,-0.018849129,-0.07469074,-0.096035175,0.07017342,0.062299397,0.019345356,-0.07990921,0.06235865,-0.014978212,-0.04682802,0.015633594,-0.03498944,-0.07627239,0.0022390187,-0.047304798,0.058575593,-0.006427485,-0.10697968,0.002198677,-0.023343796,-0.064260714,-0.08500307,-0.017376335,0.13950494,-0.022839537,0.0654741,0.053358216,0.04178363,0.018154977,-0.022451643,0.07142316,0.017462356,-0.05005444,0.052978143,0.06908622,0.004691205,0.079819664,0.0330733,0.07120974,0.034455646,-0.05538367,-0.017253926,-0.029532924,-0.009896153,0.048264064,0.021350686,-0.02647931,-0.02736653,-0.06468602,-0.04446352,0.110098265,0.018167408,-0.06496703,-0.041048113,0.045123357,0.03908671,-0.07421753,9.389023e-34,0.020587964,-0.050621763,0.138594,0.05209768,0.11174494,-0.057844106,-0.03070793,0.056951012,0.0080017,-0.055633433,-0.057531614,0.0069656856,0.023931734,0.087477915,0.07313299,0.049143493,0.018798022,-0.02829774,-0.01005513,0.00869586,0.03712507,0.026667962,-0.043172996,-0.12490355,-0.0048891245,-0.033845924,0.035903573,-0.06918812,0.0517191,0.062548384,0.0057961363,0.054015756,-0.038299575,0.019384274,-0.0888863,0.04767637,0.016774246,0.047452632,-0.057897743,0.018641885,0.058937944,-0.0004482839,-0.047154926,0.016734416,0.03485723,-0.08312127,-0.071825325,-0.009788743,-0.06449786,-0.007788008,-0.105326,0.096979685,-0.017505549,-0.012128377,0.02205215,-0.03883679,0.03839941,-0.08613539,0.01650242,0.02455591,0.011908518,0.00025285472,-0.058168616,0.0111326985,-0.07679812,-0.022876034,0.013943211,0.05830267,-0.009671831,-0.038959898,0.08408015,-0.027279157,0.06126284,0.13620453,0.03220835,0.0024392565,-0.13206805,-0.03379533,0.010740428,-0.020437047,-0.044014685,-0.022563238,-0.03187776,0.124798425,0.054473974,0.0025001396,0.060801696,-0.04381258,-0.020314312,-0.018906059,0.05426645,0.00960679,-0.036732294,0.058720347,0.0016370645,-1.2944242e-08,-0.022526586,-0.010095613,0.021726731,-0.04526092,0.070692636,0.023350993,-0.023600096,-0.0124585265,0.054016184,0.0367799,0.041852485,0.07656768,0.026388938,0.0123904515,0.038808998,-0.069494285,0.016347347,-0.054501783,-0.02200953,-0.0012697903,-0.035426494,-0.007270929,0.013611007,-0.08401697,-0.06845994,0.039689925,-0.08153651,0.08490355,0.010217662,0.07839646,-0.0049493513,0.11115004,-0.049197488,0.061022524,0.030362412,0.004098395,-0.07532925,0.016634783,-0.0279429,-0.027902193,-0.023367435,-0.038912177,0.049578596,0.04846213,0.03322004,-0.040583216,0.09741461,0.0045074276,0.017781738,-0.058732398,0.06278475,-0.003955666,0.060576703,0.04859648,0.059026092,-0.00407438,-0.030025776,-0.01778718,-0.070573255,-0.05235057,0.077054515,-0.10126932,0.039144024,0.017542105]	12
35	[-0.0492707,0.037926342,0.03062556,-0.08441982,-0.046192914,-0.027869178,0.07187617,-0.03679841,0.009212754,0.032199252,0.16249779,-0.05399802,0.027980361,-0.053889196,0.051437154,-0.0020243532,-0.049885422,0.054157656,-0.10725795,-0.08989987,-0.017950948,-0.039454866,0.018413477,0.017880764,-0.074229084,0.08782603,-0.009529541,0.06443428,-0.045209415,-0.025924973,-0.042410705,0.17161952,0.0013100674,-0.04775266,0.026014218,0.05782851,-0.021478347,-0.039310668,0.026182909,-0.005270112,0.009195694,-0.006467447,0.016036117,-0.058161218,0.029616449,-0.009218406,-0.061363157,-0.027690727,0.07696033,-0.047842316,-0.10597988,0.11244205,0.028067911,0.08692502,-0.10109591,-0.052500702,0.020215053,0.049672768,0.056429185,-0.01449019,-0.06707962,-0.012279486,-0.034957115,0.03579065,0.053963307,-0.006378292,-0.10438493,-0.06511405,-0.004091971,0.12675107,-0.0092827855,-0.0037461198,-0.04569939,0.06846639,-0.088914156,0.037750404,0.05402158,-0.042301722,-0.039962664,-0.022713443,-0.04423217,0.020190455,0.080878414,-0.055293083,-0.05566238,0.031177063,0.008464426,-0.022590745,-0.0168634,-0.0120829055,0.040314075,0.07644536,-0.04954255,-0.07587901,-0.015060943,-0.051079202,-0.01029545,0.048094336,-0.019017009,0.012248785,0.0688052,0.0025678226,-0.023681493,-0.07875694,-0.034216527,0.016597174,0.03499993,-0.01854892,0.036286857,0.025104385,-0.113039955,-0.04689224,0.014542799,-0.055985656,-0.041412342,0.034232963,-0.007869497,-0.004330875,-0.041122817,0.04786985,0.0029613147,-0.056283455,-0.013408034,-0.031980585,-0.038515087,-0.09879721,0.023283767,1.7693614e-32,0.018283246,-0.007971512,0.04971384,-0.13276634,0.068574466,-0.028231142,-0.00071519514,0.0031949102,-0.06766511,0.020142082,0.0170018,-0.06068793,-0.07764851,-0.061067227,0.027009007,-0.06551443,0.009724203,-0.07626853,-0.03886747,0.007361862,0.057311505,0.014195759,0.017539045,-0.07269776,0.022840107,0.009013414,0.0015962058,-0.003968054,0.017046478,0.0610668,0.025855698,-0.0021661315,-0.007789418,-0.0596083,-0.10219986,-0.04935434,-0.041551024,-0.05614474,-0.008887819,-0.041881084,-0.021093426,0.0006567881,0.0064971093,0.021575078,-0.012322213,0.065944895,-0.025137288,-0.026241548,-0.0011455833,0.0155876065,-0.03797873,-0.026638476,-0.078988746,0.04836964,0.07693079,-0.03582607,0.039634623,-0.01011877,-0.010718463,0.023810549,-0.015935406,0.020598177,-0.002848075,0.04712027,0.0251221,-0.024013013,-0.021242896,-0.03163596,0.06765139,-0.08673928,-0.054408878,-0.052532125,0.004550888,0.061711892,0.0017823213,-0.051068593,0.038992483,-0.043832824,-0.006038824,0.025449116,0.011353866,0.03131076,-0.014888318,-0.03576682,-0.03235651,-0.021194333,0.057978857,-0.09088899,-0.0393628,-0.004027581,-0.052437834,0.036006514,0.076967455,-0.0031342828,-0.08257355,-1.5591866e-32,0.030315889,0.071124375,0.041688867,0.08124016,0.02212972,-0.04710187,0.0737313,0.039731517,0.045051135,-0.080887556,-0.010067694,-0.06631107,-0.02313504,0.023123953,0.035511382,0.05955312,0.07083878,0.04721865,-0.017143821,0.056041736,-0.014787926,0.04089503,-0.012249631,0.016561165,-0.0753756,0.032713152,0.06548411,0.05575691,0.058247052,0.04331109,-0.010340857,-0.03978409,-0.12745145,0.11533678,0.02014125,-0.06908143,0.06643315,-0.009442348,-0.047728732,0.051368736,0.023179822,-0.038852017,-0.017230392,-0.065480985,-0.010225359,-0.061253488,0.0902284,0.01154059,-0.124748446,-0.05029454,0.08326462,0.003534599,-0.0689528,0.04242313,0.020310936,0.01096579,0.03032384,-0.05665126,-0.08007222,-0.058260575,-0.012689252,0.033693064,-0.0030445312,-0.02468806,0.031334642,0.008241399,0.09607986,0.033961404,0.059850458,-0.046638712,-0.12153212,-0.029766714,-0.004098695,0.031645384,-0.0054172073,0.046539124,-0.078370325,-0.0055380226,0.0024093674,-0.032976855,-0.09015919,0.030622639,-0.05680369,0.032122485,0.026539236,0.09296138,-0.033700306,-0.10354072,0.014913869,0.031074256,0.057166878,0.028075919,0.0361905,0.08762005,-0.03371046,-4.6777302e-08,0.0008082602,-0.054399025,0.023263277,0.019261517,0.103504516,-0.010371053,0.022291716,-0.051173244,-0.0026454597,-0.006583303,0.10303274,0.07905544,0.017813234,0.012847538,-0.082847424,0.054719497,0.06754873,0.011491922,0.011695833,-0.06259339,0.06041453,0.01641527,0.02606191,0.018712929,-0.038991634,0.05260192,-0.09224034,0.062495057,-0.054959424,-0.0047612507,0.03134754,-0.032805793,-0.022256626,-0.008905027,0.115446724,-0.036643073,-0.013368234,-0.01393108,-0.044677313,0.05979487,0.064571284,0.037848826,0.0063622133,0.020864433,0.07923765,0.01607828,0.07998893,-0.036707096,-0.00811554,-0.014708211,-0.033401232,0.0075610434,0.09265969,-0.028835144,0.031947125,0.0055702114,0.00694537,0.02514047,-0.01766628,0.029806728,0.102459274,0.039891407,-0.066269435,-0.02001553]	12
36	[-0.055306654,0.12593389,0.006906869,0.0017636669,-0.072319224,-7.782231e-05,0.09319182,0.085110754,0.06620845,-0.0923515,0.13441277,-0.16869,0.036237273,-0.058727317,0.010393311,-0.020165082,-0.035525046,0.047502782,-0.059455976,-0.15128104,-0.13990803,0.03835315,-0.009166842,0.010658605,-0.04706197,-0.07129766,0.063344404,0.039639667,0.058388837,-0.053706575,0.01732698,0.13535713,-0.04690528,-0.009358859,0.012579345,0.08139907,0.006375534,-0.07354393,-0.023426898,0.0154647045,0.020480892,0.022072455,-0.021135524,-0.06987172,0.0883223,0.10938111,-0.01201655,-0.0011364372,-0.02586566,-0.04492923,-0.018107483,0.041011486,0.01216189,0.04756548,0.0009461514,-0.040442515,-0.004220549,0.08997075,-0.00881461,-0.020906802,-0.017424893,0.03463387,-0.025301836,-0.026031632,0.0006271783,0.017007561,0.02516504,-0.03771322,-0.0149000995,0.017008279,-0.022711398,-0.035748564,-0.039254166,0.013556014,-0.03886047,0.021692323,-0.07651988,-0.0020691392,0.078865044,-0.11795786,0.031102644,-0.018863423,0.02956098,0.023821687,-0.00084890897,0.04801933,0.0001353555,-0.015553012,0.032435585,0.021246467,-0.013549449,0.018344194,-0.024177125,-0.010804976,-0.067348585,-0.025494577,0.022888983,0.013994445,-0.046052214,0.12243716,0.07478244,0.08628697,-0.033397123,-0.036964092,-0.04974719,-0.002743564,0.02588055,-0.012773391,0.01564199,-0.030679446,-0.044696987,-0.03450616,0.041526992,-0.075023875,0.024765337,0.01999168,0.0128961075,-0.035479706,-0.015397364,-0.0020786114,0.0036506238,-0.0049349023,-0.073538005,-0.002048169,-0.0028160233,-0.042918626,0.06837533,-2.9148745e-34,-0.015237633,0.008199695,0.03778384,-0.012638232,-0.029540623,-0.050461657,-0.046792287,-0.07243943,-0.10686594,0.0056004706,0.00613308,-0.03454281,-0.10118819,-0.025743207,0.13220318,0.051507458,-0.07834192,0.013935976,-0.014758112,-0.04517582,-0.03487441,0.0080979075,0.002518118,-0.036020856,0.100453645,0.06141397,0.019558337,-0.06917014,-0.09951369,0.027296104,0.016513666,0.0073624756,-0.023991005,0.022543725,-0.16154684,-0.015044848,-0.06566256,-0.01125667,-0.037151217,-0.0054125157,0.08526979,-0.02126275,-0.0031661906,0.0006707478,-0.031141652,0.06395763,0.04478373,-0.035520177,0.025687713,-0.04768213,-0.033099145,-0.017318401,-0.015149729,-0.005012306,0.034161627,-0.036809117,0.04366058,-0.015790427,-0.06310429,0.05244554,0.048066426,-0.019327618,-0.09714004,0.06730902,-0.052925654,-0.08457294,-0.034221,0.007721916,-0.0064605405,-0.07250078,0.0058579175,-0.025661878,0.08510769,0.002857857,-0.07078897,-0.061684374,-0.012931629,-0.024032371,-0.07744299,0.06659172,-0.08606988,-0.026810372,-0.003009425,-0.03794294,0.063129894,0.009767869,0.057233464,-0.049294226,0.042443085,0.04075344,-0.061651748,-0.0009329619,0.049168125,0.03806339,-0.03980644,-2.5619872e-34,-0.042229496,0.055743244,-0.029340142,0.0020392134,0.01861331,-0.028504731,0.04607526,0.055221528,-0.0067912093,-0.032875758,-0.03276459,-0.032578707,0.09087615,0.050530903,0.032098956,0.08681364,0.123598866,0.010507037,0.010672717,0.044607934,-0.037603635,-0.031212125,-0.008096443,0.094553486,0.024958726,0.05586448,0.07799009,0.011658808,-0.011519197,-0.018888067,-0.011248361,-0.06610124,-0.033331938,0.05721575,0.022018312,-0.014283223,0.10512492,0.014918825,-0.04235933,0.031994518,0.014576971,0.0128494315,-0.055569086,0.092049226,0.026727354,0.04029039,0.06284779,-0.013598515,-0.0025121134,-0.018324975,0.038190223,0.047176432,-0.025784554,0.007966678,-0.028738312,0.061972536,-0.07069847,-0.022511356,-0.0685138,-0.10071227,0.017592046,0.028567096,-0.049346305,0.020333592,-0.070422076,-0.0028273591,0.0018500128,-0.040824573,0.054608297,-0.068488255,0.09355617,-0.014336634,-0.018873248,-0.0009836523,-0.061521705,0.02017793,0.016396444,0.11177351,0.078443214,-0.009290631,-0.07461543,-0.033818614,-0.0063607115,0.025309874,0.026527707,0.009429328,-0.015302488,0.035218388,0.050668746,-0.033105783,0.015281864,0.046762843,0.005886,0.07860529,0.010580783,-1.4699358e-08,0.071262516,-0.13006364,-0.056308113,-0.01220885,0.00827206,-0.10190953,0.00824148,0.04693852,-0.040540576,0.010068345,-0.0024809444,0.05276452,-0.052518368,0.025484879,0.030731618,0.04519475,-0.02736515,0.03488237,0.02265039,-0.08608008,-0.025045576,-0.032397207,0.026103519,-0.04041798,-0.042008884,0.07420576,-0.046830475,-0.023115883,0.012577532,0.006003438,0.055395212,0.009269775,-0.047939304,-0.0058996473,0.11315407,0.0314763,-0.012662397,0.038281567,0.03811252,0.020743221,0.02178162,-0.0027462412,0.08840035,0.02106256,0.005945071,-0.017721329,0.06772549,-0.04488104,0.08628063,-0.038336374,-0.069192365,-0.052280333,0.08926844,0.013445123,0.065058805,0.10400167,0.056683056,0.0016639602,-0.009063474,0.02714636,-0.006085861,0.05598653,0.0028773986,-0.02611734]	12
\.


--
-- Data for Name: product_image_embeddings; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_image_embeddings ("productImageEmbeddingId", embedding, upload_image_id, product_id) FROM stdin;
5	[-0.41619188,-0.13683115,-0.10703865,-0.22974588,0.2655553,-0.12698866,0.2312687,0.4319624,0.24998659,-0.020221673,-0.07145648,0.23563576,0.5515738,-0.054616194,-0.27334836,-0.09490619,1.0236559,0.13893446,-0.02110598,-0.19775164,-0.05415188,-0.08163737,-0.1325527,0.3721703,-0.16647123,0.23609252,-0.19890256,-0.25766695,-0.40552682,-0.1882541,0.39028102,-0.06119046,-0.04272209,0.12218742,-0.13674246,-0.34685937,0.11249427,-0.14095227,-0.3776513,0.10860511,0.07093996,-0.11809699,0.27468634,-0.06162086,0.06595199,-0.30834028,0.33197653,-0.091767296,0.14077199,-0.509441,0.20442419,0.19105013,-0.03921626,-0.14371885,-0.37930247,-0.0073258695,-0.046500053,0.25260127,-0.12469191,-0.032372944,0.6665323,-0.007990874,0.0030208577,-0.15497783,0.009956113,-0.17027445,0.07679735,-0.49720794,0.11878494,0.10315598,0.5130745,-0.3843643,0.14881016,-0.4087575,-0.17666501,0.537808,-0.5593028,-0.16540316,-0.08839935,0.38129556,0.12574026,-1.0121413,-0.015059723,0.03362243,0.31402865,-0.41196004,-1.1277574,0.3886622,-0.20594235,-0.021066744,0.12027574,0.21675022,-4.7748075,0.06665189,0.24359417,0.39718437,0.16897564,0.58692724,0.25911584,1.4235989,0.05581906,-0.14397828,0.26813045,0.32875276,0.35569412,0.014448218,-1.3763555,0.13730526,0.039667938,-0.12878452,0.022827873,0.6449364,-0.1737606,-0.16975787,-0.013838312,-0.30209967,-0.11187481,0.01921318,-0.6756175,0.00470663,0.10961224,0.63144463,-0.05278428,0.3624361,-0.049520206,-0.036380026,0.33203676,0.46000412,0.40610936,0.3075744,0.11652867,-0.8310829,-0.16717605,0.70912856,0.062316116,-0.16404422,-0.5590915,-0.39422002,-0.37704223,-0.23366097,-0.02238912,-0.473136,-0.40509546,-0.6144935,-0.37173846,-0.22793959,0.026059022,0.03024873,0.2152203,0.13125741,-0.24817315,-0.10197564,-1.743036,-0.1326161,-0.32318607,-0.56440836,-0.19379362,0.077567935,0.26634195,0.1655833,0.46911934,-0.17688383,0.22634883,0.2502822,0.5862949,-0.038650975,-0.1620212,0.03272283,0.26563895,0.33009225,-0.009383321,-0.15152363,-0.078459114,0.13392387,-0.15116554,0.33339265,-1.1523553,-0.37119743,-0.8006655,0.06607372,0.43426126,0.2334084,0.28959852,-0.14355575,-0.32055327,0.16387698,0.12126208,-0.48004514,-0.29853705,-0.114842564,0.39850664,0.3990234,0.3996851,0.06762488,-0.45207632,-0.38608375,-0.07740149,0.026735129,-0.7474776,0.24361,0.09155339,0.18870582,0.040194478,0.20179498,0.25060186,0.5496837,-0.23592976,0.2892149,0.07365724,-0.03515,-0.6059829,0.044196498,0.08878577,0.12520602,-0.67158544,0.19302468,0.021433147,-0.03291846,-0.23076704,-0.19509238,-0.21126077,-0.45182666,-0.047845952,0.21961558,-0.08261492,-0.022702493,-0.45655298,-0.18597023,-0.29501244,-0.36725718,-2.5257687e-05,0.36173585,0.0102806995,0.10074194,0.60053664,0.53027904,0.41397825,0.35531518,-0.06711171,-0.10575563,-0.44922432,-0.026021602,0.53306663,0.027485564,0.06549108,-0.123077944,-0.38231605,-0.02531639,-0.13908158,-0.061598476,0.20595771,-0.116745874,-0.43399376,0.2280784,0.15511908,0.23626922,-0.6953465,0.1926897,-1.3501905,0.24286245,0.056252994,-0.0021168052,-0.19475083,-2.5838506,-0.19100669,-0.058674194,0.43938333,0.058235332,-0.26630732,0.32304108,-0.18123418,-0.5075954,0.10208272,-0.13481651,0.23825285,0.19641554,0.6055545,0.41820565,-0.17065848,-0.25117943,-0.016195731,0.045432683,-0.46887875,0.18579766,-0.012006911,-0.34347552,1.0944337,-0.1754008,0.13150923,0.23254578,0.17686363,0.008470068,-0.16984697,-0.23346865,0.15092377,-0.2707431,-0.16335753,-0.33261746,0.29198226,0.07171351,-0.52535903,0.13121155,0.06537961,0.35045236,-0.08637911,-0.3808429,-0.03956396,0.012381833,0.5481526,-0.0025604088,0.054671407,-0.12039146,0.70527303,0.50529045,-0.10655554,-0.06825708,0.14276822,-0.1680379,0.28513837,-0.48970744,0.24441947,1.2892592,0.32324386,-0.33788326,0.31509563,-0.16759087,0.2576923,0.22370356,-0.45563364,-0.3943495,-0.04570974,0.20816258,-0.16623597,0.38247052,0.046739887,-0.24659668,-0.003229231,0.19310558,0.33537975,0.40505865,0.012932543,-0.28861982,0.28368104,-0.053068597,-0.11291248,-0.2739953,0.142364,-0.10237455,0.13041474,-0.09829471,0.5119494,0.13459772,0.12057449,-0.33274972,0.43941733,-0.34285235,-0.42183545,0.36194703,-0.05374072,0.00031454297,0.09182223,-0.18218778,-0.20313296,-0.39053282,0.33559272,-0.054650895,0.17128506,-0.081263386,0.20073219,-0.24184601,0.2531854,0.31290388,0.5762854,-0.043056753,-0.34420502,0.37830904,-0.1904714,0.020391876,-0.05960906,0.21204269,0.14061664,-0.13367794,0.049854167,0.29970574,0.20309074,0.20723449,-0.17704645,0.05860014,0.028045373,0.17083229,-0.17203434,-0.2766819,0.04192825,-0.32406482,-0.21656175,0.36672556,-0.05588511,-0.019106284,0.1521469,-0.6369559,-0.12984666,-0.27261752,-0.5430859,-0.057969376,-0.40235743,-0.09229792,0.5822219,-0.15800543,-0.5624773,-0.12319669,-0.10677019,0.41669983,0.55808324,0.14935939,-0.3165773,0.1483374,-0.33655205,0.53514934,0.08906467,-0.45096284,-0.046382025,-0.22346616,0.036036715,-0.11010859,0.12492278,0.1468349,0.12066499,0.037132435,0.5209703,-0.32585263,0.35264415,-0.31431326,-0.39298284,-0.06204499,0.09398866,-0.26576203,0.035347413,-0.13979751,0.41368276,-0.16408408,0.29125994,0.24024741,-0.37144744,0.1784289,-0.11717457,-0.09569951,-0.18635699,0.40556273,0.1277021,0.29536274,-0.31331328,-0.0900065,0.020554788,0.42185926,0.1364356,0.3175383,-0.57458025,0.2446786,-0.120661676,0.2764036,-0.19488494,0.5060956,0.41438892,-0.24154511,0.25218865,0.212932,-0.36872938,-0.072146446,-0.1202345,0.1414979,0.43024155,0.8178711,0.119606495,-0.16181765,0.11496785,0.3894198,-0.022189608,0.19655901,-0.0068548233,-0.30648124,0.0597911,-0.77213556,-0.14819032,-0.00029852902,-0.20784225,0.32239264,0.45134386,-0.015665693,0.28162456,0.2949094,0.32091242,0.14045043,0.3965469,-0.25899425,0.117618114,-0.40063766,0.21301286,0.0495448,0.5292827,0.24726714,-0.070079155,-0.11144061,0.45698586,0.32098868,-0.13905002,-0.69811606,-0.079051845,-0.3573029,-0.13565093,-0.39529935,0.36213136,-0.042144436]	13	2
6	[0.049275704,-0.3752735,-0.0970825,0.1847042,0.20620166,0.2783063,-0.021576727,0.21918273,0.26636901,-0.13978463,-0.2838166,0.41817433,0.5553235,-0.21242066,-0.051189918,0.0015218818,1.0524266,0.06868329,0.17105503,-0.3411969,-0.19297001,-0.3428167,-0.5414247,0.3801937,-0.78415906,0.18012664,-0.28505018,-0.17544362,0.026423028,0.09702823,0.56106204,0.15694484,-0.6537813,-0.08412108,0.08875044,-0.15273407,0.23736784,0.14962192,0.03736762,1.034927,0.11125799,0.28247645,0.27662537,-0.32753697,-0.34400165,-0.44104576,0.30784625,-0.19181463,0.30468866,-0.4531658,0.12520552,-0.045363404,-0.11689119,0.30448484,-0.26474342,-0.15600683,-0.8045999,-0.13557073,0.3382713,-0.29237065,0.59876037,-0.38579893,-0.21837622,0.048016958,0.038120363,-0.107974306,0.44657943,-0.29003897,-0.10440366,-0.4670281,0.72918785,-0.4569854,0.15118061,-0.6835451,-0.3125095,0.46110705,-0.01789026,-0.14615178,-0.14368759,0.82549334,0.635607,-0.7801033,-0.20910768,0.07271505,0.12807849,-0.41250932,-0.2596064,0.122540526,-0.13975966,0.2562392,0.4516157,-0.05224106,-4.8503594,-0.11517848,0.094348185,0.46600634,0.14223295,0.750476,0.22612439,1.134741,0.23052336,-0.3512347,-0.38612828,0.45335853,-0.21222787,-0.16513693,-1.3155875,-0.0061202296,0.15196452,-0.04192495,0.2020485,0.95744413,0.20666084,0.23736513,0.0815728,-0.14453177,-0.14901432,-0.3318734,-0.034310035,-0.21588266,0.12119316,0.49949157,-0.12277269,0.21737692,0.24046259,-0.20450738,0.06405336,0.46371448,0.42047983,0.009236119,0.04823145,-0.34255692,-0.18868856,0.6827735,0.030319389,-0.15940826,-0.53813523,-0.4661446,-0.29873857,-0.13694327,-0.18869367,-0.1988469,-0.0040290835,-0.3519238,-0.61308783,0.13467629,-0.2926504,0.2035469,0.033363134,0.060911667,-0.32648873,0.18927929,-1.4063505,0.14701818,0.24866787,-0.59787315,0.074301265,0.06405201,0.16000901,0.045558106,0.27291563,-0.17254731,0.075021625,-0.31679833,0.42187062,-0.038486246,0.009800087,0.37574077,0.5308938,-0.15509698,-0.23833606,0.18053758,-0.1896885,0.4147276,-0.23132747,-0.2218263,-1.0263928,-0.32979774,-1.0478066,0.24517655,0.44378054,0.3130491,-0.17978123,-0.27749887,-0.16684939,0.5596666,0.16547213,-0.4558372,-0.13887562,-0.05104588,0.2063957,0.13836496,0.27657163,0.19063362,-0.13521014,-0.43279776,-0.17008258,-0.28365237,0.13773622,0.062721975,0.22886318,-0.30209768,0.02731467,0.14973153,0.5723499,0.28041694,0.06234978,-0.18700759,0.06404544,-0.17521095,-0.365867,-0.21162465,0.1460666,-0.3872255,-0.17830767,0.094046414,0.44428596,-0.09150316,-0.3088062,0.13272753,0.6492866,-1.5873228,-0.19262849,0.35750565,-0.17508432,0.25640213,-0.33723333,-0.08212591,-0.3848117,-0.5161188,-0.08544383,-0.20411192,-0.49659625,0.35170457,0.8106832,0.18715549,0.38984498,0.19984977,-0.0514996,0.036329437,-0.00064267387,-0.20115602,-0.04838675,0.23649466,-0.342091,-0.27848175,-0.012458696,0.15420213,0.031960435,0.033379827,0.2252573,0.034440137,-0.22613358,0.2775534,-0.30196604,0.41595188,-0.6379461,0.22376259,-1.2755165,-0.15796702,-0.057458077,-0.052350886,0.11328638,-2.0229933,-0.0029208874,-0.15647416,0.20481566,0.11056854,-0.58925563,0.14915328,-0.69564295,-0.013512846,0.15187098,0.16238762,0.18345155,-0.319026,0.5618895,0.024337547,-0.26756382,-0.11474847,0.16875751,0.056675956,-0.57833314,-0.27930427,0.1274265,-0.29279247,0.44526228,-0.42967096,0.23889029,0.089908235,-0.13266122,-0.12104348,-0.046509065,0.12637624,0.79220456,-0.22795095,-0.3097404,-0.087968655,0.17426899,0.4623745,-0.07741773,-0.12601091,0.27527732,0.44404402,-0.49483398,-0.09178453,0.43190062,0.16076209,0.4509794,0.049758427,-0.103393905,0.12629968,0.68084455,0.49198848,0.306125,-0.5953372,0.31946447,-0.17564264,0.32146284,0.24341972,-0.18759644,1.2553384,0.34625304,-0.4319668,0.35553688,0.0045118877,0.12126884,0.2325932,-0.18147333,-0.5886683,0.05510258,0.17198716,-0.066163115,0.35840663,0.5645006,-0.28849724,0.25707197,0.07580523,0.3266578,0.09728958,-0.14353582,-0.09944725,0.32405427,0.035375584,-0.16218847,0.1300968,-0.09848917,-0.21862797,-0.40611896,-0.103736445,0.20807187,0.5945352,0.3290773,-0.2530783,0.09170627,0.030446148,-0.14401558,0.98476934,0.04199501,0.047632232,0.09760913,-0.026330844,-0.12767106,-0.4780916,-0.020745244,-0.36710402,0.08431607,1.0126846,-0.13312489,-0.015794424,0.15959896,0.14650844,0.3511196,-0.0225062,0.097137764,0.48269033,0.15756036,0.058570456,-0.076980196,0.4296339,0.39167523,0.6314516,0.06315876,-0.0138551025,-0.0133455405,0.28261882,0.3666013,0.11497627,-0.623,0.63861847,0.40597224,-0.2503737,-0.04141897,-0.04184073,0.03700541,0.3555262,0.05351058,-0.18752107,-0.14839216,-0.41800985,-0.028797565,0.41444227,-1.4191595,-0.16920258,-0.17543876,0.21780294,0.52618337,-0.24424972,-0.05002696,-0.12539855,-0.3296274,0.5038034,0.53540313,-0.27000278,-0.27462,0.54530966,-0.005053069,-0.18886183,-0.15567838,-0.1782366,0.0017277142,0.052524302,-0.18636018,-0.004773688,0.2827342,-0.07286902,-0.21148063,-0.1916361,-0.42682934,-0.33821493,0.7139122,-0.5959964,-0.80468875,-0.55761766,0.58745575,-0.1252882,-0.035433024,-0.07958356,0.40156513,-0.3907574,0.10876795,-0.3997691,0.04152567,0.12511976,0.13286082,-0.04415777,-0.22096434,0.08002848,-0.15289278,0.1435645,-0.25252807,0.12685634,-0.11598182,0.2954461,0.5960455,0.2642108,-0.004988241,0.53942066,-0.3083602,0.043376807,-0.52243817,-0.37953106,-0.047097757,-0.44143295,0.17283803,-0.22096783,-0.22697651,0.5644442,0.20032464,0.34259337,0.052571952,0.56179863,-0.31954175,-0.4693169,0.54661983,0.105849445,-0.27028054,-0.13091058,-0.2982593,-0.050627854,-0.03567436,-0.5184967,0.031724326,-0.08721896,0.5759184,0.29537737,0.46982875,0.41931143,0.31494534,-0.20884347,0.79424,-0.0414741,0.20011383,-0.1897451,-0.013226944,-0.2169145,0.31449223,-0.08013642,0.56396353,0.49869224,0.15094516,-0.03071852,-0.1522659,0.22539027,-0.08173019,-0.7392288,-0.16358833,-0.18792991,-0.23563719,-0.5841303,0.15646438,-0.52718663]	14	2
7	[-0.10723467,-0.06554427,-0.10668187,0.20154065,0.60980326,0.30987397,0.02956118,0.14528315,-0.31599987,0.14122248,-0.32264972,0.27807862,0.71301806,-0.21721017,-0.17581582,-0.049824778,0.4678778,0.18790635,0.09573475,-0.23332681,-0.71751064,-0.06377288,-0.7077536,0.4540403,-0.6741181,0.08032663,-0.13057892,-0.032144673,0.19521151,-0.045430798,0.21388318,0.49580866,-0.4432327,0.26572382,-0.27621436,0.025675086,-0.08469669,0.31006512,-0.006384576,0.7353629,0.052905936,-0.038188938,0.04609163,-0.57217276,-0.23771666,-0.5611518,0.4728845,-0.12975097,0.20131272,-0.47528893,0.47482497,0.19864091,-0.045160703,-0.13939647,-0.40021703,0.0171434,-0.23296964,-0.00013120881,0.17310813,-0.33374768,0.071084164,-0.0016830589,0.11916637,0.09020003,-0.08129753,-0.06517042,0.16892514,-0.2536599,0.15951748,-0.23615867,0.28001276,-0.32686,-0.3482026,-0.60416746,-0.090412,0.19094738,-0.059542656,-0.3616254,-0.37435928,0.62762916,0.10997003,-0.76131654,-0.30546296,-0.22624236,-0.04946632,-0.22068986,0.093254216,-0.2103551,0.02288164,0.01298034,0.35763115,0.012362356,-6.311563,0.08062256,0.5453869,0.5474752,0.3155015,0.42943072,0.04359711,0.68790895,0.03052528,-0.6601671,0.13009459,0.13817754,-0.20907271,0.12011072,-1.0011543,0.07626381,0.06288071,0.53013253,0.39958143,0.33581182,-0.004344294,-0.091634646,0.045178827,-0.12258397,-0.3096404,-0.096229695,0.1838193,-0.39203745,-0.04411875,0.28583303,-0.38059354,0.16463621,0.11370465,-0.004255446,0.29872856,0.41005737,0.4150559,0.06667187,-0.0075590154,-0.014298464,-0.25984982,0.8245588,-0.08434478,-0.084805086,-0.20047487,-0.36850703,-0.7320406,-0.06450657,-0.20218347,-0.1565684,-0.1949325,-0.10423784,-0.6439026,-0.036524255,0.039943777,0.04963723,0.15911022,0.29453763,-0.17766327,0.0839775,-1.402821,-0.24713475,-0.061686415,-0.42804557,-0.3796351,-0.38503176,0.6878139,-0.23210727,0.46466073,-0.34697998,0.03608495,-0.433269,0.5857651,-0.18956955,0.1368671,0.35612425,0.41917863,0.093048796,-0.09689388,-0.04804591,-0.135405,0.06460518,-0.36686546,-0.14545375,-0.67121255,-0.2055298,-1.170787,0.06121233,0.5750441,-0.03455022,0.09230647,-0.059113707,-0.48881975,0.32417148,0.30432388,-0.1907121,0.06168646,-0.06712693,0.31646037,0.33046433,0.34744745,0.3525103,0.05840838,-0.23613824,-0.0966765,-0.0148252845,-0.3504916,0.11465459,0.29917958,-0.41161475,0.33208948,0.048966568,0.28080022,0.77791846,-0.35774103,-0.3880933,-0.060307752,-0.30274296,-0.54790264,0.11403077,-0.0474989,-0.22190228,-0.17246515,-0.020989755,0.50915337,0.092647836,0.09676877,-0.11453515,0.5257679,-1.3773435,-0.2896327,0.35890898,0.045257688,0.41636452,-0.003456769,0.1679849,-0.12575555,-0.3330062,-0.0010277381,0.11555402,-0.21733068,-0.042497173,0.47767955,0.97427946,0.1575558,0.09993202,0.06870552,0.012583745,-0.075606346,-0.2898635,-0.16035703,-0.1630953,-0.038647503,-0.21884722,-0.061525114,0.49777523,0.19000211,-0.025074957,0.34918508,0.036420632,-0.15151499,0.3684052,0.012243585,0.49169576,-0.4987574,0.05037131,-1.7614934,-0.3407586,-0.20795777,0.0143037755,-0.33115983,-1.7332246,0.0345594,-0.26596075,-0.19145574,-0.2851213,-0.35941017,0.09442201,-0.37649617,0.11198438,0.30841368,0.13921957,-0.17859823,-0.25689456,0.31215045,-0.065437004,-0.19893053,-0.15503705,-0.22689483,0.57836264,-0.5620394,-0.25211257,-0.28470063,-0.21585707,0.6353009,-0.35966665,0.47883993,-0.016199902,-0.038280707,-0.11215664,0.2562977,0.38531977,0.4542803,-0.59120053,-0.22802623,0.055664886,0.57875794,0.15768816,-0.17676981,-0.24665466,0.3110103,0.20695756,-0.074478246,-0.3760653,0.19925039,0.24838258,0.29826623,0.051264804,-0.19072366,0.5340967,0.8230608,0.4517517,0.14947549,-0.277955,0.26590598,0.24244179,0.1121333,0.35718963,0.06975593,2.1345768,0.46886814,-0.62735665,0.25722265,0.060037967,0.11168806,0.105679296,-0.2928915,-0.09666092,-0.18622138,-0.18432233,0.118435815,0.16538846,0.49021256,-0.38062403,0.09828066,0.15381789,0.26339823,-0.10672887,0.088102266,-0.16119556,0.20622401,0.012685366,-0.20976269,0.01404904,0.033449475,-0.3296212,-0.18836081,-0.2274871,0.41732913,0.18900564,0.041994,-0.27017274,-0.019278208,0.05755461,0.032952357,1.4986157,0.28245378,-0.09600384,0.1625835,0.032740213,-0.105741076,-0.59993625,-1.0567164,-0.48642918,-0.18671316,1.0382115,-0.08863179,-0.014106923,-0.034509208,-0.12917483,0.43198654,0.0042910003,-0.04281302,0.4082144,0.5777198,0.039950818,0.24835391,0.1356406,0.44696072,-0.023996798,-0.26993516,-0.09438848,-0.17051539,0.3227584,0.71430236,0.2654107,-0.6151301,0.40397182,0.1635178,-0.16749822,0.35487777,-0.21918333,-0.16841342,0.37742886,-0.15022865,0.17312872,-0.20022,-0.59748197,0.01611994,0.075339004,-0.85465205,-0.35275874,-0.25683284,0.48926535,0.57990074,0.059231956,0.6494593,-0.04589366,-0.44856966,0.5217719,0.41829374,0.098178625,-0.44181967,0.5862513,-0.18165053,0.06454143,-0.16876711,-0.20598386,-0.08457111,-0.22607657,0.16846594,0.14887351,0.2554812,0.0059498036,-0.40635458,0.11428038,-0.14083856,-0.41919914,0.64173424,-0.8146626,-0.11599249,-0.9009886,0.04202758,-0.34536123,0.13528661,-0.070067145,0.3880153,-0.3859367,0.14462058,-0.44879755,0.1124017,0.09223383,-0.1617764,0.04158121,-0.25827342,0.06818017,0.020754842,0.26070097,-0.40029848,-0.054500345,-0.10316741,0.04404203,0.37373668,0.14049505,-0.21902789,-0.02635745,-0.4123433,-0.25967994,-0.3157227,0.21606715,-0.11800839,-0.45608,0.31514665,-0.30206084,-0.66313505,0.3376735,0.043107163,0.21334256,0.07886016,0.89667535,-0.17961524,-0.74293363,0.35359126,0.13879669,-0.14418991,0.054036625,-0.31532404,0.0057514,-0.3604486,-0.50768065,-0.08813932,0.27009928,0.061425243,0.45210773,0.44220042,0.24869373,0.08298946,-0.6498886,0.72952205,-0.21594211,-0.18212518,-0.07476441,-0.16819178,-0.24157056,0.41037297,-0.008842384,0.6503305,0.20137091,0.5093922,-0.023590688,0.03166143,0.24776912,0.058756676,-0.44170785,-0.01680404,-0.038069487,-0.2843578,0.11024258,0.24043357,-0.5705783]	15	2
8	[-0.22027844,-0.20939977,-0.0047124275,-0.0753368,0.2742455,-0.42220998,0.07262243,0.29801422,0.5984664,-0.28697807,-0.053982005,0.21611767,0.7974294,-0.2157175,-0.0041744323,-0.14627957,1.0399798,0.01744475,-0.09319319,-0.097124465,0.22683086,-0.03748173,0.008368103,0.34323907,-0.28456342,0.016463296,-0.34657007,-0.27331418,-0.42631742,-0.09195795,0.35790822,0.09213093,0.0013614204,0.3530305,0.0049359812,-0.42050764,0.033917956,-0.097965635,-0.3997868,-0.32996982,-0.048116673,-0.26520053,0.22825107,-0.07666669,0.03236147,0.08563549,0.31712252,-0.017014414,0.05185724,-0.38793024,0.20885949,0.5667565,-0.03301399,0.061147694,-0.40396073,0.17984465,-0.1442596,0.26407358,-0.15380824,-0.15992439,0.6937424,0.00015417833,0.012668398,-0.19065563,-0.024586793,-0.110526666,0.0951562,-0.37268633,0.2521876,-0.027122745,0.614239,-0.57710934,0.29817802,-0.44987288,-0.14107956,0.5186541,-0.17432712,-0.3381442,0.07729262,0.23727609,0.32255468,-0.93911815,-0.07585984,0.36184198,0.28802648,-0.30539736,-1.2585998,0.41253307,-0.20890804,-0.02661415,0.040363174,0.071695566,-5.2214613,0.07385169,0.073085055,0.33353525,0.16931579,0.5331794,0.34180942,1.5492872,0.11350409,-0.09949598,0.27179953,0.61046743,0.18729338,-0.16259427,-1.4082255,0.14781487,0.07252211,-0.11050976,-0.053024027,0.33849862,-0.060541846,-0.2749144,0.012516003,-0.45925993,-0.07548848,0.025040755,-0.46537378,0.14047338,-0.058231436,0.41785166,-0.053625666,0.43484747,0.016023688,-0.24543552,0.39402145,0.1945162,0.16406971,0.17877175,-0.14991666,-0.5790796,-0.30693543,0.7418339,0.28190437,-0.11785028,-0.45325497,-0.51781356,-0.53638464,-0.18315305,-0.0008686848,-0.50103647,-0.32940507,-0.54921836,-0.37148747,-0.2076901,0.03541697,-0.08969539,0.32849365,0.16928872,-0.3526904,0.05821129,-1.1883773,0.10738115,-0.2162534,-0.37299886,-0.18950303,0.38374987,0.36351717,-0.057164162,0.29226273,-0.1512304,0.07039939,0.11778813,0.64789027,0.17761786,0.12889992,0.18459551,0.3210427,0.356578,0.23547538,-0.06480883,-0.21148159,0.34030604,-0.30358592,0.2391222,-1.2544115,-0.39031774,-0.92740726,0.13180068,0.31671852,0.39127958,0.37860057,-0.3370372,-0.38703898,0.20228739,0.3063556,-0.2550503,-0.36423674,-0.006645752,0.41661906,0.4069672,0.559009,0.2975602,-0.5885253,-0.46870175,-0.09028782,0.09975035,-0.6276789,0.19186828,-0.019160239,0.08953727,-0.09135217,0.12549384,0.08519267,0.43608055,-0.23086858,0.18804981,0.28575376,-0.06820612,-0.64391124,0.33092433,0.25805917,0.09964711,-0.58483356,0.12122306,0.09799629,0.013488842,-0.17166497,-0.14256604,-0.14255579,-0.537833,-0.034406222,0.5524353,-0.33232847,0.074230246,-0.31433776,-0.09787577,-0.2749823,-0.29197496,-0.05225116,0.3075144,0.12689589,0.095520146,0.54871327,0.59526783,0.3639878,0.12902527,-0.07329972,0.103682965,-0.44631207,0.054132476,0.473181,0.027999932,0.18178283,-0.11999566,-0.13876678,-0.16551906,-0.27862516,0.08894779,0.33316657,-0.1025273,-0.39367586,0.16937596,0.10681537,0.20940165,-0.5886067,-0.011903438,-1.7931966,0.25852874,0.0054295366,0.023775171,0.04792078,-2.4943023,-0.15585315,-0.047182743,0.3069788,0.06485469,-0.37256524,0.39473838,-0.25268874,-0.46410227,-0.0674798,-0.14688964,0.334204,0.0099567035,0.56976926,0.19385767,-0.25173607,-0.36469632,0.15331115,0.14179586,-0.47700235,0.24528937,-0.00037748594,-0.31433937,1.1559675,-0.23477638,0.25094455,0.14793529,0.24847895,0.06381149,-0.059178002,-0.11222421,0.0778275,-0.33420306,-0.10173146,-0.36931962,0.34801507,-0.16294204,-0.4022845,0.043913577,-0.10821521,0.50963634,-0.21262541,-0.48711324,0.012247189,-0.018291228,0.44231695,0.029008547,-0.11527405,-0.022653675,0.7381056,0.6060159,0.2022824,-0.050222665,-0.15950786,-0.22624737,0.3862419,-0.36747035,0.5914348,1.6672566,0.45079428,-0.17362428,0.4882161,-0.18070814,0.16829462,0.35988727,-0.15262572,-0.52481306,-0.17325984,-0.15433672,-0.3417065,0.3591371,-0.0141518805,-0.27801612,-0.20116657,0.03095973,0.25498992,0.75269914,-0.24368384,-0.36362442,0.14889456,-0.01176519,-0.29105714,-0.34588933,0.25445735,-0.3165903,0.16027313,-0.32726592,0.2020557,0.14990538,-0.04691823,-0.23090626,0.34680644,-0.5420417,-0.32253602,0.31854895,-0.054301918,-0.026761139,0.09451433,-0.008515869,-0.075409,-0.21241394,0.18972144,-0.15687916,0.16301113,-0.160042,0.3417313,-0.073359795,0.27823895,0.25447693,0.7267403,0.07353979,-0.30089387,0.49065107,-0.16419213,-0.024273507,-0.058445185,0.15291664,0.08286097,-0.07863685,-0.17410128,0.2210465,0.24496421,-0.03130609,-0.11622276,0.16115433,-0.21699733,-0.5162457,-0.1911178,-0.3364092,-0.009976557,-0.24151683,-0.09081376,0.34568805,-0.05902365,0.120389655,0.1521565,-0.5306492,-0.09009151,-0.18645605,-0.466398,0.0052285204,-0.387563,0.059149932,0.478803,-0.19837107,-0.2234871,-0.164623,-0.21758772,0.4322282,0.68560827,0.14616357,-0.23364647,0.22957936,-0.33218762,0.34115967,0.02900282,-0.35264882,-0.0064716176,-0.22889766,0.08768393,0.008490565,0.35632518,0.12804362,0.1864729,-0.11875403,0.39964756,-0.3138911,0.43250224,-0.10690485,-0.3170183,-0.06474722,0.24783623,-0.38014212,0.26309177,0.043116152,0.32843098,-0.008492696,0.45106286,0.24183205,-0.42716038,-0.033890765,0.008316451,0.009492366,-0.44004878,0.42029434,0.23445313,-0.0221912,-0.30228883,-0.2927524,-0.21874098,0.14594401,0.14645241,0.36212894,-0.6268163,0.25092557,-0.13007678,0.14158906,-0.07940725,0.47979063,0.31836417,-0.22500038,0.14259888,0.2009082,-0.20806146,0.0699624,0.07342209,0.24291995,0.3199164,0.7561721,0.1273133,0.02032429,0.07355026,0.4761804,-0.00031163488,0.20012443,-0.08801733,-0.22582895,0.101457834,-0.80630076,-0.17536294,0.029946454,0.07324597,0.1813906,0.44742015,-0.056752626,0.28488347,0.17435148,0.12078703,0.36837456,0.35925004,-0.17607385,0.15899597,-0.4978224,0.3266807,0.2069147,0.48625353,0.37937713,-0.15581833,0.011141407,0.3796935,0.13492425,-0.09362467,-0.58065,-0.13244,-0.30412385,-0.111886114,-0.3107812,0.36952075,-0.10586984]	16	2
9	[0.24945346,0.3950606,0.029074073,0.06791985,0.4705719,-0.3515502,0.4905999,-0.18265274,0.17261532,-0.19652894,-0.23843162,0.29169542,0.54558736,0.24833228,-0.028533041,-0.2183239,0.97577494,0.35100934,-0.022106018,-0.34926632,-0.0938003,-0.023198362,0.14287326,0.5388903,0.10140409,0.25053492,0.449231,-0.22710812,0.07477601,-0.18150067,-0.28913155,-0.05370797,-0.13274571,0.018514948,-0.38128746,-0.81730264,0.009814507,-0.19759022,-0.43188933,-0.4123036,-0.1885105,0.21174772,-0.33788323,-0.10009808,0.17913797,-0.031982504,0.23638794,-0.47653958,-0.32633233,-0.034140334,0.26066175,0.015374285,-0.059053775,0.063914604,-0.34462285,-0.64712864,0.018939322,0.09030875,0.6452124,-0.051492352,0.42855057,-0.08603327,-0.05448678,0.026582912,0.16746145,-0.05505759,-0.5093072,0.11805088,0.19454871,-0.14818974,-0.15351687,-0.29677445,0.13086754,-0.42346725,0.3374287,0.5591285,-0.17358185,0.068037786,0.4233346,-0.09707704,0.11810451,-0.42119598,-0.4266806,0.060327027,0.0665154,-0.36534053,-1.1157484,0.37937897,0.12983027,0.07911786,-0.008589944,-0.21066152,-4.969574,-0.08603952,0.26759857,1.0100917,0.43394235,0.2618362,0.063972235,0.4184238,0.44593006,-0.19239397,0.21687844,0.34664237,-0.38634133,0.14962102,-2.1879659,0.031086534,0.37386373,0.02482097,0.09656745,-0.06417904,0.30666554,-0.01926975,0.24042693,0.27113962,-0.030043812,-0.28303602,-0.715648,-0.4751971,0.013001166,0.30480832,-0.44350317,0.32467103,0.36017734,0.02048139,-0.2967266,0.5535787,0.08127849,0.08008355,0.35890046,-0.32724878,-0.40533593,0.79822505,0.14993455,0.13913757,0.10255293,-0.058681075,-0.16775244,-0.10441611,-0.2560895,0.17054893,-0.153921,0.04528886,-0.62626386,-0.31649518,-0.3444224,0.02146068,-0.2610363,-0.11245976,0.041045822,0.21892463,-0.8794255,-0.021017786,0.044995327,-0.516422,-0.33082628,0.13281967,0.71977127,0.45978242,-0.028719045,0.27815574,0.017655747,0.1438664,0.2410665,-0.07864085,0.105295554,0.20750871,0.048422437,-0.36002162,0.20449223,0.24747802,0.35783768,0.24770382,-0.094248,0.5115937,-1.4205407,0.12860121,0.005923807,-0.12672545,0.35839757,0.13516735,0.12605296,-0.24954303,-0.25394842,0.16481142,0.14825849,-0.11556944,-0.14818548,-0.20096959,0.270424,-0.40941912,0.48396835,0.2301137,-0.8153119,0.2620504,-0.5149065,-0.16261798,-0.014722687,0.2962438,0.25866598,0.1858511,-0.17627546,-0.26407933,0.013281314,0.1265141,0.4035742,0.45234314,-0.30262336,0.49188828,-0.070534065,-0.325259,-0.21160445,-0.45089737,-0.4050579,0.03717022,0.032788936,-0.20130268,0.05376307,-0.026849324,0.0061051743,-0.26759073,0.36409545,0.06165134,-0.06046031,-0.064521015,-0.10108072,-0.5244121,-0.25020784,-0.19785105,-0.06300605,0.6738394,-0.22933987,0.07127157,0.4519022,0.16655406,-0.13547257,0.51395595,-0.31629726,-0.055179823,-0.35890266,-0.23855639,0.07755013,-0.19174983,0.14827947,0.13947259,-0.014416407,-0.026140481,-0.42236504,-0.5807442,0.14443694,-0.06561995,0.07778938,0.14683238,0.40733698,0.352983,-0.23144846,-0.056741845,-2.0402253,0.14148834,0.123571835,0.069311514,-0.20202778,-1.3194648,0.35894123,-0.14195016,0.28349406,0.27022657,-0.13626604,0.28618202,-0.059457563,0.18348597,-0.08822946,-0.21895874,-0.035158016,-0.27216238,0.4463274,0.2737776,-0.09760035,0.49830166,0.32938576,0.04338191,-0.11205183,0.15246072,0.28021452,0.015919652,1.7816908,0.009854968,0.10026035,0.056664344,0.25085065,0.038580876,-0.17740768,0.1660444,-0.65073365,0.21995746,-0.026678411,-0.23345654,0.4628609,0.43269372,-0.5268932,0.15420172,0.38743553,-0.28292108,-0.0340613,-0.42194128,-0.053300478,-0.027818732,0.3486157,-0.035159685,0.06430567,-0.2120943,0.79311705,-0.28668496,-0.1327908,-0.08891857,0.32637224,0.18446231,0.1365088,0.3694505,0.4840881,1.9118174,0.20896128,-0.4482512,0.38160518,-0.18490858,0.1407972,-0.061823037,-0.108526476,-0.56747746,-0.3156308,0.3664081,0.14169984,0.045757357,0.2685966,0.47875065,-0.020384157,0.3327079,0.4054548,0.04161816,0.0808438,0.03113777,-0.104710214,-0.0569889,0.1485381,-0.06699986,0.57855356,-0.22503333,0.27816394,-0.10611381,-0.31807035,-0.032991197,0.59553707,-0.15432665,0.03332843,-0.15445383,-0.7617136,0.73072,-0.11775583,-0.6411415,0.25888664,-0.74459827,-0.19778219,0.21458806,-0.3181461,-0.16175976,0.260581,0.2713323,0.2498131,-0.09491109,0.120281994,0.11439968,-0.08408535,0.24802077,0.18971938,0.16824514,1.0069597,0.0043312144,0.1441944,0.11887162,0.31131178,-0.009600072,0.3779546,-0.1827684,0.22571714,0.15620326,0.17890507,-0.28594893,0.20873392,-0.53581464,-0.23114358,-0.5035792,0.3810111,-0.5004123,-0.04768717,0.3252574,-0.14530434,0.5411804,-0.3757386,-1.070852,-0.19560872,0.060256653,-0.113393106,0.11721445,-0.11723443,-0.26455992,0.3289829,-0.25210533,-0.12586907,0.36050743,0.45456138,0.2266935,0.72942173,0.38193417,-0.43868983,0.19500731,-0.12733264,0.48714516,-0.33343855,-0.5639275,0.18274939,0.13218296,-0.03516177,-0.07162696,0.29673874,0.4270275,-0.23854256,0.39347667,0.7475887,-0.21280368,-0.22470854,0.026377589,-0.18863812,-0.863966,0.26120934,-0.6025376,-0.337755,-0.2498703,0.2936687,-0.49062952,0.119994536,0.19605635,0.3599173,0.21304883,-0.07724286,-0.38860187,-0.0024920935,0.2513339,0.026629383,-0.24332596,-0.22767866,0.24194686,0.32526588,-0.1880292,0.5688964,-0.36631486,-0.8932083,-0.0021394426,-0.3540724,-0.10653713,-0.19766605,0.30727068,0.685029,-0.33194226,-0.15184347,0.078184575,-0.54537874,0.095202506,0.08662382,-0.021208223,-0.012909169,-0.033080757,0.07981541,-0.7019079,0.11818349,0.20146301,0.31169817,-0.13241638,-0.004034414,-0.30080366,0.0661923,-0.72727257,0.27191147,-0.2304296,0.17324376,0.04397022,0.21421212,-0.16415703,-0.31013164,-0.23309255,0.5765459,0.28046548,-0.006738383,-0.10607964,0.09528742,0.2403662,0.16985855,0.39837328,0.07370617,-0.2577519,0.67152286,-0.39505705,0.029276207,0.13574739,0.00062151096,-0.38967687,-0.5066487,-0.35718146,-0.34945518,-0.39250803,0.21655317,-0.060212947]	29	6
10	[-0.0072137816,0.12594031,0.08671458,0.11503262,0.601818,-0.11591022,0.036261197,0.13780208,-0.15638712,-0.50572765,0.2005095,0.11688652,0.32840416,-0.12966546,-0.13687637,-0.045218363,0.8276672,0.22755457,-0.0633583,-0.353174,-0.07233305,0.080376245,0.32417786,0.5311429,0.16331919,0.2253689,0.36247486,-0.13584068,-0.045263313,-0.29110768,-0.09880336,-0.15403906,0.19798204,-0.097944304,-0.2790071,-0.37184626,-0.062036198,-0.022306615,-0.19494939,0.37918666,-0.027843606,-0.13136958,-0.10334142,-0.30295002,-0.1604719,0.2513399,0.4313186,-0.60050863,-0.39094192,-0.16313031,-0.24571346,-0.5869497,-0.32741743,-0.050275236,-0.1559996,-0.082793355,-0.10817674,0.19254674,0.70094424,-0.019067727,0.80257463,-0.085347064,-0.05914862,0.11796947,0.43507853,-0.6452092,-0.12368259,-0.032463957,-0.21446224,-0.0897995,0.06864986,-0.39888218,0.09480774,-0.6645582,0.53378695,0.44277558,-0.12970892,-0.05898714,0.48819053,-0.08357404,-0.25148422,-0.07425081,-0.012086063,0.54983467,0.014425589,-0.17556143,-0.7327798,0.16810183,-0.48811713,-0.23668799,0.3174444,0.080925085,-5.73257,-0.20515534,0.029693142,0.39991418,0.4171323,0.4550591,-0.08498957,0.9960629,0.2220443,-0.03113336,-0.2824079,0.62381244,0.025377005,-0.62385917,-2.1835253,-0.025873255,0.5623622,-0.4390264,-0.028847266,0.19137006,0.29498443,0.20665798,0.19656567,0.15181588,-0.08970301,-0.12763816,-0.6400806,-0.22352323,-0.39364114,0.16254544,-0.3768609,0.09104508,0.132218,0.36764234,-0.25923604,0.40342158,0.053674784,-0.07598375,0.26649138,-0.54319674,-0.37433365,0.78805804,0.30925608,-0.3592185,-0.01099692,-0.12180479,0.051594906,-0.021755202,-0.24392888,0.05833842,-0.005243274,-0.2455384,-0.68321466,0.17458291,-0.2532337,-0.11755171,0.023091672,-0.38063985,-0.16142651,0.43172184,-0.9727049,-0.012390492,-0.29569894,-0.5484951,0.16678417,0.1625019,0.6091086,0.13673651,-0.22315739,0.1410886,0.041269634,0.13731155,0.16011867,-0.21191213,-0.30294216,-0.08035625,-0.22184616,-0.08456833,-0.029436786,0.3141308,0.2221387,0.54728043,0.0883844,0.041905634,-1.4615673,-0.25380838,-0.28288704,-0.13987446,-0.010002323,0.08475395,-0.007112054,-0.09731312,-0.044595495,0.22509235,0.5436202,-0.048013218,-0.004768178,-0.45829237,0.04256267,-0.18960992,0.22775564,-0.21100728,-0.7829697,-0.13093665,-0.13297474,-0.1167458,-0.0021973625,-0.17982893,0.19508767,0.18134396,0.18281038,0.08749251,-0.05820493,-0.06194477,0.7748041,0.14813322,-0.337619,0.44125122,0.19389068,-0.29436895,0.029088652,-0.13206583,-0.61595213,0.2225532,0.36117604,-0.18439941,-0.2121751,-0.06409951,-0.014925688,-0.1024908,0.19316569,0.10426639,-0.0857975,0.07574501,-0.5246126,-0.5469377,-0.38813785,-0.17103335,0.08954772,0.17028558,0.24401021,0.6906894,0.45298028,-0.26732886,-0.20980321,0.4096965,0.064386345,0.17068405,-0.058307804,0.067388535,0.15639356,-0.34692904,0.31080723,0.19539732,-0.04599545,-0.051221207,-0.46882188,-0.1341124,-0.25513098,0.5773067,0.09666961,-0.007543044,0.010741552,0.24754263,-0.4222821,0.1341335,-2.080946,0.24396974,0.10599501,0.21527967,0.120396465,-1.8300005,0.26358894,0.11450361,0.36041352,-0.16189232,-0.39328524,-0.12335455,-0.21739577,0.218164,-0.2895996,-0.025921198,-0.039641745,-0.34368363,0.8391895,0.114432685,-0.35317597,0.0013315441,0.07069578,-0.08002555,-0.4892362,0.015583709,0.2839625,-0.13244838,0.96904254,-0.011206756,0.09641299,0.3110878,0.20930205,-0.017032705,-0.19954653,0.12013616,0.060133543,0.62597996,-0.10190867,-0.13058543,0.31239277,0.29112208,-0.337513,0.40188015,0.49316236,-0.22296782,0.03399628,-0.38851744,-0.047817744,0.07844005,0.2982836,-0.07431133,0.1404613,-0.15226118,0.7811573,0.19664028,-0.1928204,-0.36263654,0.37599495,-0.32728824,0.11369868,0.47196323,0.06291862,1.6844906,0.30413502,-0.2302388,0.348447,-0.45000306,0.14664629,-0.110625476,-0.51629794,-0.6166113,-0.26131728,0.20812787,0.5648647,0.062368136,-0.04914822,0.24858026,-0.058612347,0.42921254,0.4045981,-0.02199952,-0.14325033,-0.006443935,-0.2895421,-0.15542816,0.06969143,-0.1937764,0.5082126,-0.26683453,0.2680191,-0.114061885,-0.44330886,0.2961213,0.41183114,0.024753569,0.23926018,0.08309844,-0.7313209,0.027317297,-0.15605652,-0.66765785,0.38650003,-0.11994469,0.21726453,0.24793331,0.32552347,-0.2364647,0.38052663,0.39790556,0.2945683,0.17781779,0.04417714,0.22892167,0.049656533,0.020881772,-0.2709872,0.44579944,0.4663207,0.1943843,0.70244396,0.44617367,0.12047275,-0.27498323,0.47617215,0.19153994,0.17404692,-0.08616209,0.32693115,-0.1157704,-0.06474737,-0.03573756,0.062239636,-0.5134093,0.48454326,-0.19962609,-0.21029487,0.823212,0.31531364,0.10643325,-0.3157434,-0.6426985,-0.29146695,0.08049857,-0.48371014,-0.0628742,-0.083683565,-0.20662333,0.093016766,-0.035387617,-0.24108748,0.2918495,0.35796636,0.13717331,0.8561083,-0.22774014,0.09075968,0.10630639,0.20280278,0.23992892,-0.2445713,-0.4082412,0.304136,0.18348698,-0.27093458,-0.31663752,0.1514061,0.45852947,-0.30258894,0.617371,0.12187714,-0.38171095,-0.15214439,-0.06999274,-0.50346106,-0.63863593,0.1689265,-0.4309766,-0.38597968,-0.074398026,0.09951652,-0.23608896,0.023537073,0.016652964,0.3117057,0.03338553,0.14355569,-0.04360087,0.020501167,0.22257617,-0.17114004,-0.037142523,0.15069962,0.51837337,0.04868044,-0.14088528,0.32724693,-0.25758767,-0.65290135,0.090789475,-0.024358798,-0.20076506,-0.35272247,0.071917355,0.9574769,-0.21667503,-0.023317762,-0.12927674,-0.4973266,0.07310506,-0.004478289,0.22376034,-0.21493782,0.11394721,-0.32957292,-0.32140058,-0.019304613,-0.23667869,0.3537026,0.23217942,-0.09788558,-0.35118887,-0.10029672,-0.2767794,-0.11422737,-0.26266858,-0.21609086,-0.19892783,0.5823519,-0.4974122,0.052546065,-0.6365688,0.42171305,0.06046105,0.23357289,-0.13366804,-0.078742474,0.40178213,-0.10759011,0.30207253,0.21650007,0.027356103,0.93764776,-0.085416324,-0.07804378,0.48937604,-0.3135893,-0.13126518,-0.35489252,0.055876788,-0.0565813,-0.51181835,0.10154301,-0.11812515]	30	6
11	[-0.356371,-0.05246858,0.05549423,0.34118104,0.26779994,-0.15815215,0.37422648,-0.21777183,-0.08647652,0.13006437,-0.1984607,0.501302,0.7576775,0.04328156,-0.0044017,-0.19355012,0.8393832,0.5647944,-0.20948185,-0.25266832,-0.6650503,0.049397755,-0.10901204,0.48705083,-0.04891119,0.28377613,0.14769693,0.33830082,0.039100047,-0.032637764,-0.23886684,-0.12183643,-0.109108396,-0.2642298,-0.2089512,-0.85610634,-0.22328976,0.1456509,-0.36005747,0.68274415,0.098931916,0.32138583,0.12919235,0.19713971,-0.12702836,-0.7957792,0.1658767,-0.7179398,-0.6545392,-0.30782625,-0.01428856,0.19721262,-0.21029142,-0.11266943,-0.4862416,-0.5757678,-0.6250202,-0.32402077,0.8976076,-0.19644554,0.1853043,-0.08970801,-0.35007587,0.20863605,0.2745871,-0.14556225,-0.50705445,-0.22812296,-0.032083802,-0.05005034,-0.06307852,-0.38665885,-0.035959426,-0.57129574,0.12868205,0.47415766,-0.4934547,-0.36221573,0.16760834,-0.07409503,0.15266766,0.28785676,-0.75475824,0.017557606,-0.23558502,0.05330009,-0.5709627,-0.34750453,-0.24186914,0.50196564,0.14246637,-0.28178003,-2.8939178,-0.619822,-0.05470181,0.86738414,0.37218574,-0.35773724,-0.16774595,0.12287237,0.4396887,-0.21222365,0.043283526,0.38168532,-0.28957084,0.26727635,-1.9842232,-0.1348358,0.059541117,0.37229267,0.08604902,0.24254785,-0.06339367,0.098255694,0.11260821,0.44391873,-0.48184854,0.07346481,-0.5922593,-0.020221977,0.122912124,-0.01955462,-0.2982162,-0.0067350734,0.26238704,0.27839306,0.24926431,0.5079881,-0.19439557,-0.2174093,0.07704339,0.07590203,-0.34202787,0.6796439,0.45902473,-0.013755652,0.4350115,0.069002,-0.6067569,0.13481176,-0.20063987,0.24480978,0.040981036,-0.16902952,-0.6163234,-0.03401513,-0.11430274,0.031533327,-0.24695298,-0.14057912,-0.15285155,-0.09675987,-1.0316379,-0.80779856,-0.27103207,-0.09828016,-0.39627576,-0.0640117,0.21722858,-0.111253515,0.10632538,-0.20447451,0.08334231,0.2941357,-0.015272948,0.02798841,0.27674443,0.18473905,0.01883575,-0.555321,0.3251421,0.056128528,0.38728744,0.15293846,0.71581143,0.13505901,-1.419762,-0.039633036,-0.24796848,-0.13291979,0.14272434,0.05002678,0.23119229,-0.44974303,-0.19099101,0.15316208,0.51154584,-0.33442864,0.22965354,0.5318579,0.16092317,-0.04401885,0.30375355,-0.1769169,0.20327544,0.24942687,-0.27837408,-0.267083,0.7096646,0.46089417,0.4077272,0.24653643,-0.3718702,-0.11291091,0.1331623,-0.20275262,-0.25701958,0.37547094,-0.43743053,0.15931523,-0.24059887,-0.23066899,-0.32195732,-0.28423876,-0.35570702,0.18137854,-0.29484126,-0.2431902,-0.22500645,0.17711383,0.19184077,-0.18188663,0.24724635,0.30717972,-0.35688043,0.03161805,0.0012377995,-0.6144375,-0.36950535,-0.3803542,0.35621506,-0.06734431,0.060990814,0.47709185,0.3391369,0.75482154,-0.056654237,0.5219438,0.083300576,0.28070107,-0.61991215,-0.6020152,0.12051875,-0.2363204,0.18636878,0.38946235,0.08395512,-0.035335686,-0.15006435,-0.3527809,0.003870682,0.060082022,0.1347116,0.13244396,-0.06611375,0.3080613,-0.46605036,0.063571565,-1.6387879,0.3030633,-0.41326958,0.25727102,-0.20826924,-1.1323903,0.49230456,-0.23895088,0.49131683,-0.15837145,-0.13691643,-0.04111111,0.0229217,0.06937559,-0.09481812,0.080448456,-0.53999054,-0.1996717,0.32812014,0.16959052,0.10682103,0.45079786,-0.048075516,0.23872618,0.091517895,-0.12598413,0.0021684533,0.1012955,0.6759376,0.21035764,0.61282337,-0.11087835,-0.028067049,0.15256989,0.11618593,0.13479182,-0.4431016,-0.0072829993,-0.1657697,0.1921454,0.37946355,0.04173328,-0.4674158,0.33396885,0.466032,-0.12538964,0.1515516,-0.26085708,0.15450107,-0.006633734,0.40665293,-0.21923302,0.11614156,-0.046134178,0.67594653,-0.1834664,-0.04944695,0.20765018,0.23871137,0.13956478,0.033026952,0.36282212,-0.13303329,1.7278776,0.30608246,-0.35580337,0.16458446,0.017776202,0.24210219,-0.18943174,0.19519469,-0.9094697,0.3816355,0.32092193,-0.013702652,0.21630368,0.64204824,0.23306848,-0.5395757,0.24436371,0.35151035,0.27596208,-0.36658385,0.1474445,0.043779317,-0.18060935,0.0742467,-0.03001187,0.49615714,-0.4096121,-0.088317506,-0.18870613,-0.3844956,0.39275154,0.42716554,0.30168384,0.1235337,-0.39354494,-0.4896631,1.4271793,-0.36466855,-0.5728176,-0.045516375,-0.5212187,-0.25342816,0.13652818,-1.1050416,-0.69040036,-0.056362543,0.36512518,0.3034746,0.56227535,-0.65257955,0.027499255,-0.38514256,0.2890248,0.19636343,-0.39950243,1.0028005,0.2488738,0.4493362,0.057552584,-0.07425169,-0.50513655,0.0495049,-0.06077494,-0.073863365,0.47363552,0.9345067,-0.09742463,-0.21885821,0.121878065,-0.3216998,-0.3094399,0.2963992,-0.076511666,-0.1791381,0.4106847,-0.11214691,0.27547747,-0.018922191,-0.55907226,-0.20283207,0.09242881,-0.5729145,-0.27205345,-0.32370505,-0.08052847,0.47139555,-0.3427317,0.5661756,0.4763979,0.39667726,-0.020066375,0.69222605,0.0872999,-0.39897087,0.103530735,-0.13261627,-0.026641756,0.061422333,-0.90523887,0.21446513,0.49939013,0.033485055,0.19145752,0.12279971,-0.0056122816,-0.5586088,0.34080434,-0.05251418,-0.50114965,0.3367891,0.27502388,-0.061794214,-0.4253226,-0.0367868,-0.64974,-0.07473659,-0.012301194,0.005974781,-0.10394519,-0.19795947,-0.28352255,0.4176857,0.022645876,0.20595607,-0.35155845,0.11890616,0.12471294,-0.021249078,0.37845486,-0.14827892,0.36416075,-0.05048195,-0.076422796,0.0791755,-0.5018752,-0.57192844,-0.046031497,-0.24707201,0.025434198,0.007144228,0.2251659,0.7969946,-0.31492913,0.059117876,-0.07776241,-0.6939525,0.44958848,-0.076215304,-0.18657969,-0.020094974,-0.16418155,0.49233767,-0.7732082,0.021132713,0.105670676,-0.067601845,0.0427228,-0.27692035,-0.30142653,0.5064678,-0.9277939,-0.09702792,0.17789115,-0.07259789,0.2694383,0.5372255,-0.43979397,0.1793604,-0.539625,0.56410164,0.1913158,-0.26842606,-0.32592818,0.40127912,0.048904523,0.10457254,-0.21120536,0.16545057,-0.28918484,0.47031948,0.04451647,-0.15971622,0.17646742,-0.23960796,0.060904592,-0.32897377,0.033073314,-0.15065421,0.031043055,0.14051807,-0.044482503]	31	6
12	[0.14743496,-0.18935056,0.07633963,0.39336544,0.33271387,0.09636073,0.8269426,-0.08858962,0.2553633,0.011174073,-0.16664688,-0.096373424,-0.32988986,-0.008224987,0.55939555,-0.013341897,0.84137005,-0.6234517,0.086198926,-0.25842074,0.36667168,0.11921356,0.309473,0.33365172,-0.6426643,0.2567082,-0.029211786,-0.09312396,-0.086793005,-0.7600899,0.2524623,-0.6446764,-0.31955764,0.62637204,-0.86167955,-0.07702667,-0.6213226,-0.28763273,0.11457809,0.4504051,-0.33002937,0.25025544,0.07471416,-0.02217526,0.55607575,0.2516421,0.36556372,-0.43676114,-0.227804,-0.244335,-0.28935772,0.106171,-0.060099322,-0.020487959,-0.19708364,0.26438174,-0.50758797,0.013481881,-0.44648567,0.0015994826,0.8719961,-0.080217876,-0.41825664,0.123467475,0.11416562,0.38244247,0.1755905,-0.33749765,0.17301725,0.3198503,0.021072827,-0.8882798,0.4327234,0.054004993,-0.15943629,0.15893343,0.5353085,-0.65402156,0.1389022,-0.45260742,0.6343854,-0.26959476,0.5185134,0.18107195,0.28362232,-0.33746663,-0.24561755,0.030762082,0.4526677,-0.3600456,0.5821847,-0.46621397,-5.4008026,0.31533235,-0.15885176,0.21930416,-0.2598872,0.6780997,0.274612,-0.6504335,0.2023415,-0.059371382,0.44751537,0.532875,0.06829003,0.18149802,-1.5577486,0.11179842,0.13152285,0.31221554,0.3319526,0.31174302,0.115482196,-0.1358291,-0.1624722,0.094092585,0.35691267,0.06980987,-0.10535806,-0.6548429,-0.26553264,0.397478,-0.121569656,0.11549381,0.25321937,-0.13936391,-0.3929826,0.5167153,0.20745456,0.61054647,-0.017510617,0.3727946,-0.46843958,0.79809403,0.5107719,0.6476257,0.020420276,-0.6719187,-0.59075475,-0.2644145,-0.35417125,-0.19729784,0.20328547,-0.312821,-0.21408328,-0.21458289,0.020331945,-0.19404095,-0.17729032,-0.12056054,-0.12964696,-0.0053845523,-0.40808204,0.38850576,-0.08527214,-0.13763568,-0.15006873,0.15432738,0.60118425,0.57328284,-0.17593862,-0.47667852,0.015347757,0.1436362,0.22283752,-0.051447194,0.49517864,0.17649722,-0.3182113,-0.067952,-0.23750882,-0.028053882,-0.09910237,0.10886661,-0.56682515,0.18012944,-1.3498573,0.07272157,0.525951,0.029745637,0.44333228,0.47358942,0.18486457,-0.28740013,0.085695215,0.0010898076,-0.34550667,-0.08712995,-0.16824882,0.39436808,0.2703555,-0.18247145,0.2632406,0.19250287,-0.8097956,-0.16346592,-0.17183349,-0.16476308,0.08787723,0.2700798,0.5537857,0.061914198,0.18290515,0.21171352,0.30061287,0.8276686,-0.39390552,-0.24797858,0.19726388,0.054524295,0.3625492,0.41128495,0.09514727,-0.3287617,-0.18795519,0.21472558,-0.42312095,-0.11845197,-0.33080727,-0.14732845,0.24497628,-0.55368876,0.29652107,0.2775729,-0.31872573,0.15823226,-0.08345424,-0.09603036,-0.2777481,-0.23882173,0.26989606,0.4827519,0.12883767,-0.038528282,0.39733905,-0.41444448,-0.080518074,0.10628042,0.18525438,0.03218075,-0.48616272,-0.4460581,0.40473363,-0.19792147,0.043127462,-0.23288316,0.03392145,-0.2252235,0.41110203,-0.06782454,0.6626181,-0.22176981,0.4051352,0.26081458,0.2968655,0.39080128,-0.45113894,0.30059358,-1.3031096,0.16009809,-0.3322962,-0.024425648,0.20260406,-0.40663248,0.2438449,-0.033073217,-0.13973127,0.14847025,0.24964021,0.05712891,-0.3759265,0.21377607,-0.21539544,0.19936655,0.64569986,-0.026466211,0.5914007,0.116037935,-0.37369815,0.3984279,-0.13618557,-0.12414695,-0.2606979,-0.12851885,0.18455231,0.4056024,2.543433,-0.053035557,0.17823434,0.30338842,0.12904961,0.3460939,0.06609205,0.50976247,-0.5657592,0.6051674,-0.9333223,-0.116798535,0.25707105,-0.0058453693,0.121700466,0.08784159,-0.10338519,0.38031158,0.1253221,-0.3348594,-0.008007264,0.26162583,0.18765317,0.23547436,0.085128345,-0.38970333,0.7946208,0.2552824,0.03946132,0.074093655,0.920124,0.35007998,0.5229269,-0.47422904,0.28923735,0.93555474,0.6440184,-0.2823405,-0.21796581,-0.18348476,0.12068152,-0.33898243,-0.037363615,-0.42291322,-0.2094913,-0.32292226,-0.36684862,-0.041952524,0.009142061,-0.4150744,-0.18511075,0.14075564,-0.08350474,0.038946513,-0.509288,0.05002231,-0.3156071,-0.5927307,0.05883761,-0.0066470504,0.54544634,-0.15943454,-0.09239472,-0.39279017,-0.57127655,-0.13064027,0.39194164,-0.20661905,0.20204313,-0.019538697,0.06482059,0.36247918,-0.30154848,0.11458335,-0.7781473,-0.32046098,-0.003141611,0.12230892,-0.03519899,0.48096055,0.40859145,0.58245206,0.25328663,-0.36643976,0.13532372,-0.20599382,0.70291066,0.20036905,0.3499539,0.29369992,0.53573287,0.07464556,0.81435204,0.020573772,0.2865933,0.20257024,-0.013768477,0.11003383,-0.34058622,-0.17294675,0.6218364,0.05210842,0.5550971,-0.31939763,-0.3397272,-0.06436275,-0.3234045,-0.5155847,0.15252063,0.93878865,-0.53440064,0.2217937,-0.26072553,-0.72875917,0.041573863,-0.116209604,0.55809885,0.12744732,-0.2708738,-0.19630842,0.010662469,0.5977124,0.4159617,0.22358227,0.09904259,0.44711316,0.33280572,0.50056213,0.18911017,0.60944855,0.23831227,0.058634814,-0.7361527,0.20819338,-0.21324638,-0.1418113,0.13711709,-0.11256962,0.03225296,-0.20189731,-0.2995749,0.49442455,0.07711695,-0.050511613,-0.16679923,0.2222088,-0.263589,-0.69724756,0.2782458,-0.6359833,0.20674096,0.16418475,-0.04320168,0.06638715,0.24702919,-0.10869564,0.028255012,-0.38488066,-0.41532847,-0.40839818,-0.08461529,0.019398954,0.094641745,-0.42889878,0.38325915,0.5475363,0.1546831,0.19961892,0.70339584,-0.023762368,0.39374322,0.24001017,-0.1055007,-0.110977374,-0.12504724,0.09001623,0.41467252,-0.24982235,-0.0032086866,0.35236967,0.5985496,-0.43078607,0.20284872,0.12631752,-0.14030972,0.13965987,0.31572506,-0.62588185,-0.041011445,0.21834011,0.51384884,0.21805766,0.07526583,0.014812788,0.03181785,-0.8066448,-0.08683646,0.22644328,-5.143679e-05,-0.17818345,-0.29286295,0.116311125,0.2055788,-0.3638397,0.02691009,0.149326,-0.31832692,-0.30291748,0.04730569,-0.20090312,0.13990751,0.023184618,-0.29624525,-0.41420743,-0.13607809,-0.107082814,0.13799988,0.5023329,0.27825126,-0.33372614,-0.20457642,-0.073697716,0.4088914,-0.59489024,-0.21107057,-0.07870824]	32	7
13	[0.2670293,-0.353216,-0.02878892,0.1497243,0.14364785,-0.067374736,0.292718,-0.14537252,0.05857584,0.32978457,0.16929072,0.30436477,0.11538891,-0.21963131,1.057913,0.18227212,0.8253369,-0.11708165,-0.049714025,-0.17931487,-0.34048495,0.26292527,-0.433566,0.13849685,-0.6121723,0.05341082,-0.0053125047,0.13301869,-0.019006398,-0.2582266,0.15250042,-0.09373615,0.15900382,0.17278753,-0.63933146,-0.21176663,-0.39885637,0.2909076,-0.54204214,1.0417203,-0.4364163,0.46727362,0.15627943,-0.13246168,0.023503777,-0.2835981,0.19459724,-0.6536141,-0.013189504,-0.42577916,-0.7652128,0.33363727,-0.26283437,0.2919706,-0.15097955,-0.040160693,-0.2989907,-0.19664982,0.15413773,0.005585102,0.7466799,-0.42890897,0.030498637,0.63639486,0.67608297,-0.037411787,0.070563115,-0.5157306,0.269494,-0.040410705,0.26373297,-0.3959967,0.022193613,-0.101002574,0.03041306,0.16090919,0.07712232,-0.28327137,0.1874119,-0.14411797,0.4891578,-0.00050905556,-0.09474033,0.34620884,0.5232564,0.062013846,0.36179316,-0.0054237894,0.07501006,-0.015927166,0.41707247,-0.04737098,-4.2290516,-0.0936039,0.41203037,0.4216762,-0.429488,0.2195744,0.71095985,-0.059397962,0.3502533,-0.6099492,-0.1216971,0.5684642,-0.53843,0.3917682,-1.7387995,-0.37242562,0.336849,0.39090526,0.24469733,0.77294594,0.3705606,0.17416394,0.18223478,0.22533813,-0.14026445,0.43862215,-0.016983705,-0.2518413,0.22845955,0.5140752,0.012972019,0.053153493,0.106170736,-0.39941922,-0.28236338,0.84850544,-0.03526302,0.19547825,-0.37355906,-0.064499035,-0.13543643,0.6543371,0.16807821,0.11148195,-0.2666823,-0.13372037,-0.53198063,-0.037554305,-0.3140578,-0.37040603,0.2580697,-0.11356244,-0.36857978,-0.34298557,-0.13832186,-0.543993,-0.40762535,-0.07154728,-0.056253146,0.02035466,-0.8275472,-0.07768581,-0.10886891,-0.28777748,-0.0073951404,-0.41849425,0.6787927,0.34697852,-0.14222533,-0.6125193,-0.086506136,0.2656117,-0.021686625,-0.044819318,0.65027195,0.09520381,-0.64077055,-0.40635723,-0.104584,-0.031471837,0.004152569,0.3459178,-0.3435787,-0.3106371,-0.6931886,0.2994932,-0.34715173,0.25922382,0.24068128,0.4077352,0.3831667,-0.31255323,-0.06421115,0.26225486,-0.41549802,-0.042648893,0.031167425,-0.10831056,0.40344965,-0.11741301,0.6037226,-0.5525667,-0.62102777,0.11350248,-0.5058147,-0.027651137,0.82692885,0.44792122,0.31549773,-0.26144603,-0.03669106,0.1856901,-0.011080515,0.47030777,-0.05884768,-0.42718562,-0.27352312,0.08570417,0.25599885,-0.13708533,0.30814973,-0.5909222,-0.28175086,-0.09410816,-0.054192938,-0.079303026,-0.49601048,0.009546097,0.23419116,-0.83716047,0.016368913,0.2471743,-0.56726724,-0.119419605,0.41081914,-0.050133593,-0.31742677,-0.46286458,0.7365655,0.030580116,0.12525877,0.21544199,0.39367953,-0.16827035,-0.06458059,0.5066934,-0.24694237,0.2740144,-0.62113345,-0.1969287,0.05375267,-0.46546537,0.023231734,0.4072591,0.06888474,-0.053815905,-0.19280235,0.24512467,0.19547766,-0.0020473718,0.49838957,0.37371355,-0.4879042,0.13944949,-0.08825093,-0.059483726,-1.7035681,0.15837026,-0.3672132,0.2073422,0.47648776,-0.3109842,0.4280049,-0.2030366,0.059607416,-0.34823832,-0.16305524,-0.15040761,-0.40837494,0.54415894,-0.1387973,0.28131866,0.37662926,-0.14011103,0.6975405,-0.058666024,-0.21695541,0.19374666,-0.15082349,-0.30999297,-0.0014521019,-0.5724544,0.22163203,0.27854598,1.6193086,-0.28126037,0.40612844,0.067577235,-0.0264622,0.33072984,0.19893357,0.16427997,-0.18161827,0.35491425,-0.50544393,0.009082711,0.13296147,0.23044293,0.0344097,0.23690829,0.55907667,0.0565409,0.4932606,-0.39081287,0.28771886,-0.013737805,-0.10588833,0.049443074,-0.2092042,-0.2569506,0.6516986,0.26699314,0.14238548,-0.015420185,0.31322363,0.11534658,0.4699541,0.12508763,0.092714705,1.2574944,0.1689098,-0.49316534,-0.03301824,0.49610728,0.11056694,-0.4546638,0.029241884,-0.7431197,0.1508114,0.070884764,-0.39581153,-0.2923442,0.4155132,0.14395364,-0.5036678,0.18912043,0.454482,0.23127401,-0.53346485,-0.055675678,0.11312866,-0.7374259,0.089868836,0.44105265,0.11805707,-0.44973323,-0.5643933,-0.12288435,-1.1028583,0.34309256,0.4002034,-0.23548836,-0.16104728,-0.3676286,0.26028588,0.73705244,-0.1122946,-0.1053425,0.042658553,-0.30465475,0.11799659,-0.004046213,-1.0375495,-0.2573405,0.6704107,0.9047302,0.45600456,-0.20695701,-0.19796981,-0.14466238,0.22219878,0.07363233,0.34086755,-0.029401178,0.9596638,0.29797614,0.9716284,0.51240426,0.09670445,0.30469292,-0.053716507,-0.19631992,-0.33237833,0.1185818,0.8773912,0.34878567,-0.044655062,-0.11407108,-0.021142706,-0.031473894,-0.062287062,-0.18057679,0.15440732,0.9253823,-0.1261486,0.16012475,-0.3808095,-0.41137415,-0.44298857,-0.44640517,-0.3359468,-0.5286777,-0.012520535,-0.54899687,-0.15434682,0.051499505,0.091422535,0.35108927,-0.22612774,0.18674532,0.39210692,0.064110614,0.04519915,0.18852034,-0.055469733,-0.21195383,-0.06353837,-0.32366058,0.3863275,-0.28870022,0.5266336,0.20619811,0.016646564,-0.088603206,-0.6997049,0.29773235,-1.235881,-0.49508372,0.23348178,0.12298262,-0.67951894,-0.55909467,0.17085321,-0.53190607,-0.0864903,0.30868924,-0.40444636,0.38864243,-0.0144866705,-0.27469975,0.3392502,-0.027199326,0.5221395,0.1965393,0.25588977,-0.58143926,-0.07369061,-0.3281031,0.3755646,0.40129682,0.40273407,0.069716804,0.8327449,-0.0645086,0.4888915,0.13051571,0.037139907,0.24771148,-0.072336294,-0.32276118,0.56094813,-0.22147559,0.3692319,-0.49384075,0.0033246581,-0.011196442,0.26578218,0.10515621,-0.38015854,0.13627876,0.088483796,-0.31767806,0.3258277,-0.061848965,0.33882368,0.31544602,0.012735388,-0.5847164,0.2020467,-0.85762393,0.12199201,0.080382966,0.12338846,0.07447758,0.3501689,-0.33201635,0.2258781,-0.74747294,0.64572203,-0.16656722,-0.21085705,-0.15226674,-0.24848756,-0.43447915,0.22653697,0.25761017,0.0013101466,-0.0044715474,0.022109065,0.47226346,0.40869212,0.3380534,-0.2163529,-0.4480652,0.16200343,0.3145996,-0.23786756,-0.48066667,-0.4915568,-0.17145382]	33	7
14	[-0.13793853,-0.3038372,0.13730896,0.2415926,0.111846894,-0.06624693,0.6283974,-0.17106858,0.23839036,0.15377986,0.15908064,0.4250606,-0.21829478,-0.16477035,0.6210912,-0.01731986,1.2454219,-0.17670457,0.19776183,-0.29867977,-0.33741403,0.4570783,-0.18178335,0.4553877,-0.59027255,0.50131255,0.09143385,0.06669871,-0.055613466,-0.55730563,0.23398565,-0.23984529,0.025961474,0.3188591,-0.98017496,-0.37078878,-0.577478,0.16178375,-0.10400014,0.29693303,-0.35411677,0.40069848,-0.00046719162,-0.07021891,0.2286118,-0.13679565,0.15839489,-0.19137293,-0.31361294,-0.18565257,-0.6933502,0.16075137,-0.2125321,0.11193989,0.10021692,-0.23346555,-0.799542,-0.1937436,0.039095197,0.031879336,0.934045,-0.29780218,0.045771863,0.043760248,0.6359392,0.49641636,0.0123526985,-0.29868126,0.18306497,-0.061454203,0.26622933,-0.8305953,0.4161537,-0.044381153,0.14243263,0.12336052,-0.08501103,-0.5679933,0.25215724,-0.15125842,0.3870653,-0.006408232,0.096008234,-0.09733798,0.2597742,-0.14778149,0.008834044,-0.06339749,0.43627504,-0.10145535,0.29826716,-0.047101416,-3.6989782,0.07117862,0.24992238,0.48531896,-0.1854749,0.41750872,0.5732589,0.0924302,0.34172165,-0.3997473,-0.008948769,0.27584776,-0.27152932,0.47193366,-1.3465377,-0.33681068,0.35564166,0.5106023,0.37438852,0.76278126,0.37233686,-0.008110945,0.040056076,0.2724221,0.106364176,0.37376204,-0.48404798,-0.44061086,-0.021155247,0.4257419,0.11410919,0.4258841,0.24141744,-0.48298565,-0.5361127,0.6237033,0.42715195,0.4554819,-0.33966377,-0.17172094,-0.43319538,0.6772993,-0.04031743,0.23200639,-0.28158352,-0.41440627,-0.4789201,-0.20256326,-0.26861292,-0.26305652,-0.063177854,-0.2696791,-0.38029101,-0.44372457,0.029065276,-0.47138208,-0.2448092,-0.1555513,0.052851316,0.41058114,-0.78783613,0.31593916,-0.01607203,-0.17185757,-0.1823657,-0.034010913,0.5782882,0.3322829,-0.111831956,-0.49487984,-0.15149975,0.19788341,-0.040296897,-0.1545579,0.3880388,0.19857217,-0.38991937,-0.30606216,-0.22811367,0.29397857,-0.0010751337,-0.009354793,-0.2192453,-0.13303563,-0.92815274,0.10551108,-0.1481657,-0.02415436,0.3252452,0.5446687,0.41938928,-0.38555858,-0.1910315,0.3457799,-0.33661947,-0.4226463,-0.035762236,0.024980618,0.5263602,-0.25798133,0.61733574,-0.28386456,-0.4488231,-0.117940694,-0.5280982,0.15149102,0.43180072,0.54343003,0.27137318,-0.33434758,0.044628896,0.213257,-0.022295266,0.5194445,-0.40196568,-0.14772367,-0.4594675,-0.13973418,0.17526713,-0.17565711,0.10865688,-0.8006483,-0.41316086,0.398654,-0.33839,-0.31012377,-0.41888922,-0.18699971,0.4503128,-0.96926236,0.28450084,0.5706176,-0.6442274,0.10342322,0.37766632,-0.044289336,-0.21689576,-0.47632855,0.32306474,0.23600584,-0.12751445,0.0762918,0.38065132,0.014854119,-0.017718922,0.19353391,-0.08992309,0.2809088,-0.6921955,-0.2702393,0.1289801,-0.35736188,-0.032278325,0.07988404,0.11180866,0.3887278,0.09886758,-0.12787347,0.34689444,-0.13012144,0.44702494,0.4167214,-0.121488504,0.45325527,-0.12809604,0.19574341,-1.6405904,0.17791215,-0.2902942,-0.01862638,0.6618891,-0.50982606,0.29854685,-0.17586897,0.026762128,-0.056697678,0.046897113,-0.065713845,-0.20527436,0.2226571,-0.08375521,0.3403266,0.49049944,-0.1642617,0.6902791,0.07466762,-0.44318065,0.2911367,-0.16247924,-0.20785521,-0.09493881,-0.3336127,0.29399768,0.16723225,1.6902934,-0.13185818,0.20075047,0.28363436,0.08390079,0.2699978,-0.008521761,0.36855134,-0.51535696,0.3812397,-0.56360775,-0.07850814,0.34000894,0.3282088,-0.12825523,0.1443848,0.19682641,0.14872058,0.34996468,-0.29293284,0.18730986,-0.16588953,0.064650364,0.21352704,0.042376973,-0.4651987,0.67367744,0.46911198,-0.050481696,-0.18034579,0.36184365,0.2765517,0.5647539,0.10494651,-0.056752354,1.635288,0.34205028,-0.57425636,-0.24243648,0.17283718,0.17956516,0.014323002,0.034878366,-0.6835888,0.30358213,-0.24602363,-0.109620295,-0.23565722,0.5042039,0.11478964,-0.42819053,0.44639206,0.372158,0.04744441,-0.502752,0.13427256,0.018799905,-0.7429454,0.09725919,-0.07416929,0.29460236,-0.21524452,-0.47058448,-0.22141021,-0.6852181,0.060876388,0.4186033,-0.21607353,-0.03877591,-0.33281708,-0.06724952,0.8993603,-0.60512286,-0.102879494,-0.26006362,-0.08174977,0.11814577,-0.13163541,-0.88546205,-0.24354099,0.55097556,0.7057162,0.27973685,-0.021863887,-0.032705307,-0.112508915,0.2608117,0.014537677,0.27397346,0.09695114,0.8237882,0.17730516,0.9837692,0.26707888,0.28220853,0.31203017,0.062749095,-0.17770211,-0.30707455,0.31771412,1.0361494,0.1061127,0.20028701,-0.2795178,-0.13397698,0.1904184,0.06575637,-0.36180833,-0.09257023,0.59108853,-0.2676659,0.12984028,-0.23102579,-0.5654614,-0.252498,-0.32677877,-0.2702536,0.019626567,-0.10616246,-0.34935805,0.16620462,0.06671443,-0.12168849,0.2503032,-0.044246692,0.2948173,0.4822025,0.26634553,0.08941912,0.36840713,0.40559462,-0.13616142,-0.47021237,-0.21759398,0.27334362,0.0039780843,0.27677682,0.31796837,0.46934342,-0.13651909,-0.42803013,0.45197025,-0.12767254,-0.27905887,0.25871742,0.16041405,-0.41805094,-0.6270252,0.05872668,-0.7769708,0.11711946,0.25103933,-0.21415369,0.015397475,0.20228182,-0.22041894,0.16713016,-0.17624865,0.041441366,-0.088559344,0.38531002,-0.29631755,0.021328233,-0.29973122,0.5201629,0.5487469,0.099689014,0.05354111,1.1073402,-0.24249914,0.03913626,0.12982816,0.0490006,0.15300052,0.13433596,-0.1287752,0.6544407,-0.32046548,0.29832527,0.17398055,-0.30846006,-0.0065205777,0.23472151,0.09666432,-0.3611893,-0.19846942,0.31753933,-0.47327232,0.04849916,0.25376764,0.42257488,-0.017133262,0.22220339,-0.37844914,0.050123535,-1.0260276,0.13212995,0.27850538,0.24090451,0.20141673,0.11034494,-0.12910713,0.3449611,-0.6159085,0.48042893,0.16689178,-0.17572387,-0.15565655,-0.21278703,-0.43504664,0.10005277,0.2808208,-0.05928534,-0.12936844,0.10827649,0.14218627,0.26380667,0.50577456,0.10658433,-0.5408925,-0.24445035,0.11711731,-0.08587629,-0.5109044,-0.48340434,-0.25711158]	34	7
15	[-0.0043392503,-0.40483487,-0.15763101,-0.04031538,0.36573744,-0.18864557,0.4798301,0.03844189,0.25000378,0.058719512,0.072457284,0.60338104,0.4542439,-0.14469418,0.55162287,-0.15183838,0.98586684,0.3684916,-0.028921831,0.13012874,-0.22919138,0.19246048,-0.36670765,0.047963772,-0.47589588,-0.16040975,0.19970766,0.30001104,-0.321322,0.058901884,0.09399743,-0.38580477,-0.17135118,0.058676116,-0.27048898,-0.26149666,-0.3606064,0.2805146,-0.066874765,1.1024709,-0.49199438,0.29658854,0.3905083,-0.25621685,0.18541405,-0.9525349,0.13909525,-0.53862715,0.11681488,-0.91088355,-0.660477,0.07759451,-0.3735995,0.5416871,-0.32500753,-0.3149397,-0.49931237,-0.08033109,0.25278202,-0.53604305,0.1611244,-0.4627912,-0.122584864,0.3028154,0.34646657,0.13543035,0.036581174,-0.744382,0.23686893,-0.21004413,0.34908208,-0.30555034,0.16487849,-0.23398066,-0.11409794,-0.040106345,-0.34214935,-0.40503168,0.17684542,0.1076497,0.32124844,-0.3279426,-0.18428066,-0.07618998,0.5251151,-0.112523206,0.22386724,0.0319261,-0.1904801,0.03136836,0.2900144,-0.24877389,-4.153162,-0.18002829,0.31200588,0.39261267,-0.029528666,0.30094728,0.71570426,0.33643556,0.26102924,-0.35394928,-0.3491665,0.51066136,-0.4490352,0.66428214,-1.7091496,-0.44081426,-0.09165164,0.1499922,-0.049302157,0.5464921,0.10605934,0.17035271,0.21546715,-0.16347735,-0.15955168,0.5136687,-0.18578522,-0.20172925,0.28780922,0.30153412,-0.20663463,-0.017112326,0.054426037,-0.111964926,-0.32165307,0.41940895,-0.03946448,0.23037846,-0.24409492,-0.18328261,0.12591219,0.62826234,0.18338636,-0.19729497,-0.069813184,0.41552588,-0.7466023,-0.003028645,-0.4755184,-0.042399243,-0.07063185,-0.02103605,-0.13079324,-0.18555483,-0.14904931,-0.12984404,0.15174742,-0.0092421435,0.14556861,0.19178943,-0.7697858,-0.3431327,-0.0540188,-0.27837914,-0.48389387,-0.50364596,0.38795254,-0.14775898,-0.032144345,-0.38148427,-0.16195957,0.08825397,-0.061824694,0.26098728,0.5152644,0.5096812,-0.41586855,-0.6218566,-0.5368149,0.25517723,0.07487223,0.3810546,-0.2792174,-0.53250974,-0.6872927,0.43976313,-0.9328336,0.15393825,0.050278295,-0.074331336,0.19822103,-0.35578412,-0.081587866,0.06920348,-0.107679315,-0.13501948,0.058214452,0.07559241,-0.07135196,-0.090189256,0.50281286,-0.42552382,-0.34191892,-0.00041151376,-0.78594357,-0.34645498,0.65447986,0.33013847,0.10854282,-0.41767246,0.0056446046,0.14120102,0.025489027,0.23096654,0.0246328,-0.3025821,-0.23485278,-0.18320115,0.44186553,-0.47385836,0.021872919,-0.31313652,-0.51234764,0.16620217,0.19116059,-0.3462498,-0.21646842,-0.43545604,-0.23167364,-0.9842588,0.29788664,0.74819195,-0.33809993,0.3141054,0.060229212,-0.36865073,0.009654358,-0.5673899,0.4311707,-0.13918371,-0.0014727573,0.9964033,0.63721645,0.041533187,-0.26693806,0.47812456,-0.44906658,0.2990297,-0.39296114,-0.28794348,-0.00688698,-0.4523052,-0.0040752958,0.47570434,0.20817408,0.01876679,0.17398956,-0.014622591,0.013713668,-0.15529497,0.20256595,0.29890484,-0.082299866,0.7276339,0.3787238,0.29476312,-1.1393307,-0.38352114,-0.19622795,0.15261622,0.10558749,-0.8686423,0.29911286,-0.2250032,0.21017946,-0.7900811,0.19872084,-0.17622598,0.082061104,0.15337332,0.02334275,0.1291187,-0.3251272,0.06894969,0.5145316,-0.21087559,-0.15745388,0.15732059,-0.06938822,-0.32980585,-0.11138226,-0.24130544,0.49652067,0.07741332,1.1213125,-0.21647121,0.5101067,-0.31239676,0.22151385,0.22221528,-0.15430696,0.054836195,-0.124088846,0.2446526,0.014908617,0.1989908,0.24452218,0.027383367,-0.13533401,-0.044355564,0.54035765,0.27011275,0.23706114,-0.50662863,0.28516597,0.07841355,0.015497357,-0.05763847,-0.1939967,-0.30841815,0.6263844,0.56827205,0.104934104,-0.088883944,0.09839657,0.056351293,0.36839697,-0.065554865,0.18106163,1.486503,0.0391678,-0.4060179,-0.114777505,0.1650669,-0.1955145,0.15271197,0.18193623,-0.6036489,0.57966536,-0.06343441,-0.37308007,0.26137546,0.42960474,0.2774953,-0.38751078,0.5472415,0.07245398,0.2937353,-0.3375188,-0.23742674,-0.02685995,-0.6741461,0.24576505,0.19163975,0.15433359,-0.48826474,-0.521381,-0.0014482473,-0.9607858,0.54545015,0.50264126,-0.36434877,-0.107612975,-0.45436332,-0.0581455,0.9570927,-0.7727754,-0.58394825,0.14387387,-0.16528349,-0.19311653,0.11706852,-0.9213497,-0.5836514,0.26081076,0.69923085,0.11462305,0.36656404,-0.13415527,-0.07318525,0.25409353,0.39096466,-0.12136771,-0.32477105,0.5962405,-0.076508395,0.59969294,0.5536618,0.13193862,0.54267246,0.052997988,0.15027979,0.16980496,-0.028253436,1.0431522,0.24061915,-0.15207963,0.18249583,-0.054883707,-0.1421008,-0.25964317,0.059452906,0.045633703,0.55637217,0.123609774,-0.15978278,-0.29622957,-0.18518408,-0.46831504,-0.3109491,-0.49382806,-0.1074879,-0.2152835,-0.38229263,0.17011756,-0.33358574,-0.04802799,-0.055903893,-0.20541798,0.0978058,0.4330343,-0.025590695,-0.23455407,0.14516252,0.101955265,-0.54571223,-0.06055127,-0.3912945,0.21269067,0.16880387,0.58012265,0.42481077,0.06785131,0.28501454,0.03788196,0.02272492,-1.0756598,-0.23216604,0.34786013,0.061405383,-0.4682218,-0.2861117,0.41854984,-0.5256992,-0.34980658,0.08254348,-0.4267424,-0.06485766,-0.36642835,-0.28713802,0.44788593,0.058845434,0.41903386,-0.07753591,0.35746074,-0.12676956,-0.12730277,-0.120763905,-0.24431594,0.25806016,0.22600558,0.28743672,0.13748921,-0.3486358,0.40729818,0.2710856,0.04390709,0.19229971,0.13300735,-0.11682399,0.35854685,-0.076150924,0.20268276,-0.19287203,-0.43626785,0.4376588,0.3250649,-0.22341794,-0.399717,-0.05264574,0.23197612,0.058358554,0.5092688,-0.43207917,0.010026904,0.53629,-0.23194176,-0.4309427,0.23161682,-0.9541101,-0.19925044,0.2553989,0.19305357,-0.19753906,0.5220615,-0.3667386,0.14803979,-0.7024521,0.50449306,-0.027398726,-0.12847467,-0.290808,0.31108725,-0.44438705,0.086478524,-0.023171084,0.10433893,-0.35068884,0.42502078,0.05700724,0.022142867,0.48617145,-0.2906335,-0.30400693,-0.028564127,0.22370312,0.10299829,-0.1536543,-0.44954354,-0.089923814]	35	8
16	[0.6617902,-0.35633942,-0.32327938,-0.12752183,0.4781906,-0.43675607,0.18098022,0.3962047,1.0854983,-0.04087795,0.20718108,0.4438165,0.30238605,-0.746183,0.6810848,-0.33129075,0.9440818,0.2041302,0.14200187,0.15083264,0.1993791,0.34326765,0.04837439,0.24778725,-0.34576002,0.36529317,0.43148974,-0.1275288,-0.13368331,-0.0048110993,0.25516647,-0.20231763,-0.1195821,0.23150778,-0.18451689,-0.33544973,-0.18551718,-0.2602954,-0.08380375,0.14218633,-0.17676318,0.44900322,-0.10764828,-0.16083601,0.18077224,-0.09441619,0.16055658,-0.5909837,-0.08637579,-0.24746896,-0.28612605,0.19892508,-0.15134469,0.13114855,-0.56606877,-0.26714632,-0.41484088,-0.18760952,-0.21320276,-0.24757916,0.1397762,-0.2362716,-0.20394643,0.20410126,0.3610516,-0.046960685,0.12715591,-0.6630339,0.44833726,-0.17410472,0.5129225,-0.74148035,0.08557009,-0.29557663,-0.20395443,0.1608559,0.15099414,-0.23962174,0.20944752,0.28447062,0.34033844,-0.37234977,-0.14182432,-0.09392133,0.3616702,-0.05642842,-0.07796606,0.14566688,-0.13560443,-0.29546514,0.5944307,-0.59591824,-6.451664,0.09850869,0.29702184,0.34460017,-0.028271034,0.3480813,0.60840386,-0.06367164,0.3775372,0.17013834,-0.29912478,0.5486488,-0.4825161,0.51421523,-1.1315262,-0.19330952,0.024875214,-0.24525052,0.2666649,0.18437669,0.15617625,0.19234532,0.00806189,-0.33208698,-0.22810312,0.27878258,-0.17153297,-0.17147613,0.18026438,0.37334034,-0.07905252,0.17375691,0.018133106,-0.07292101,-0.21283092,0.9364288,0.07451844,0.28746358,0.33061782,-0.68673384,-0.07460793,0.86203253,-0.030906595,0.17566213,0.18364252,-0.3592615,-0.5451811,-0.011928993,-0.22279714,-0.06673106,0.27257434,-0.32191613,0.08529589,-0.2806636,-0.42482775,-0.24308838,-0.06120302,0.23016603,-0.3871118,0.40340084,-0.36544025,0.32157424,0.4065293,0.042247538,0.026831305,-0.17435038,0.34246284,0.37525517,-0.24089831,-0.2642734,0.2508637,0.49730825,0.25688562,0.22509666,0.1172234,0.21701172,0.32345563,0.13376072,-0.082012266,0.8555656,-0.29084146,-0.022294786,-0.80342156,-0.25393566,-1.5547359,-0.26077646,-0.96520275,0.011403077,0.31740126,0.35004252,-0.09689734,-0.4087185,-0.021011857,0.2789898,-0.029520946,-0.37632105,-0.014823897,-0.3487627,0.2789017,-0.15510261,0.44230625,-0.116958186,-0.5403956,-0.005758409,-0.5287935,-0.12194403,0.1318329,0.3206643,0.08533301,-0.16086784,0.23239303,0.10576664,0.20474248,0.41385734,0.08068774,-0.31450063,-0.2504516,0.61787885,0.580969,-0.19063738,0.089948244,-0.5259545,-0.758682,0.44159383,0.08554317,0.4454794,-0.8304179,-0.21481475,-0.0019128508,-0.8793159,0.47859392,0.46421173,0.046357032,0.069060095,0.11568172,-0.5048292,-0.13047346,-0.18453474,-0.18464725,0.2281579,-0.639299,0.73689854,0.4653241,-0.27053753,-0.10868822,0.08447927,-0.3557809,0.062125016,-0.11131286,-0.12571292,-0.1808192,-0.5779003,0.023917587,-0.011829898,0.34104562,-0.52958006,0.12638898,-0.31166935,0.0042262045,0.071724065,-0.1292094,0.5507676,0.24621929,0.2248419,-0.01458872,0.46629202,-1.4903135,0.023687456,-0.55744344,-0.027029477,-0.05784564,-0.5158265,0.18335736,-0.106525615,-0.10181385,-0.22454166,0.13881478,-0.2220002,-0.34727857,0.5723391,-0.11295681,-0.008856929,-0.20209825,-0.31675428,0.6135283,0.041559268,-0.55588305,0.32910207,0.11722353,-0.00996111,-0.40588477,-0.23289667,0.22366165,0.13870175,1.9665459,-0.1768731,0.09519547,-0.101748414,0.17539443,0.55496585,-0.46035048,0.1467276,-0.39649844,0.45480174,-0.30104816,-0.2621308,0.36802077,0.05904322,0.055737223,-0.15949614,-0.32010937,0.16857156,-0.29195857,-0.8158728,-0.1679179,0.40207142,-0.065141246,-0.14655547,0.019532545,-0.53957504,0.8591574,0.48355353,-0.144246,0.36647978,-0.1451059,-0.07881719,0.1331392,-0.44473225,0.47751233,2.371873,0.22263801,-0.38813323,0.11368483,-0.29493344,-0.102691896,-0.027500711,-0.023884501,-0.13978031,0.22950678,-0.12539786,-0.29960734,0.5207969,0.41567054,0.09183256,-0.4227633,0.6069129,0.25356963,0.2037078,-0.59686506,-0.13314787,-0.22695538,-0.45313478,0.10486903,-0.10883123,0.3334714,-0.45017812,-0.073865466,0.18045332,-0.4076321,0.38813502,0.47965416,-0.2072085,0.14700131,-0.4423475,-0.1413597,0.60728437,-0.51172763,-0.30823132,-0.111961916,0.14536792,-0.3987041,-0.184088,-0.009541382,0.21219833,0.5700961,-0.50803024,0.49305367,-0.16468738,0.2026519,-0.45716563,0.13118406,0.11375599,-0.0030077405,0.18162002,0.6855852,-0.013840828,0.2872525,0.4272238,0.25604996,0.25393647,0.2967632,-0.0728397,0.5856212,0.22285624,0.95182276,0.06887801,0.27076632,-0.5612917,-0.37519908,0.22238606,-0.078501694,-0.21138148,0.10594336,0.56903344,-0.1340318,-0.037495017,-0.025824504,-0.6649873,0.08149148,-0.30572003,-0.02823839,-0.13226898,-0.35753688,-0.29601726,0.24995156,-0.08752771,0.15278338,0.029426942,0.17023179,0.12879823,0.7329978,0.44517207,-0.13544747,0.19684504,-0.23070969,-0.20204635,-0.38643876,-0.11605932,0.20725173,-0.36699158,0.49647152,0.040225882,0.23789431,-0.0035741336,0.10404939,-0.06340874,0.31107488,-0.15499556,0.03674415,-0.17825733,-0.52355754,-0.5059658,0.47255367,-0.41726366,-0.3713008,0.00019325071,-0.16988671,0.17680922,-0.13892321,-0.07281375,0.67982817,-0.31977898,-0.094260514,-0.06520814,0.31810078,0.017099645,-0.02321584,-0.6431993,-0.3685304,0.26250762,-0.31673944,0.45249915,0.37417325,-0.3245471,-0.19446741,0.41402778,-0.12700261,0.04769751,0.11214934,-0.1550707,0.01846378,-0.08873538,-0.03998781,0.13526538,0.20705292,0.094662376,0.39156184,-0.16424558,-0.24769807,0.19661252,0.3724862,-0.36984843,0.47505352,-0.40152007,0.19325724,0.24595249,0.021792011,-0.31640667,-0.23271899,-0.83052474,-0.22415607,0.21649706,0.31340542,-0.060274836,0.19752228,0.10555072,0.13032708,-0.15368104,0.32334262,0.13508165,-0.01613983,-0.14368562,0.28064767,-0.061605476,0.19804052,0.044420704,0.08984366,-0.55812943,0.30360833,0.12819874,-0.13877167,0.49489745,-0.12803312,-0.5113091,-0.2869701,0.049629517,0.34590808,-0.26721182,0.030219108,-0.42722878]	36	8
17	[0.4196719,-0.48006937,-0.26919195,0.12799715,0.32722,-0.23454528,0.15211257,0.37096378,0.4642516,-0.0115766805,0.38117495,0.14606431,0.31832135,-0.73646927,0.6260834,-0.31156775,0.54019773,0.17970453,-0.026836284,0.1918017,0.5497584,0.20120558,-0.21643214,0.31916988,-0.37920052,0.32693148,0.48952278,-0.19104256,-0.1341041,0.32462725,0.28866968,-0.3707639,-0.1699316,0.16805045,-0.2860445,-0.28785932,-0.27013382,0.03846709,-0.5034422,0.27597722,-0.5918151,0.44755077,0.025445918,-0.13296917,0.2199657,-1.1551756,0.17944495,-0.3598379,-0.20356357,-0.43409413,-0.16657375,-0.034796752,-0.46460146,0.008667835,-0.47139314,-0.41087085,-0.14464425,-0.18900824,-0.1474109,-0.3730067,0.06891645,-0.13139974,-0.17335635,0.27431712,0.36353025,0.06385291,0.33624247,-0.93028265,0.3946143,-0.19114366,0.05357375,-0.7486713,-0.10011781,-0.55349565,0.15678658,0.5053321,0.08110986,-0.113393575,-0.022165123,0.0019005595,0.36801136,-0.23973304,0.05747225,0.08289009,0.41109076,-0.1131873,-0.18951955,0.2425579,-0.2814047,-0.46026728,0.60295016,-0.5295074,-5.807048,-0.14438622,0.11259566,0.32962847,0.045177992,0.4010627,0.39327574,0.2363919,0.117752925,-0.018660476,-0.3058199,0.1960927,-0.52166057,0.6146567,-1.3574414,0.21948658,0.2405639,-0.49894318,0.33348414,0.63450146,0.16711079,0.30218884,0.09788409,0.00042680927,0.44311717,0.16927403,-0.056463916,-0.06550317,0.15758294,0.66398174,-0.115432985,0.39692762,0.11817593,-0.32537204,-0.23575878,1.0411149,0.24710353,0.4348833,-0.088089146,-0.40842384,-0.039322224,0.79043794,0.20072645,-0.010830174,-0.31003252,-0.1954341,-0.43679374,-0.036929987,-0.024180656,-0.11018726,0.07467864,-0.26575303,0.09777139,-0.053931277,-0.36456454,-0.1898804,-0.036351833,0.16518499,-0.31151766,0.32968143,-0.8992121,0.109565824,0.18475258,-0.20600408,0.15944333,-0.18532245,0.18247782,0.19811209,-0.037750892,-0.35050893,0.007632609,0.52538705,0.34168822,-0.015449482,0.0445713,0.26779157,0.1525424,0.17548475,-0.068224624,0.66679066,-0.1812879,0.054926474,-0.5911623,-0.34054577,-1.7736149,-0.4115327,-1.1545029,-0.41460803,0.10854694,0.19019634,0.23250833,-0.4978836,0.123579554,0.08567817,-0.09389784,-0.020790417,0.1035068,-0.40211484,0.10077562,-0.39783075,0.43192387,-0.042566247,-0.7982686,0.32117298,-0.14002363,-0.45595652,-0.26990137,0.2899397,-0.0608979,0.011001733,0.44881117,0.0036984584,0.15834156,0.4143126,0.1046081,-0.26550272,-0.10387674,0.41898024,0.48199412,-0.42079616,0.11178684,-0.6702138,-0.92309606,0.33839235,-0.023259355,0.30586538,-1.0072045,0.061033726,-0.19296451,-0.9305621,0.08784688,0.4565642,0.35946846,0.20230314,0.20225683,-0.40982836,0.008341736,-0.31470272,-0.113450125,0.41368726,-0.39256197,0.7160708,0.12585674,-0.46641898,0.21747808,-0.026831683,-0.06168319,-0.0067888135,-0.37461576,-0.44566852,0.29388383,-0.38691676,0.13372217,0.013365159,0.42013022,-0.6247654,0.05717931,-0.33712012,0.036046594,0.32769236,0.021475103,0.21775174,0.05266468,-0.23413159,0.17260027,0.53809154,-1.4999686,-0.07563586,-0.11784042,0.00021041952,0.08938084,-0.536656,0.33155003,-0.40785766,-0.07032349,-0.47217926,-0.0123023065,-0.2439868,-0.29794243,0.23294388,-0.06938632,0.20658764,-0.0006306017,-0.058796216,0.5038116,0.077152826,-0.31754693,0.4249661,0.23499998,0.053486418,-0.41459724,-0.35078424,0.13358904,-0.09519314,1.1816914,-0.10641512,0.2971508,-0.018126233,0.099726915,0.46314353,-0.3711414,0.18773869,-0.12872946,0.24804358,-0.06527317,-0.29256105,0.10715764,0.13904814,0.14390665,0.10759615,-0.24168123,0.26325288,-0.15374972,-0.62971175,-0.1744394,0.11066488,-0.04635637,-0.17654432,-0.30808887,-0.26611936,0.7880851,0.28039366,-0.32916698,0.08205183,0.012550674,-0.39373747,0.26041013,-0.36805636,-0.015109502,1.4794754,0.5109737,-0.3509873,0.08365379,-0.31118172,-0.014535034,0.054615743,-0.020461434,-0.3245556,0.21921337,-0.27984825,0.089270614,0.7076726,0.50970584,0.07543516,-0.20705532,0.5544528,-0.019898642,0.0038921335,-0.7094103,-0.4252935,-0.4289176,-0.20495342,-0.41940153,0.38053745,0.24808425,-0.58955145,-0.2303174,0.10701811,-0.72757494,0.48779467,0.55586106,-0.535686,-0.052997984,-0.2647883,-0.17122208,0.43725714,-0.25462422,-0.16656385,-0.1968193,0.41307473,-0.28695655,-0.42189202,0.51869464,0.08604446,0.4345262,-0.20838599,0.71280533,-0.52485627,0.21005256,-0.3040097,0.23776145,0.33563903,0.27824682,0.088282526,0.2532069,0.029380107,0.3141511,0.28194064,0.15392445,-0.030918827,0.48571306,-0.013344012,0.41889116,0.2184691,0.520641,0.08913817,0.09596395,0.4090863,-0.08026219,-0.116044044,-0.2327488,0.11221308,0.07397252,0.50625396,-0.5349413,-0.06584299,0.295762,-0.352788,0.040547516,-0.56612873,-0.19817422,-0.23459746,-0.26978466,-0.4706607,-0.018879494,0.05338052,0.40298846,0.23706253,-0.12505649,-0.0775618,0.6070689,0.1571006,-0.4676311,-0.0068435753,0.04925307,-0.07920597,-0.14709178,0.13820249,-0.26300985,-0.43130225,0.7304059,0.07280609,0.12991019,-0.0319682,-0.038757607,-0.10921597,0.09064395,-0.29079863,0.03611524,-0.2148764,-0.69498545,-0.5095767,0.3453279,-0.1924762,-0.4202269,0.38022792,-0.04885792,0.14141579,-0.14790542,-0.08348428,0.64023584,-0.40373835,0.14712992,0.00542092,0.22044982,-0.044593606,0.35601994,-0.37952965,-0.18146613,0.13411793,-0.022970665,0.3632878,0.1827988,-0.49725825,-0.013555765,0.4603582,0.12445416,-0.1183978,0.08812105,-0.38607347,0.33080488,-0.032182746,-0.13249552,0.2796262,0.34045768,0.40822783,0.174604,-0.1773918,-0.11818909,0.4509333,0.03168143,-0.19682892,0.32316685,-0.25099674,0.13335337,0.18455651,-0.16321543,-0.23322068,-0.27373195,-0.5856119,-0.33822793,0.39916968,0.2493836,0.005860062,0.1409607,-0.40212828,-0.15138792,0.05464537,0.34284148,-0.2669673,-0.23643118,-0.1424783,0.20786308,0.16270533,0.26371446,0.22313441,0.22457246,-0.32119146,0.43743166,-0.018658064,0.14470966,0.51918477,-0.13577911,-0.23458011,-0.09976442,0.11623502,0.51938295,-0.5178475,-0.2527817,-0.34098107]	37	8
18	[0.105780326,-0.30066654,0.23486337,0.08215712,0.2863848,-0.027246684,0.27227873,0.37785596,0.8586335,0.16177785,0.267658,0.13483322,-0.036614615,-0.3106825,0.3555366,-0.072101034,0.6322292,0.2431154,0.14767392,-0.15634929,-0.07362074,0.41388112,-0.18851969,0.3346207,-0.18635805,0.18495542,0.2636771,-0.29962236,-0.29303566,-0.81839114,0.37181494,-0.27343556,-0.08900904,0.25764644,-0.30815265,-0.14219786,-0.08475689,-0.10673697,0.17798458,-0.45694575,-0.16406849,0.52601796,0.037161563,-0.14761487,-0.028962858,-0.055599656,0.055311453,-0.5506701,0.07977004,-0.35398206,-0.33567992,0.21087311,0.18405846,0.10921353,-0.26813123,-0.46720585,-0.14542638,-0.29019722,-0.32375383,-0.5225898,0.2567078,-0.44298297,-0.23269275,0.3260729,0.2238311,-0.15608068,-0.14179483,-0.21882975,0.4119015,0.0832008,0.004557275,-0.5799453,-0.13057484,-0.15169047,0.14664052,-0.15428825,0.08881962,-0.30225167,0.37293,0.20804,-0.14330992,-0.32169122,-0.06009682,-0.5868989,0.18266603,0.13427566,0.60540974,0.11104574,0.23420727,-0.1986946,0.6339048,-0.9414243,-6.373039,0.08267848,0.09384321,0.25756928,-0.44810808,0.5201085,-0.26507884,0.3498109,0.3137306,-0.22564982,0.57619405,0.46694195,-0.60534495,-0.12456814,-1.5381777,-0.220788,0.104362816,-0.21908626,0.4056535,0.22561644,0.224986,0.24974233,0.20583454,0.123023756,0.33112502,-0.026476495,-0.038328547,-0.4641067,0.20846067,-0.105437696,-0.45580062,0.20412487,0.08087653,-0.021756971,-0.38253427,0.67489684,0.27445343,-0.035464935,0.2560701,-0.6228993,-0.08381391,0.90374553,0.08187215,0.018579852,0.14521013,-0.35987285,-0.4032086,-0.24619736,-0.15404484,-0.10327911,0.27773765,0.12532319,-0.0586603,-0.64558643,-0.012312101,-0.070178665,0.040444516,-0.15482913,0.19154571,0.12650247,-0.3892488,-0.11836653,-0.027147172,0.121161036,-0.2991268,-0.3465625,0.4622312,-0.22739622,0.002788599,-0.4296895,0.08172972,0.046883848,-0.25714827,-0.09295487,0.11172797,-0.46615657,-0.16279984,-0.22180381,-0.411456,0.020755302,0.22225182,0.26260322,-0.58070725,-0.13926992,-1.2185669,-0.053560764,-0.7468397,0.12480966,0.6955521,0.36805654,0.22189291,-0.09882585,-0.6499333,0.4060536,-0.036468368,-0.64842904,-0.040250443,0.088693164,0.15820283,-0.16092955,0.6489911,-0.0020669298,-0.67317617,-0.21523826,-0.6817553,0.22427274,-0.32701698,0.05372351,0.37932125,0.060591698,0.18321358,0.33723292,0.15361392,0.21177979,-0.37931377,-0.40341234,-0.23303127,0.860525,0.24880901,0.047498684,0.19037008,-0.40043542,-0.45104316,0.057541583,-0.106077716,-0.120447844,-0.47751683,0.03276529,0.22650321,-0.46908656,0.18447565,0.49104774,-0.16795214,0.02056532,-0.16005999,-0.42581543,-0.30609313,-0.18200007,0.14613424,-0.2487366,-0.16750565,0.48979542,0.4659144,0.099911205,-0.07645089,0.28570807,-0.03219683,-0.21803145,-0.36401844,0.24879415,0.40601945,-0.4904732,0.12205023,0.064496495,0.043805987,-0.01946127,-0.072891064,-0.2538089,-0.1847889,-0.38564008,-0.08034378,0.7139257,0.17900278,0.15813772,-0.21603474,0.16487022,-1.4425251,-0.28282908,-0.347604,0.06686075,0.07973526,-0.388206,0.021182526,0.033496365,0.22236575,-0.10535534,0.5106955,0.105352156,-0.5530655,0.55144066,-0.103296295,-0.11345876,0.24039671,-0.20637214,0.48647988,0.35052162,-0.17199345,0.40108383,-0.36154443,0.043130018,-0.33908352,0.18454261,0.2702856,0.1532714,1.253388,-0.2093857,-0.024599684,0.04750934,0.42708984,-0.23927253,-0.106391065,0.12990528,-0.7131404,0.00882666,-0.40896857,-0.20837276,0.18678688,0.5681946,0.4514218,-0.12828745,0.17898895,-0.2953124,-0.058792006,-0.5894932,-0.29485494,0.110103175,0.031079832,-0.08014359,-0.03126626,-0.5164067,0.901269,0.18810081,-0.35477942,0.05884568,0.25903726,0.29853714,0.22874504,-0.55890095,0.45956573,2.0460672,0.23197426,-0.3917463,0.4942345,-0.22612801,0.011356804,0.022481017,0.056510773,-0.06888769,-0.14471814,0.096700594,-0.33106703,-0.02449907,0.37762734,-0.037744407,0.30697545,0.40963495,0.08564401,0.37573832,-0.53280437,-0.4714253,-0.5692616,-0.716902,0.13565055,0.12401583,0.17673005,0.035937894,0.19406196,-0.13226661,-0.7264819,0.43169555,0.72145444,0.03301182,-0.1406512,-0.010175073,-0.3832479,0.41738802,-0.20558377,-0.25996488,-0.096167356,0.1970743,-0.26390612,0.22874531,0.12994863,-0.32185873,0.1677372,-0.34505776,0.5650837,-0.4787045,0.16859768,-0.1959156,0.22943294,-0.12856123,-0.03855745,0.14930788,0.9349815,-0.25207543,0.19528581,0.4081183,0.3752469,0.154028,-0.077948086,-0.45087975,0.30390137,0.1892069,0.6706894,-0.08166512,-0.15943092,-1.1943328,-0.9567262,-0.106461644,-0.235128,-0.42324194,0.120108075,0.59291154,-0.36112362,-0.06869616,-0.18257654,-0.53199965,-0.519663,0.03291591,-0.44801426,0.19186176,-0.33242097,-0.5665536,0.04793931,-0.07753932,-0.02511967,0.1447468,0.18471892,0.116667956,0.8468149,0.4235286,-0.18718627,0.119209655,0.34818205,0.056968458,-0.4607149,-0.27315956,0.055872843,-0.015501534,-0.07663279,-0.5550852,-0.25364333,0.32582197,-0.0050041014,0.0032486469,-0.16203159,-0.13296108,-0.005343542,-0.039126858,0.13712455,-0.9541238,0.30515528,-0.2105584,-0.3331667,0.14225243,-0.2983,-0.13249923,-0.01605202,0.115712255,0.6014519,-0.07480938,-0.13016684,0.0078238575,0.1225292,0.07671456,0.19148114,-0.048505742,-0.4270956,0.4803579,-0.011051324,0.11948732,0.5096907,-0.52951014,-0.11610813,0.46155018,-0.24809507,0.2876465,-0.030971043,0.0022025884,0.45226356,-0.06577937,0.20444296,-0.17864743,-0.17773871,-0.15702468,0.17101727,-0.033671368,-0.25337952,0.2760344,0.45433468,-0.44235948,0.47196472,-0.08077036,0.34724602,0.44805756,0.19735655,-0.0896967,-0.32863483,-0.66247326,-0.72053766,0.17556284,-0.053621266,0.22302487,0.13428801,-0.055817388,0.08522391,-0.38594815,0.11331057,0.0588468,0.12966602,-0.29106092,-0.0022838796,-0.24514481,-0.10915741,0.08470739,0.0962893,0.1518222,0.20025218,0.07505311,0.30340126,0.25651795,0.08040887,-0.2514475,-0.20036057,-0.22990018,0.012431213,-0.14763351,-0.15033607,0.20320055]	38	9
19	[-0.118700355,-0.11180816,-0.24349906,0.13640024,0.3774996,0.5428044,0.10706762,0.0772011,0.32863,-0.13185535,-0.31441158,0.31774932,0.7667247,0.01685415,-0.16965872,-0.072519615,1.3392955,-0.108351246,0.07671721,0.17755483,-0.8426011,-0.21651989,-0.8619731,0.2708452,-0.27930665,0.08504608,-0.03982648,-0.21918856,0.2226907,0.16472863,0.1591982,0.13792732,0.0051672566,0.2257126,-0.22721578,-0.207529,-0.057262123,-0.30103493,-0.3871547,0.43570265,0.064942256,0.18106195,0.0787237,-0.36292467,-0.07310359,-1.38726,0.203015,-0.1055269,-0.033348724,-0.6077389,0.22336136,0.33682445,0.0062021273,0.111134335,-0.57309866,-0.2483844,-0.5828649,-0.4345516,0.17227985,-0.44535223,0.15822418,-0.25021142,0.048780374,0.106757544,-0.107887916,0.035407484,0.3898438,-0.20337486,0.05861055,-0.12406434,0.27555323,-0.2164493,0.12969036,-0.5548299,-0.10736043,0.10234416,-0.29481328,-0.074584804,0.1410564,0.3347261,0.28018993,-0.4208085,-0.24545383,-0.3022584,0.15192544,-0.23163868,0.483155,-0.20638146,0.021594668,-0.17587338,0.16700508,0.09788407,-4.7870903,-0.57176054,0.2562242,0.5835629,0.21931644,0.8504367,0.37109682,0.9592392,0.18906479,-0.56818974,-0.5392964,0.25709605,-0.6091017,-0.027302932,-0.87465215,-0.37316766,-0.10338414,0.23951732,0.15541281,0.13336043,0.21267542,0.29420257,0.32126796,0.26609102,0.06204478,-0.042087812,0.24119124,-0.2691085,-0.012127634,0.3130543,-0.3992896,0.3981173,0.2991189,-0.23565039,-0.3294275,0.4982171,0.003413494,0.06460349,0.01291233,-0.3152793,-0.26442528,0.7123223,0.17513238,0.08843344,-0.2365582,-0.48257607,-0.5515742,-0.36619124,-0.13115112,-0.4988093,-0.058622077,0.09175847,-0.28426945,0.03945071,0.016994923,-0.13720423,0.08712276,-0.21570346,-0.41732985,-0.17815645,-0.98977286,-0.16555317,0.062696174,-0.33212522,-0.22848682,-0.3645015,0.4686959,-0.28870574,0.21869162,-0.48610717,0.19122769,-0.2825427,0.19962205,-0.12660557,0.33980608,0.10644916,0.5565655,-0.24065892,-0.27679905,0.018162617,0.10038069,0.3508958,-0.33221334,-0.41563484,-0.1761756,-0.14277321,-0.8535699,0.30429482,0.45783237,0.34727702,0.14610693,-0.109380566,-0.3058105,0.2769644,0.1695269,-0.3256975,-0.116910346,0.10796361,0.09749378,0.49593326,0.30469427,-0.058297966,-0.053710822,-0.60415804,0.12077196,-0.080941044,0.118376575,-0.0036259068,-0.02106206,-0.37453565,0.10408827,0.36474156,0.3819372,0.599279,-0.42662442,-0.25086114,-0.09295548,-0.41668838,-0.013832378,-0.31826422,0.08567557,-0.17514245,-0.23465818,0.2491271,0.10930213,-0.06199865,-0.1610667,0.20673922,0.48961425,-1.9390979,-0.48839054,0.34513807,-0.21065716,0.3661538,-0.024906758,0.16646461,-0.10796717,-0.18171746,-0.08186606,0.02328183,-0.5686491,0.4059144,0.62698376,0.35915515,-0.11590368,0.12917235,-0.5813005,0.09308678,-0.016946057,-0.12460304,-0.27660012,0.020309202,-0.059968118,-0.020395525,-0.17153338,-0.034236267,0.2806012,0.59692943,0.13224255,-0.110023394,-0.018863173,-0.03454513,-0.28157106,0.4581477,-0.5424494,0.3347586,-0.82860863,-0.38976076,-0.026993945,0.13444355,-0.2586159,-1.2107894,0.19363661,0.11446976,0.1520269,-0.09847307,-0.37794393,0.032191873,-0.40750512,0.017616149,0.10924928,0.579706,0.061081883,-0.46753648,0.6656268,0.24504983,-0.2000621,-0.123289436,-0.20575368,0.30066738,-1.0053829,-0.45093548,-0.17359857,-0.022697294,1.1104851,-0.27906272,-0.07579975,0.05359229,0.55190444,-0.10030052,0.15013953,0.4527832,0.030850722,-0.3867534,-0.23926863,-0.2262197,0.56088257,0.27707943,-0.47647938,-0.30846477,-0.06498059,0.326485,0.27910513,-0.22233681,0.16125053,0.24366164,0.2739579,0.16323493,-0.26097193,0.36755192,0.70985866,0.25449598,0.29949856,-0.2511008,0.47716716,-0.11728913,0.42113727,0.09113292,-0.38842723,1.9614314,0.2646107,-0.5616738,-0.005232478,-0.19855803,0.078722574,0.08508035,-0.047102384,-0.40965435,0.32372904,0.36816463,0.06714865,0.3612787,0.33022898,-0.18509051,-0.011467107,0.6001235,0.22437736,0.08541655,-0.12132877,-0.19129808,0.29669467,-0.5954326,-0.124303915,-0.15728322,0.04586766,-0.2946869,-0.085632086,0.033712804,0.4204517,0.57956964,0.31233078,0.11596535,-0.26482671,-0.49981612,-0.4125139,1.4640355,0.12665354,-0.14696316,0.5775878,0.098936476,-0.2033753,-0.41956115,-0.5413455,-0.3655397,0.1436693,0.9221617,-0.0634005,0.005511174,0.15666048,0.0025578754,-0.004626708,0.094437264,0.0013239922,0.35349587,1.0640588,-0.4355177,0.28401533,0.48051554,0.41360354,0.16930626,-0.019666016,-0.08008959,-0.0037025104,0.44138137,0.5231589,-0.13019302,-0.55864346,-0.1134617,0.23337008,0.029192962,0.50097436,0.15584667,0.019070107,0.3015615,0.13206215,0.07891783,-0.04665409,0.034232117,-0.3742551,0.09880263,-0.43723902,-0.41731143,0.00032435774,0.08267665,0.31977484,-0.019515028,0.1954422,-0.021488415,-0.375943,0.52853394,0.58493686,0.106417485,-0.45272818,0.2756981,-0.054040033,0.4427041,-0.2767132,-0.059316363,0.00084104226,-0.11651375,0.37687746,0.59941065,0.06512233,0.12159532,-0.21408424,-0.0040716687,-0.74987656,-0.101871006,0.45013997,-0.28645822,-0.3143423,-0.30321932,-0.046942998,0.08553855,0.12038953,-0.36266652,0.25627765,-0.45330936,0.16346507,-0.33849904,0.018474044,0.0036483647,0.067031555,-0.004917283,-0.08760165,-0.19518483,0.1327827,-0.18994324,-0.80377114,0.3598313,-0.13279466,0.023688218,0.54254043,-0.4618431,-0.24234879,0.16364583,-0.014676672,0.038711835,-0.1510007,-0.2208972,-0.048339937,-0.42969626,0.36250767,-0.073456734,-0.6832359,0.6283581,0.06395213,0.41696292,-0.04081492,0.18324408,0.0358813,-0.37044865,0.4992305,0.10799296,0.03156893,-0.052958384,0.23211421,-0.23392682,-0.33964077,-0.64345115,-0.07548342,0.03719899,0.24219976,0.48193565,0.4899216,0.1044347,0.35807142,-0.762659,0.90699023,-0.22408058,-0.10484728,-0.059120458,-0.30721062,-0.3467093,0.50814635,-0.26228115,0.4435752,0.41263554,0.04267014,-0.2607658,0.17571574,0.12518229,0.42566404,-0.6280122,-0.24100922,-0.013238601,-0.19769391,0.497208,-0.055549078,-0.47147644]	39	9
20	[-0.14316106,-0.106101245,-0.15800768,0.24198963,0.4751092,0.18517159,0.2420327,0.09380888,0.32488096,-0.17713019,-0.43459666,0.17119682,0.5094941,-0.23432948,-0.22150357,-0.153758,1.3237709,-0.15201989,0.007405462,-0.060340617,-0.72953546,-0.15650174,-0.45004442,0.49480236,-0.28664643,0.07930475,0.1749981,-0.11498725,0.07999556,0.18286298,0.33385432,0.15674083,-0.21167183,0.25870413,-0.16603094,-0.18942693,-0.11910374,-0.26303592,-0.24635911,0.31846848,0.017573042,-0.0010135703,0.13084945,-0.75820774,0.1323297,-0.7404488,0.37167552,-0.2533057,0.19168134,-0.44425407,0.34605533,0.4013716,0.14236893,0.2112543,-0.53450745,-0.25750387,-0.70495844,-0.3687129,0.26274785,-0.38626686,0.292628,-0.4632865,0.07489613,-0.016763069,0.28362262,0.29790592,0.1675787,-0.19345465,0.18576424,-0.58851,0.31645718,-0.37385815,-0.023627093,-0.67875344,-0.0057549165,0.0026405512,-0.31352103,-0.14057407,-0.023416866,0.23197506,0.31547695,-0.50360876,-0.31185374,-0.37478054,-0.06722623,-0.22476767,0.39184192,-0.25563872,-0.052819714,-0.0449321,0.24294394,0.20818728,-5.681719,-0.04196308,0.25299507,0.5330374,0.12061825,0.78546715,0.10614758,0.86022663,0.2867377,-0.7014981,-0.489004,0.2795511,-0.46190074,0.006722151,-1.2149538,-0.3499874,0.13193187,0.18959934,0.05267781,-0.06484734,0.075067505,0.3270679,0.116194084,0.0909769,0.11027106,-0.10452853,0.139314,-0.12521237,0.23226161,0.23620811,-0.39847353,0.42144984,0.33453533,-0.23588257,-0.079528876,0.5536081,0.20349291,-0.11710633,0.18911883,-0.32842603,-0.24562716,0.8040407,0.26015234,-0.0599755,-0.3309686,-0.63619655,-0.67627126,-0.25772756,-0.18644917,-0.37381732,-0.03507731,0.074966274,-0.31862718,0.04560616,0.22452912,-0.11975805,0.2627662,0.026859043,-0.14823948,-0.015093132,-0.798705,-0.12541148,0.14396924,-0.36012673,-0.3474105,-0.40920565,0.42319852,-0.38807476,0.3121174,-0.42508626,0.041249875,-0.19884868,0.3434396,-0.0628589,0.25955114,-0.0030377717,0.6746711,-0.24579677,-0.2874245,0.014204056,0.15299109,0.16941068,-0.41450956,-0.5141821,-0.32335904,-0.17959696,-0.7093208,0.06323836,0.5626746,0.2984597,0.09758244,-0.0776996,-0.33907723,0.44340187,0.34731308,-0.2014667,-0.033737913,0.2644355,0.4114744,0.13038878,0.36303315,0.17131592,-0.28648472,-0.6550896,-0.009888279,-0.439893,0.07743601,-0.04704567,-0.016192928,-0.5367913,-0.09196656,0.37670875,0.40165776,0.34214383,-0.35944718,-0.28064013,-0.18446833,-0.22229965,-0.016352614,0.17670332,0.12751274,-0.22513616,-0.09840817,0.2817646,0.26092967,0.14887385,-0.1413616,0.26309687,0.54262,-1.6501441,-0.40013713,0.49990675,-0.2968052,0.3248097,0.014074317,0.075515464,-0.19353455,-0.1582624,-0.19565324,0.02669674,-0.62313545,0.33980674,0.5901966,0.5455506,0.076615304,0.19426085,-0.41481888,-0.035962515,-0.1735173,-0.2396383,-0.13922997,-0.11640087,0.049011827,-0.17146438,-0.22965536,0.35119814,0.36842608,0.46135846,0.32246417,0.067664616,-0.10721274,0.3182771,-0.16937365,0.55964845,-0.4030695,0.042258084,-1.1835678,-0.25459662,-0.10110229,0.14296624,-0.16185611,-1.177005,0.23047988,-0.004536472,0.051757436,0.074935645,-0.33852136,0.31409734,-0.3382712,0.07171242,0.0590153,0.4930742,-0.041147996,-0.38406056,0.66382796,0.28789532,-0.3385656,0.04237042,-0.14990862,0.44424424,-0.9673053,-0.3674012,-0.11019386,-0.08322273,1.6112869,-0.3569217,0.142411,0.18409272,0.25108626,0.0075389026,0.10453778,0.42853904,-0.06515285,-0.4045958,-0.25942406,-0.21105142,0.6734646,0.16359076,-0.5321831,-0.32410052,-0.05147067,0.2902156,-0.1153896,-0.37620112,-0.098247826,0.11869115,0.35808763,0.18084376,-0.06574951,0.41889402,0.8013375,0.028421905,0.29940793,-0.2188096,0.40688118,-0.17320661,0.31151277,-0.0045721675,-0.029373504,2.4126396,0.21585412,-0.66349524,-0.09216841,-0.15882446,-0.108772375,0.34638515,-0.17263451,-0.3268537,0.22203301,0.091571935,-0.05114568,0.1856004,0.38269666,-0.05619932,0.1229611,0.38080302,0.3106262,0.117814966,-0.30229455,-0.27691847,0.015690904,-0.25207892,-0.12216358,-0.18947771,0.0022612214,-0.38197154,-0.045168437,-0.08597256,0.3571927,0.57309324,0.3336389,-0.0011771178,-0.12131866,-0.6079528,-0.28521258,1.4125955,0.2653704,-0.3400799,0.0010301953,0.014958362,-0.21635081,-0.2473691,-0.57681924,-0.23349081,0.043361455,0.81158847,0.12834045,-0.1572365,0.0442074,0.035455793,0.25844,0.05478488,0.23176849,0.16053605,0.73999375,-0.13170171,-0.07235732,0.46522042,0.3256093,0.16396125,-0.17990261,-0.13426754,0.17053826,0.3604677,0.5281851,0.08414264,-0.36609906,-0.08390833,0.25423208,-0.04781321,0.35766858,0.066803224,-0.16717866,0.4682543,0.047109876,-0.02753224,-0.08134313,-0.21381868,-0.34540862,-0.24454188,-0.45999512,-0.73492795,0.10308845,0.13067852,0.28311577,0.03544847,0.3064915,-0.05623742,-0.46071187,0.47734535,0.5385053,0.21927233,-0.14384481,0.23895673,-0.12646021,0.28606072,-0.41535848,-0.057391644,0.039413508,-0.15979604,-0.016090903,0.18064886,0.40484676,0.19456133,-0.37548977,-0.26394805,-0.64703757,-0.15224598,0.6277724,-0.4627796,-0.43527988,-0.66900325,0.07376584,-0.34730005,0.14603046,-0.2988941,0.21489832,-0.50956285,0.22045669,-0.46704346,-0.024801785,0.048709325,-0.18312839,0.13926661,-0.084083974,-0.21238452,0.06457489,-0.1277453,-0.4608312,0.41588795,-0.0070624496,-0.20452452,0.44010228,-0.10369634,-0.14965685,0.34391707,0.13149433,0.09540211,-0.22668654,0.084828645,-0.20651662,-0.403554,0.5703254,-0.082815744,-0.63373196,0.4407644,-0.024859125,0.35318893,-0.24369268,0.2685651,0.053235736,-0.33458138,0.78138,0.015615877,-0.0573709,0.078625716,0.19892587,-0.13301155,-0.30613598,-0.7039743,-0.24948749,0.0772432,0.1629209,0.41083542,0.40321028,0.23998982,0.08019435,-0.8720889,0.80632615,-0.15412386,0.038178664,0.15945682,-0.11990543,-0.3191101,0.57095027,-0.12372976,0.45730442,0.48039678,-0.059310336,-0.38326654,0.22498594,0.17875491,0.35988727,-0.68309027,-0.28475532,-0.1628184,-0.03915569,0.29678085,0.18246539,-0.43294373]	40	9
21	[0.22379233,0.4540374,-0.29339802,-0.055253632,0.30525252,-0.17092445,0.17854853,-0.09489114,0.41514513,-0.605142,0.0484831,-0.14170218,0.47005036,0.1554992,0.1209392,-0.062200584,0.85118276,0.06137031,-0.28789967,-0.40497342,-0.628384,0.19299117,-0.012277853,0.42037907,-0.06944528,0.42074645,0.09247589,-0.07811734,0.0299377,-0.15142398,0.115743205,0.16536628,-0.06910495,0.34497613,0.03366284,-0.20919792,-0.054632563,0.10605122,-0.3929405,0.022135938,0.6860397,-0.061835628,-0.08840469,-0.37226546,-0.2625421,0.7852062,0.23580915,-0.25399098,-0.38922638,-0.073850036,0.20681822,0.12911302,-0.0898882,-0.18566604,-0.38380584,0.09237145,0.09834691,-0.07792756,0.14835271,-0.12056439,0.8545466,-0.20105731,0.044444207,0.21001709,0.33300397,-0.36665535,0.34683496,0.24973829,-0.17440093,-0.25907362,-0.25765714,-0.31026065,0.062420856,-0.1956077,0.498361,0.49121636,0.22339353,0.17913283,-0.23744065,-0.1003391,-0.26915428,-0.442578,0.037651893,0.11141408,0.06287296,-0.035802826,-1.0713352,-0.3543384,0.055714432,-0.21933399,0.2780681,-0.17705011,-6.725123,-0.26261115,0.45954657,0.7256375,0.38186067,0.13524948,0.39977086,0.08888219,0.29686224,-0.47756302,-0.13904962,0.8176455,0.4182521,-0.27180418,-1.3854815,0.06807763,0.49601513,-0.20899852,-0.21370739,-0.52409244,0.2522183,0.24314298,0.2003651,0.20596884,0.4293356,0.058523577,-0.1598328,-0.60234714,0.008048597,0.43545127,-0.49593875,0.14659481,0.033849493,-0.04680257,-0.19273703,-0.14972399,0.24564262,-0.14281009,0.5620747,-0.4425127,-0.22237018,0.90469843,0.448435,0.22771455,0.04332965,-0.15039591,-0.35683897,-0.058714803,-0.2780945,-0.121349216,0.27155623,-0.062616,-0.20194373,0.12250973,-0.15406826,-0.25052086,-0.4687856,-0.44836375,-0.09058084,0.25832808,-0.31683508,-0.2604244,0.10066609,-0.24456735,0.3271796,0.43494287,0.36409497,0.36918697,-0.010784618,0.034463964,0.24256451,-0.03400432,5.5704164e-05,-0.17721002,-0.2461075,0.0041736863,-0.05281238,0.40500078,-0.26420683,0.03800733,-0.13952424,0.05637747,-0.5404983,-0.12606472,-1.3167229,0.1777475,-0.045330472,0.11388022,0.4621757,0.11547306,-0.07103938,-0.22970055,-0.35339442,0.45351094,0.10600679,-0.015352068,-0.32242814,-0.18127249,0.031033995,0.06839879,-0.265079,0.22901432,-0.69507635,0.2154265,-0.10296985,-0.14394896,-0.40709123,0.22767596,0.3206614,0.009144513,0.085459344,0.111499205,0.26501548,0.212558,0.4419857,-0.06601747,-0.086742915,0.34210104,-0.3066925,0.015218572,0.06746631,-0.4267984,-0.09195483,0.5971674,-0.23728076,0.3674666,-0.19462653,0.23720449,0.1201034,-0.79884297,0.48635536,0.020786356,0.24721102,0.24482143,-0.5590308,-0.38670197,-0.07465032,0.0073380955,0.3074828,0.5265878,0.029964838,0.6435147,0.4621579,0.021032656,0.049061757,0.08215682,0.29045057,0.0058043012,-0.04100121,0.24712019,0.13633274,-0.9414755,0.16391467,-0.096497744,0.14390121,-0.17916885,-0.39835924,-0.15449879,0.041891474,-0.030871212,0.24487725,-0.0650546,0.27511668,0.25832486,-0.9697559,-0.07446009,-1.9913608,0.09277973,-0.26606265,0.14942172,-0.23480289,-1.063483,0.100688376,-0.2191028,-0.007299333,-0.035810135,0.2548539,0.3829163,-0.10024186,0.22511154,-0.5792489,0.26289764,0.187449,-0.21062356,0.73757577,0.100816734,-0.22664556,0.285744,-0.2631421,0.015781512,-0.5865762,-0.3590062,0.07174552,-0.0428495,1.4304879,-0.051048208,0.46411985,0.19543922,-0.28799176,0.16288811,0.049219426,0.057197616,-0.308443,0.06751804,-0.5066474,0.2340355,0.3786394,0.09050371,-0.23104373,-0.10812761,0.16779079,-0.2810449,-0.18848605,-0.6407777,-0.27313828,0.022972448,0.5475937,0.1679809,-0.1541272,-0.22809616,0.9002031,0.027072601,-0.5198275,0.07368117,0.087808825,0.06067305,0.10231957,-0.3153784,0.7110909,2.057614,0.27038804,0.106845684,0.32395342,-0.6102417,0.30029377,-0.017571568,-0.086890824,-0.15480869,-0.58824056,0.33302048,-0.050911084,0.2904075,0.20901296,0.29108924,0.49699163,0.19673534,0.03965212,-0.4375013,0.37415028,-0.0004862282,-0.17373993,-0.5098151,0.25036794,-0.058368437,0.7103713,-0.20391947,-0.049163476,-0.16751248,0.08382686,0.14744623,0.46579698,-0.21563701,0.5971592,0.27665457,-0.4728561,0.60921466,0.3947565,-0.3798109,-0.43983367,-0.012700671,-0.49403146,0.45054024,-0.27351466,0.17219147,-0.08556946,0.1757339,0.60613245,0.27024555,0.07393283,0.19637033,0.25434905,0.14248572,0.29981494,0.23666535,0.6076516,-0.07740221,-0.20810618,-0.034602735,0.33418277,-0.054881066,0.2836454,-0.2561696,0.18286988,0.017265525,0.4104821,-0.30419928,0.012890163,0.12578511,-0.43478456,-0.078041896,-0.030343624,-0.39243713,-0.28297025,0.4368072,0.11770902,-0.18035665,-0.0094905095,-0.5497714,0.12701884,-0.021540547,0.40873885,-0.023045918,0.21730131,-0.21865506,0.3688735,-0.0049087624,0.3688606,0.5843961,0.7106565,0.4228374,0.5858578,0.2991129,-0.24371606,0.09662869,-0.83154446,0.30304533,-0.5426469,-0.3282961,0.07385741,-0.039341632,-0.003439338,-0.4667053,-0.0038869134,0.169871,-0.098310225,0.54472864,0.6980221,-0.083158895,-0.26724517,-0.2618792,0.045832153,-0.4056386,-0.07522218,-0.15143378,0.43204305,-0.07988493,0.036348194,-0.4451475,-0.055275448,-0.061269607,-0.12655647,-0.22484915,-0.5063824,-0.28105447,-0.12927186,0.060485087,0.066769004,-0.5463227,-0.1514036,0.1416318,0.5168569,0.48479432,0.5399946,-0.4106679,-0.5949734,0.4526386,-0.4117023,0.11153032,-0.47310486,0.51618445,0.5889972,-0.6384602,0.33347633,0.25014699,0.07547223,0.16208667,0.43779588,0.08832198,0.21435153,-0.009234659,-0.09233494,-0.5585502,0.30908462,-0.28439707,0.03233372,-0.18922336,0.03778592,-0.09050107,-0.1178775,-0.35190442,-0.041536633,0.23045748,-0.07611494,-0.041769505,0.36337683,-0.2142656,-0.3911959,-0.93629336,0.43542632,0.066025816,0.5479897,-0.38852674,-0.20102985,0.151149,-0.28860864,0.27659696,-0.13512772,0.29818404,0.18923974,-0.19081953,-0.06684353,0.2039869,0.25511903,0.010946901,-0.150887,0.21827683,0.0031971643,-0.045266856,0.10411553,-0.47114214]	42	10
22	[-0.08930964,0.20089467,-0.26347056,-0.087304786,0.26910686,-0.24673763,0.30431435,-0.09270622,0.4058308,-0.42260274,0.2416193,0.15449733,0.80133796,0.04997367,0.031408437,0.0692862,0.44595486,0.39089435,-0.2176081,-0.23708764,-0.6094732,-0.0311748,-0.19880624,0.25829816,0.009943897,0.30355853,0.13334727,-0.23046115,0.0695916,-0.3977603,-0.042219874,0.096177615,0.16445622,0.34441304,-0.2963725,-0.33569202,-0.28232923,0.0071801594,-0.09886372,-0.04713595,0.5165007,-0.06022074,0.020713534,-0.25523704,-0.35066873,-0.05622097,0.58792,-0.025915327,-0.52981097,0.06726593,-0.17361303,0.15354101,-0.19599968,-0.08237162,-0.24306291,-0.3325691,-0.08869009,0.02100334,0.011727188,-0.17722154,0.9790101,-0.27669483,-0.07740888,0.18705599,0.13103293,-0.181633,0.520143,0.114770874,-0.30474985,-0.20174149,-0.052406546,-0.2776264,0.16560334,-0.071207896,0.38348755,0.6087298,0.33019766,0.114020854,-0.13859178,-0.2655675,-0.08189177,-0.3225218,-0.09016329,0.033490684,0.0010263488,0.08363788,-0.9972986,-0.18398309,-0.21364804,-0.22504391,0.30636534,0.011763275,-5.730049,-0.065504946,0.6488907,0.719852,0.32474586,0.3946982,0.33823496,0.48497817,0.212079,-0.4184158,-0.46186343,0.35509443,0.3309177,-0.16096887,-1.8705771,-0.08014913,0.5569897,-0.2934969,-0.17804913,-0.3428121,0.011833853,0.106828794,0.23921718,0.18228905,0.19054967,0.16752791,-0.25765014,-0.6199881,0.16238162,0.45172605,-0.49121445,0.31877697,-0.10287256,0.1815976,-0.04786161,0.11597568,0.29247627,-0.15643941,0.21094231,-0.32394624,-0.23464055,0.8271228,0.29664847,-0.006547549,-0.28053087,-0.19664685,-0.4233115,-0.18007442,-0.19286445,-0.3244747,0.40423277,0.15026233,-0.21270184,0.16381618,-0.096412115,-0.2101692,-0.5641336,-0.27423224,-0.20729005,0.22925186,-0.71945244,-0.13298774,-0.10180367,-0.39205477,0.31688502,0.42054635,0.71162426,0.2133418,0.22935678,-0.16012815,-0.0153796645,0.21586148,-0.1773975,-0.11522899,-0.4742393,0.2338025,0.16622144,-0.010962508,0.019695537,-0.090799116,-0.03041982,0.07257062,-0.21969119,0.0645612,-1.6345271,-0.06750322,-0.30345353,0.33388737,0.35186395,0.22291347,-0.071121044,-0.3183973,-0.17398879,0.5478966,0.17337237,-0.022051169,-0.24376266,-0.12336405,0.6452595,0.08901831,-0.17830475,0.11666474,-0.7500375,0.3551499,-0.33368433,0.05269101,-0.50657046,0.19978714,0.031951085,0.121676736,0.24300338,0.12946469,0.26198614,-0.18273619,0.34930098,0.15708216,-0.17660452,0.43149385,-0.2586754,-0.003660737,0.011820042,-0.22017905,-0.037027963,0.4411935,-0.3336268,-0.1111023,-0.26848793,0.22955886,-0.087702334,-1.1286812,0.4170994,0.14476,0.31748158,0.26710716,-0.22849287,-0.20856155,0.056873746,-0.19561337,0.010441617,0.50786227,0.28450832,0.318884,0.5994829,0.25738218,0.23689328,0.33362645,0.08066167,-0.027857618,0.16441816,0.15019058,0.048049923,-0.69902617,0.2930848,0.08089253,0.12719497,0.14988555,-0.352046,-0.31722385,0.20900932,-0.09645933,0.17301662,-0.05620601,0.53631043,0.06466205,-0.71970636,-0.114014156,-1.7067176,0.17215393,-0.2539608,-0.075300835,-0.40895313,-1.5062615,0.06882612,-0.13953269,0.13279732,0.20159777,0.0981379,0.323535,0.07284969,0.15968764,-0.61484396,0.13268845,0.052738946,-0.5538848,0.53504133,0.20571235,-0.021716055,0.3328769,0.09248493,0.0019105892,-0.67958635,-0.11150082,-0.09915865,0.16113707,1.4553922,-0.14070953,0.41124648,0.1603412,-0.19826168,0.011839168,0.03947181,0.26038307,-0.36843476,0.11002733,-0.2781857,-0.04155871,0.3221985,0.038693797,-0.44374236,-0.11673294,0.22343688,-0.34885207,-0.43698117,-0.3916299,-0.31006193,-0.0803138,0.41598952,0.26397014,0.07031841,0.14538236,0.82223415,-0.14451846,-0.48765746,0.18217357,0.19147247,0.12942567,-0.029804928,0.09109851,0.75455797,1.9589542,0.27268386,-0.0956013,0.5303009,-0.43804747,0.24135453,0.08656865,0.15939581,-0.29701334,-0.5205093,0.1522375,-0.17437553,0.20130938,0.3136294,-0.042297374,0.16352591,0.07363565,0.0580245,0.27486846,0.1729742,0.20848902,-0.19560307,-0.76812464,0.56454426,-0.25376526,0.6610994,-0.09600648,-0.14298317,0.066857755,-0.14478508,0.24576187,0.3403208,-0.28082117,0.34396902,-0.013496348,-0.61517906,0.5843754,0.34467453,-0.47448888,-0.41387966,-0.13611841,-0.65071434,-0.072169244,-0.6044942,0.15432039,0.032519665,-0.13972196,0.85062796,0.1329728,0.04820335,0.31394672,0.30363238,0.23832229,0.28062254,0.55211234,0.4704217,-0.3136343,-0.017985206,0.054643802,0.17902185,-0.045057897,0.17917822,-0.2796905,0.17776951,0.26652846,0.37964788,0.0066599487,0.013006288,0.23131658,-0.089196615,-0.31480035,0.14844435,-0.7119389,-0.06150248,0.26091412,-0.23460253,0.21265805,0.14224915,-0.41187388,-0.087984845,-0.25947392,0.06381753,0.058375943,-0.08344487,-0.25118914,0.24046947,-0.096591145,0.21324968,0.6047814,0.44391567,0.28588814,0.5623282,0.38831842,-0.1828326,0.0012966745,-0.3682744,0.4335107,-0.6156497,-0.43420076,-0.046381447,-0.13126883,0.01584925,-0.65333176,-0.069283016,-0.087630436,-0.27504054,0.42893946,0.19513327,-0.16148148,-0.18960169,-0.1889927,-0.025271622,-0.5914542,0.15238744,-0.27566272,0.16732173,0.037441645,0.18649971,-0.404675,-0.039798547,-0.15443538,-0.27214825,-0.20873149,-0.4521396,-0.26656857,-0.1639706,0.29376674,0.2960158,-0.49484923,-0.015417961,0.27090573,0.35118872,0.32672334,0.5776589,-0.20329235,-0.63530105,0.37229207,-0.25831607,-0.017826553,-0.32481286,0.45071524,0.5415137,-0.5510811,0.30286404,0.32665622,0.035380494,0.1292759,0.51224273,0.15534039,0.37633073,0.12326704,-0.093379125,-0.5275872,0.1386911,-0.19849306,-0.064828,-0.07242807,-0.11284702,0.11136738,-0.054042503,-0.39379367,0.052087322,-0.07319118,0.11795558,-0.19755413,0.4242235,-0.082536384,-0.36833745,-0.8745225,0.33185217,0.076267436,0.75194174,-0.12581548,-0.23538625,0.1235212,-0.4644256,0.54439443,0.09854601,0.08691209,-0.05916841,-0.04931991,-0.01837857,0.10078131,0.050472178,-0.20686263,-0.5246516,0.16698937,0.049181283,-0.04625391,-0.031258103,-0.18076676]	43	10
23	[-0.07265557,0.16819713,0.045726743,0.04485969,0.46431065,-0.0094313705,0.16838561,-0.45783332,0.47822797,-0.5651822,-0.04740073,0.24945834,0.61655694,-0.06359841,0.33038792,0.0923004,1.0631489,0.40114495,-0.2880167,-0.23787104,-0.7034237,0.3161667,-0.2640093,0.2779604,-0.23176883,0.21704468,0.03761362,0.10920667,0.039473478,-0.15373264,-0.037917458,-0.02040939,-0.2951298,0.25456828,-0.14918579,-0.52145845,-0.117851615,-0.21330182,-0.2978906,0.2023508,0.6427606,-0.066606335,-0.05775499,-0.11654562,-0.34772196,-0.13470605,0.25159904,0.034200348,-0.22514486,0.33304867,0.011672214,-0.24229284,-0.42619213,-0.3254677,-0.20665145,-0.33508137,-0.057891678,0.24856102,0.1339248,-0.21729934,1.1763167,-0.09390297,-0.2600013,0.1756368,0.23866528,-0.3545586,0.3904729,0.058227688,-0.33755368,-0.19200964,-0.045610867,-0.09500725,0.08210551,-0.51989716,0.35131776,0.5518154,0.21630634,0.21120827,-0.3722459,-0.1807685,0.025278244,-0.3119538,-0.11924885,0.16990209,0.021155199,-0.06187329,-0.804155,-0.2677876,0.015070795,0.118464485,-0.27488863,-0.02178349,-4.588815,-0.15074165,0.5001302,0.8727823,0.2798528,0.35779637,0.43508995,0.61498463,0.36993867,-0.5921119,-0.5974763,0.6612623,0.18015578,-0.11047206,-2.0187807,0.05984979,0.41640705,-0.07171885,-0.17446265,-0.39060768,0.37625617,-0.04597267,0.06805099,0.34245983,0.095186874,0.0057949657,-0.23057477,-0.38290817,-0.09295721,0.48840478,-0.34055564,0.066638775,-0.09336089,0.2371473,-0.3881039,0.18302123,0.23374583,-0.36582154,0.21531263,-0.58577967,-0.082183875,0.71684074,0.48773253,0.10664383,-0.10029671,-0.059057716,-0.5965583,-0.18100475,-0.32385126,-0.13482788,0.13375911,0.15589659,-0.3102515,0.23606677,-0.08974715,-0.07807954,-0.5824245,-0.3002425,-0.07387088,0.3135793,-0.60408896,-0.30919844,-0.04826124,-0.54080915,0.0662687,0.2262929,0.70531964,0.35936967,0.03314832,-0.06422759,-0.027618587,-0.1055363,-0.07319715,-0.21684612,-0.08412254,0.32873175,0.055098027,0.053096447,-0.0786807,-0.04056318,0.048595384,0.4057981,-0.25272882,-0.271228,-1.2746396,0.11024193,-0.36961454,0.22966316,0.28405803,0.04920216,-0.14045085,-0.19830531,-0.31416032,0.35563248,-0.009393102,0.048414316,-0.15610036,-0.20747964,0.3326848,0.007874883,0.020734359,0.11374543,-0.5931509,0.2435877,-0.3629325,0.2867026,-0.26096517,0.53080225,0.1767932,-0.28592008,0.0712796,0.2089553,-0.18497182,0.100454345,0.38492328,0.07934452,-0.14174643,0.279316,-0.14016587,-0.48403886,-0.008234477,-0.32933864,0.02132574,0.6178998,-0.041154146,-0.06035137,-0.1468272,0.36590657,-0.05569545,-1.4986076,0.3508561,-0.08929667,0.0030549467,0.25619462,-0.2814291,-0.39677685,0.26350683,-0.18058284,-0.074559085,0.3575758,0.2033996,0.5280391,0.5434325,0.14048772,0.2110617,0.14286906,-0.17692506,-0.23939487,0.31763893,0.14293008,0.13732381,-0.75366753,0.28799918,0.34750375,0.055171777,-0.10221434,-0.48693475,-0.12634256,-0.2554026,0.10675832,0.24111158,-0.1099789,0.48301217,0.46235788,-0.8748905,-0.025684318,-1.7221159,-0.038149975,-0.16696832,-0.120002374,-0.16301107,-1.8367447,0.15476969,-0.5376534,-0.0032129234,0.24862127,0.17862852,0.46886504,0.20116442,0.27950567,-0.512539,0.52271736,0.2120489,-0.24974653,0.45791247,0.09918453,0.030928219,0.17845021,-0.13860753,-0.09410955,-0.40539855,-0.26916444,0.05789022,0.44810596,1.0511968,-0.0018296674,0.24692707,0.5429889,-0.35147625,-0.08483881,0.20070663,0.24255607,-0.4059034,-0.00077902095,0.034260835,0.39895508,0.58338386,0.17241588,-0.39299744,0.21735619,0.7120121,-0.36643478,0.021834914,-0.48198417,-0.2883114,-0.050464142,0.40588856,0.3189638,-0.053248223,-0.073358834,0.71170354,-0.102743685,-0.30246696,-0.3364879,0.36348227,0.16373819,0.064381965,0.5021544,0.11580255,1.9506928,0.18740982,-0.059413742,0.5309084,-0.24677147,0.071074,-0.009327153,-0.032021053,-0.7961957,-0.5562723,0.29157063,-0.21207225,0.48840496,0.32846546,0.19152139,0.2551742,0.13933615,0.3044707,-0.18275593,0.2252762,0.16859841,-0.055367075,-0.6749529,0.6862234,-0.32265168,0.54684037,-0.016979689,-0.6678065,-0.20738675,0.0033048522,0.041167486,0.24936195,-0.42236292,0.163296,0.371278,-0.37722734,1.0201845,0.13478397,-0.6746231,-0.28453135,-0.18625222,-0.3765506,0.18255198,-0.59828794,-0.29168558,-0.015505538,0.289703,0.4278903,0.28710464,-0.0026169857,0.36237472,0.3384001,0.4380231,0.2184675,0.30851933,0.6613115,-0.2053377,-0.25789955,0.02393036,0.36684656,0.32072067,0.21009903,-0.38725552,0.15123194,0.044660743,0.48663816,-0.022140816,0.026044087,0.1392308,0.20514557,-0.3297941,0.3946753,-0.40973443,0.061062142,0.1174139,0.2912058,0.073636204,-0.15779911,-0.18285109,-0.17273791,0.34238675,0.056346275,0.18754785,0.20518617,-0.48639342,0.37761313,-0.057152417,0.36285594,0.47487304,0.18933225,0.14516144,0.7068206,-0.0060592364,-0.3744943,0.23026027,-0.4868522,0.4064899,-0.32010847,-0.45549542,0.0991015,0.13275346,-0.03185128,-0.3464228,-0.022063535,-0.22184561,-0.29966897,0.49482188,-0.055412676,-0.26673794,0.23709126,-0.17446849,0.27936107,-0.53160244,-0.10796169,-0.14212532,0.4268997,-0.006412087,0.036526784,-0.43447095,-0.13553093,-0.68053806,-0.30437896,-0.34163943,-0.30266976,-0.36229715,-0.28325516,0.14147915,0.14352,-0.45363274,-0.05468149,0.14235394,0.28324908,0.41179436,0.4823765,-0.50583935,-0.42262813,0.2986498,-0.659169,-0.054011494,-0.57461655,0.4936612,0.6879247,-0.9583546,0.45766526,0.17383736,-0.5030668,0.38352156,0.48470816,0.50726366,0.4761894,-0.122277185,-0.17861626,-0.5104583,0.10845065,0.093779705,0.014915722,-0.37638265,-0.24366808,0.016727667,-0.011686434,-0.7712175,0.10403984,0.028058914,0.0951379,0.04962476,0.34056386,-0.31002745,-0.32181484,-0.76032335,0.5763259,-0.12061793,0.4653153,0.047434576,-0.50106275,-0.0223941,-0.16353126,0.39729053,0.39916754,0.1402443,-0.06857211,-0.07540224,-0.20221125,0.5105388,-0.09515008,-0.21266319,-0.4008039,0.0239604,-0.29804203,-0.3081742,0.13619217,-0.278801]	44	10
24	[0.4629645,-0.09912335,-0.42001244,0.2274204,0.37101078,-0.82534605,0.3751012,0.15365556,0.61297023,-0.23773879,0.15526175,0.427359,0.6259234,-0.054245774,0.40941313,-0.35109726,0.7444289,0.18438601,-0.28000337,-0.120047554,0.057323575,-0.018458897,0.15470327,0.06581187,0.20076522,0.16643526,0.35672554,-0.11708403,-0.19670868,-0.31295946,0.1398809,0.00057303155,0.012027299,0.24614452,-0.14445782,-0.48859096,-0.30507958,-0.0905358,-0.43257037,-0.7789608,0.05454969,0.2830979,-0.26151282,-0.3815517,-0.14845781,-0.029529,0.33740667,-0.099752784,-0.4407138,-0.024819516,0.027632616,0.07874925,-0.24422981,-0.054518722,-0.3198927,0.2771445,-0.35788545,-0.12975357,0.5192981,-0.1417171,0.21710007,-0.046678964,-0.045551933,-0.13744469,0.26608902,-0.060824964,-0.04543559,-0.7257355,-0.0052574347,-0.16782159,-0.03856792,-0.19062619,0.39341456,-0.2512129,0.28266683,0.6097829,-0.013113451,-0.046287492,0.15899768,-0.437845,0.1338842,-0.29923135,-0.082365006,0.105699465,0.05793799,-0.16207543,-0.9345738,0.12356103,0.17462787,-0.10452772,0.17026632,-0.024212955,-6.257095,0.300812,0.120458536,0.6786022,0.34698865,0.25073972,0.37668946,0.22173521,0.101953454,0.03666459,-0.23649342,0.16892812,-0.25603932,-0.5447576,-2.6803439,0.38081366,0.43621683,-0.23807566,-0.39417377,-0.44967255,-0.046905488,-0.0031669005,0.16220677,-0.15889229,-0.13928564,-0.032938417,-0.16760623,-0.4221027,0.14005856,0.4759888,-0.22219211,0.24356702,0.069778554,0.12119075,-0.08356009,0.322401,0.11564069,0.3043558,0.11532537,-0.36752775,-0.37099472,0.8545924,0.15155624,0.1300157,-0.15618896,-0.2968638,-0.536106,0.08963044,-0.17530522,-0.19261476,-0.080678046,-0.1359086,-0.30355144,-0.044702653,-0.07506302,-0.4318328,-0.28717908,-0.3487976,0.06863511,0.39075547,-0.6150493,0.15874206,-0.015624685,-0.31210765,-0.035672184,0.35222575,0.23287694,0.25799063,0.0057215625,0.20006527,0.044210684,0.35893327,-0.048853613,0.16035509,-0.21107537,-0.08065295,0.10641689,-0.10719081,0.4682069,0.3239078,0.11948734,0.21285641,-0.16240385,0.4256308,-1.3699089,-0.34549904,-0.12603861,-0.14528951,0.4526836,0.20346248,0.25477633,-0.3627572,-0.0196035,0.40047354,0.14573534,0.13244481,-0.30588648,-0.37971902,0.45495048,0.039639335,0.07314685,0.033155844,-0.5615648,0.21374157,-0.2210516,0.08581455,-0.36336112,-0.09277831,0.0016725259,0.006866234,0.1241639,0.31666654,0.10445189,0.1374232,0.1941593,0.17981102,0.076705776,0.54237366,-0.030623557,0.079421975,-0.3230329,-0.20480889,-0.6578885,0.7953223,-0.2778976,0.3702635,-0.3932364,0.040146958,-0.14664485,-0.9431412,0.12482962,0.061620492,0.200496,0.22162695,-0.29426318,-0.5179403,-0.32705468,0.21291643,-0.49078408,0.74490726,-0.07052347,0.25462162,0.7161882,0.40951404,-0.08186049,0.12919226,-0.06147167,0.19368276,0.14893523,-0.28047642,-0.19431722,-0.18184389,0.19450845,-0.12250774,0.13239782,0.2891553,-0.048221704,-0.31678626,0.10119674,-0.25690222,0.19117263,-0.0052124257,0.32358697,-0.00013706929,-0.5813323,-0.033301774,-1.6083374,0.30167344,0.03794401,0.16378203,-0.20620045,-1.5511516,0.26352334,0.25383168,0.21207473,0.0070167356,0.05488524,-0.015630072,-0.10042042,0.25052908,-0.16243263,-0.041906394,0.3251925,-0.13997266,0.45906258,0.31388107,-0.5826416,0.45432353,0.20838796,-0.08720032,-0.9643516,-0.07512111,0.083756715,0.38969347,2.106686,-0.07619932,0.5076287,0.040424164,0.23839314,-0.023873173,-0.06697044,0.27307668,-0.5373776,0.21231,0.082772486,-0.01696571,0.51100934,0.017603723,-0.32344657,0.0102113085,-0.12120937,-0.023291802,-0.22573048,-0.5591562,0.0076466477,0.51271653,0.28505433,0.021647286,0.028191498,-0.0734993,0.849507,0.09402467,-0.15358241,0.27474684,-0.04978078,0.18161996,-0.10173447,-0.24745286,0.70689106,1.8624718,0.19807518,-0.297868,0.41502747,-0.52598816,0.32472506,0.015769476,0.25856435,-0.27524573,-0.29059997,0.32063386,0.11591884,0.17563608,0.25674888,-0.15675755,-0.20052534,0.18451756,0.006188114,0.03458427,0.17172788,-0.15423763,-0.2351697,-0.19463727,0.04343244,-0.25743678,0.41972533,-0.21249229,0.17491432,0.09534848,-0.2649205,0.25744903,0.46976665,0.06418475,0.53247297,-0.14755064,-0.7570897,0.10199133,0.23018421,-0.20516285,-0.169872,-0.25486267,-0.4320266,-0.06577218,-0.106404185,0.22402784,-0.022344291,-0.55246675,0.5505452,-0.16510256,-0.03126617,0.25408867,0.05461334,0.14456919,0.5122155,0.6031755,0.7384282,-0.11621163,-0.09104172,0.011428807,0.17760858,-0.07299,0.22411112,-0.13240477,-0.061950494,0.06898677,0.24908768,-0.16599314,0.13458236,-0.5454709,-1.0637261,-0.5496252,-0.028946673,-0.40028483,0.09031531,0.83636373,-0.28612274,0.1594573,0.17203344,-0.30606362,-0.12760626,-0.10663414,0.56377673,-0.21329767,-0.2025423,-0.111498594,0.1492396,0.35109845,-0.02885962,0.43678764,0.40740874,0.055731032,0.40178537,0.26975065,-0.03800241,0.08010048,-0.63422436,0.18582027,-0.67522675,-0.278445,0.0843645,-0.13066445,0.0533622,-0.3430478,0.040851653,-0.033254366,0.06696038,0.23504037,0.90564674,-0.15950435,-0.26657194,0.04835304,-0.6706715,-0.2539513,0.04862574,-0.42183855,-0.2592187,-0.3694311,-0.010680385,-0.24151458,0.19263393,-0.24082127,0.24800375,-0.2128035,-0.13886328,0.03884017,-0.34243393,0.017467687,0.053361073,-0.78150576,-0.009690165,0.34942067,0.15872492,0.10412332,0.5059942,-0.47680092,-1.0328512,0.22564612,-0.036583528,0.07183182,-0.12858064,-0.04829226,0.047678284,-0.1926094,0.42537868,-0.0538554,0.08382971,0.03591738,0.18785389,0.15416129,0.018299239,-0.062184125,-0.1570094,-0.06237006,0.033508003,-0.35441434,0.31831327,0.043234862,0.442903,-0.3435299,-0.103613526,-0.517191,0.12153277,0.03503318,0.19694336,0.12846814,0.09055719,0.028431593,-0.6942398,-0.4540259,0.086971045,0.19929862,0.47765735,-0.07425315,0.19234547,0.07571855,-0.17216933,0.05127478,-0.14229463,0.20626982,0.08358153,-0.44501188,0.05648911,-0.009854647,0.15290323,-0.2817045,-0.33750305,-0.3366227,0.33227903,0.40655544,0.1260364,-0.08992646]	45	11
25	[0.36958665,0.23499443,-0.62405187,-0.19177392,0.46975654,-0.48230398,0.36921778,0.102609634,0.27341232,-0.3516684,0.157375,0.07373877,0.8230708,0.2644836,0.22279957,-0.31652552,0.85176706,0.11788951,-0.25938284,-0.41943723,-0.35223317,0.009362332,-0.05132448,0.13811074,0.10251256,0.47301576,0.36676478,-0.22176789,-0.05643358,-0.3060796,-0.04548546,0.20202775,-0.11414505,0.2695935,-0.015908245,-0.43240923,-0.07019497,-0.24849407,-0.044322792,-0.45571333,0.17787321,0.1502735,0.018140567,-0.16097611,-0.2757249,0.94228905,0.25137132,-0.25494486,-0.52698624,0.014780445,0.21334465,-0.23834495,-0.066207744,0.02961728,-0.18872702,0.04739848,0.18361555,-0.0961136,0.19941485,-0.29205704,0.6605352,-0.12995838,-0.03496479,0.11342011,0.13199478,-0.40194106,0.059549324,-0.20321086,-0.057338674,-0.42484257,0.17121994,-0.5023135,0.27488405,-0.43055204,0.4805992,0.4190485,0.17198122,0.3214442,-0.00053101475,-0.19332132,0.031374425,-0.44537097,0.039811876,0.42544562,0.035788823,0.06460345,-0.9538163,0.2546363,-0.05516738,-0.11257264,0.24257044,-0.022035234,-6.7917533,0.13073221,0.5036641,0.69096905,0.15862039,0.24097598,0.32120708,0.10363674,0.40923718,-0.106828846,-0.31653515,0.4065672,-0.11147013,-0.3610602,-2.0607698,0.048114922,0.37610188,-0.52782834,-0.2944622,-0.45654005,0.075258374,-0.11830098,0.061323836,-0.088971116,-0.109457605,-0.19023463,-0.3213308,-0.2982123,-0.14733927,0.42062733,-0.25042215,0.0905918,-0.17831714,0.10032525,-0.123555124,0.20647807,0.14713615,0.2859326,0.2567885,-0.59147537,-0.4038076,0.8813671,0.35959786,0.065391056,-0.04207993,-0.35203114,-0.3328273,-0.28477287,-0.20096633,-0.15716642,-0.3523261,-0.09313992,-0.39448956,0.27658138,-0.2653439,-0.040935036,-0.5071611,-0.43630788,0.049339846,0.4655662,-0.20723404,-0.10275856,0.06043207,-0.25375032,-0.28116208,0.21679777,0.34858266,0.37852946,-0.06597146,0.14622425,0.08213629,0.33892435,0.03302058,0.036438197,-0.23804276,-0.13208038,0.034390155,-0.18123461,0.31982878,0.20586626,0.25259137,0.115884386,-0.06551481,0.42381814,-1.5974655,0.062689,-0.13757505,0.030675303,0.2806404,0.14293388,-0.011405104,0.06343535,-0.17047329,0.36137062,0.030642375,0.06499313,-0.1609993,-0.40078557,0.3992251,0.20739922,-0.22721967,0.17447628,-0.88809055,0.28174266,-0.49398184,0.05225108,-0.30377287,0.17913419,0.02665314,0.0073909056,-0.007932005,0.16744918,0.06335699,0.17639598,0.38986698,0.32917997,-0.013338885,0.62563396,-0.1664044,-0.030605527,-0.016346922,0.03287051,-0.2980312,0.7423889,0.014520232,0.39679128,-0.032200254,0.18832025,-0.3253699,-0.6653355,0.22437683,0.21904658,0.05559384,-0.0008079392,-0.48277557,-0.4598108,-0.20816341,0.088697426,-0.15767147,0.78998303,-0.1652794,0.24385202,0.846679,0.42966276,-0.0146760065,0.29332465,0.2068949,0.30138463,0.081649914,0.06132509,0.032690477,-0.2513871,0.32914105,0.20165052,0.2331144,-0.055587716,-0.51720625,-0.40763322,-0.106345005,-0.1709721,0.075135,-0.12506145,0.57423514,0.06738013,-0.2852331,0.06832162,-1.7946376,0.1897494,-0.16512226,0.030082354,-0.15395877,-1.4830636,0.07003692,-0.049543507,0.43710265,-0.02881731,0.1636342,0.03698543,-0.45863208,0.26530787,-0.39910692,-0.09195755,0.14242917,-0.16033408,0.5934474,0.022729868,-0.38430992,0.3966541,0.1637967,0.1478276,-0.6875107,0.1663896,0.117914796,0.27200353,1.4203353,-0.28271922,0.44306073,0.03400122,0.21405075,-0.025933532,0.15995803,0.029954867,-0.545727,0.46757877,0.22770353,0.08328119,0.7242813,0.010271566,-0.42333573,0.1277305,-0.15986106,-0.1554134,-0.44583482,-0.6529311,0.07759464,0.25606012,0.56971395,0.043046765,0.16503015,-0.44428414,0.87707174,0.14157131,-0.54251474,0.037458133,0.07871024,0.25931168,0.13439897,-0.14103061,0.92730284,1.2291107,0.15097843,-0.011074475,0.24803515,-0.318357,0.19620709,0.2660384,-0.015986629,-0.160845,-0.37082732,0.38536346,-0.10707017,0.17267302,0.13751455,-0.045414567,0.30299264,0.1369553,0.38002163,-0.14719461,0.38831395,-0.27475974,-0.1876004,-0.6165591,0.15481071,-0.014619012,0.48107842,-0.22287183,0.045623217,-0.21797785,-0.162192,0.09983995,0.4943741,-0.21153687,0.36498806,-0.038518116,-1.033159,-0.057778846,0.4095928,-0.54027313,0.045949385,-0.39741692,-0.29886374,-0.04531417,-0.2417848,0.07793705,-0.13671055,-0.30931795,0.7060973,-0.2527753,0.030270297,0.3255338,0.1181597,0.17482537,0.1706242,0.39495915,0.38912323,0.0061428105,-0.034280263,-0.12686689,0.30495122,-0.10729482,0.2425537,-0.35601583,0.15788978,-0.12636745,0.57678956,-0.1851979,0.11816414,-0.59023106,-0.80523276,-0.4023398,-0.052323904,-0.45019183,0.22312795,0.49632072,-0.26003766,0.26093107,0.14585222,-0.752551,-0.18083046,-0.0022980815,0.39487308,-0.10886474,0.005597271,-0.17185652,0.38893977,0.15706654,-0.023753947,0.6116189,0.4955375,0.46433908,0.4626481,0.015865684,-0.24484491,-0.2932625,-0.6321087,-0.024946038,-0.41652447,-0.5049799,0.18532932,-0.0323473,0.016307218,-0.355231,-0.040072676,0.0060441196,-0.01984636,0.32080132,0.6517434,0.059224572,-0.116140954,-0.14791504,-0.47433788,-0.6042919,-0.1713471,-0.25576493,0.058052614,-0.46451598,0.113211975,-0.47668418,-0.006631093,0.13270633,0.02033446,-0.2946774,-0.01690234,-0.21343032,-0.2798676,0.3282134,-0.15877944,-0.52036524,-0.18333845,0.06906721,0.15645236,-0.029810484,0.6300528,-0.126109,-0.73039997,0.2905145,-0.27634677,0.045032028,-0.291407,0.29369068,0.15912513,-0.4088865,0.2642611,0.41028723,-0.07153594,0.13017404,0.30117995,0.081521116,0.2015294,0.22250406,-0.09398627,-0.519706,0.105157115,-0.52146864,0.15331079,0.047380358,0.2233105,-0.5051663,-0.07519834,-0.35042247,0.020360643,0.031521674,0.16339406,-0.051909164,0.07304327,0.27682576,-0.5575236,-0.52640575,0.40792933,0.056734912,0.37820792,-0.31234786,0.14572965,0.23264258,-0.5979945,0.20861985,-0.039493203,0.20795251,0.12776639,-0.20531523,-0.074995406,0.017287448,0.2514113,0.18706632,-0.44588324,-0.1504901,0.01827829,0.096944734,0.11710582,-0.109681554]	46	11
26	[0.24592397,-0.19305378,-0.4281557,0.05610941,0.5971573,-0.44104943,0.3618328,0.045692533,0.29800218,-0.48204184,0.07352821,0.29061776,0.5513939,0.3168309,0.18632416,-0.09861926,0.9495412,0.3950667,-0.23004559,-0.24809569,-0.4273782,0.11578354,0.1136991,0.27444378,-0.028663663,0.29065117,0.3444259,-0.0056510274,-0.028382696,-0.38964236,-0.01322705,0.19467443,-0.35215396,0.06973824,-0.3558305,-0.54254377,0.0956282,-0.2725625,-0.48018548,-0.11847491,0.27291498,0.18338408,-0.16395955,0.23279996,-0.28744105,-0.4922534,0.30841497,-0.17682578,-0.38488558,0.0041402522,-0.10191187,-0.21717227,-0.20677085,-0.16111213,0.051274385,-0.3138857,-0.19839413,0.21363254,0.3869105,-0.4467784,0.38658422,-0.063910395,-0.17276543,-0.13600104,0.2749756,-0.1492835,-0.004357338,-0.2520899,-0.23627841,-0.274451,0.5156705,-0.42897797,0.28939548,-0.4830156,0.5936646,0.44579366,0.08534057,0.009581312,0.088993646,-0.09944108,0.0677067,-0.58080906,-0.060123697,0.2005382,-0.10696882,-0.17430814,-0.5290431,0.07079243,0.16478929,0.12759396,-0.09053592,-0.122523956,-5.265087,-0.08753017,0.20147249,0.96273834,0.53840184,0.4298877,0.052311532,0.5866678,0.35494253,-0.44013947,-0.47313085,0.5282983,-0.21628769,-0.36146367,-2.26856,-0.035827752,0.33573276,-0.09704016,-0.316184,-0.18757324,0.25260237,-0.14586186,-0.12245547,-0.02086011,-0.0044599627,-0.24019583,-0.535106,-0.18840225,-0.3577955,0.5182583,-0.46248525,0.26161513,0.01949954,0.3125806,-0.36015493,0.4146362,0.2592048,0.010140898,0.19039132,-0.5215294,-0.20602302,0.7884424,0.1984295,-0.2581352,-0.17464483,-0.20954113,-0.47407395,-0.17916144,-0.4057803,-0.14376487,-0.011235123,0.40016532,-0.34168985,0.21743067,-0.17572531,-0.11756101,-0.124958396,-0.26407325,0.4151515,0.38813975,-0.7347312,-0.16391642,0.09182036,-0.45664257,-0.4762332,-0.09721734,0.50145257,0.19350982,-0.41079423,0.21362546,-0.03871964,0.1474132,-0.06529876,0.009320418,-0.23202872,0.18773155,-0.41133356,-0.16918749,0.25138444,0.2766349,0.3882163,0.23209088,-0.07086154,0.3656711,-1.2544621,0.019610463,-0.27882823,0.05224844,0.39191207,0.016714701,-0.037948824,0.01844361,-0.30713892,0.28356355,0.16954285,-0.18081959,0.097612366,-0.1397967,0.37405097,0.21552888,0.19092946,0.024122713,-0.78959876,-0.024518264,-0.38653597,0.003662883,-0.05171423,0.24031396,0.17376263,0.294021,-0.16558045,0.076473415,-0.27831283,0.29544473,0.37009412,0.49600556,0.0037942245,0.09499712,0.06442822,-0.38219377,-0.28474438,-0.08919813,-0.06837475,0.59484076,0.12938327,-0.038723595,-0.43031833,0.08992504,-0.36419177,-1.225936,0.36273697,0.55650663,0.099386565,0.099070646,-0.43966398,-0.49104172,0.05418912,-0.0049801636,-0.3330223,0.4752448,-0.004407512,0.2019972,0.7762772,0.25082338,-0.07438868,0.2374296,0.05917461,-0.033081975,0.21787658,-0.22557852,0.004714308,-0.2374576,0.27194592,0.20907381,0.07872117,0.37749028,-0.16028291,-0.44529906,-0.4017591,-0.15401067,0.3122866,0.19869184,0.3816757,0.23791811,-0.64201266,-0.21643889,-2.1048722,0.13581592,-0.113530315,-0.089516155,0.058217835,-1.9841142,0.17987327,-0.17193682,0.2480714,-0.32466775,0.13289264,0.13624385,-0.1464241,0.31908575,-0.0042999857,0.2860005,0.1736807,-0.365708,0.74506706,0.2397908,-0.18849787,0.1783487,0.36954182,-0.019704547,-0.72109467,-0.097174324,0.24182464,0.15063678,1.291457,0.12144888,0.22345018,0.18739252,0.111837156,-0.074897654,0.0297579,0.095264606,-0.15698156,0.21578498,0.47834244,0.09688439,0.7798663,0.097957075,-0.53975135,0.2173547,0.2214089,-0.20562221,-0.14167172,-0.37557882,0.07226082,0.050385397,0.44749683,0.28574717,-0.09012003,-0.35766354,0.7832885,0.16975005,-0.27557826,-0.7153229,0.08975764,0.10781069,0.1840023,0.70138884,0.41188693,1.8621224,0.07626105,-0.36109242,0.46815783,-0.13543458,0.17208007,0.03586616,-0.22417603,-0.5843855,-0.7450727,0.5762973,0.15157281,0.31247824,0.3515627,0.21176313,0.1004837,0.16222067,0.3719786,-0.13625757,0.14425285,-0.16236944,-0.122722395,-0.3324965,0.1547443,-0.28702313,0.5468524,0.08961537,-0.09332621,-0.26275665,-0.13038212,0.22292349,0.287794,-0.22915147,0.28523988,0.61014086,-1.0526233,0.5344616,-0.15634,-0.69221663,-0.14561024,-0.34229282,0.11951515,-0.13196346,-0.16043161,-0.22519758,-0.06442264,0.7635578,0.39761344,-0.085164644,0.18464239,0.3551001,0.20602027,0.20146853,0.28034854,0.4966858,0.39106366,-0.08815979,-0.044333123,0.12189837,0.29053894,-0.076299146,0.32771134,-0.12553325,0.020368923,-0.1504153,0.47744888,-0.13430178,-0.08497231,-0.14721201,-0.11829017,-0.55397224,0.16807441,-0.70259017,0.09641456,0.4634544,-0.019414,0.0016939781,-0.13043949,-0.62698305,-0.2921592,0.25533956,0.018930528,0.22655939,0.06960185,-0.2057234,0.45693806,-0.1040776,-0.064493075,0.35883477,0.17504765,0.33126503,0.54824793,-0.12242366,-0.17198263,0.054840792,-0.16291542,0.21913043,-0.19513549,-0.2506787,0.08435815,0.03705745,-0.05179434,-0.6193974,0.15041447,-0.08475219,-0.3039963,0.248459,0.44540396,-0.5305033,-0.004591915,-0.18107022,-0.26078174,-0.564849,0.2767146,-0.3511781,-0.029284159,-0.0011983555,-0.027482035,-0.66836965,-0.05161506,-0.6971817,0.25044698,-0.18303734,0.2598809,-0.3005142,-0.40774342,0.35210052,-0.17220679,-0.3748423,-0.09526384,0.26548183,0.3153332,0.13999037,0.4997186,-0.30138358,-0.78537095,0.2848851,-0.043718845,-0.014460031,-0.6852035,0.007861586,0.2990639,-0.4952249,0.21235873,0.08730353,-0.54190964,0.20323335,0.18984671,0.13084134,0.08184642,-0.089798324,0.033883173,-0.3336169,0.2186719,0.16229774,-0.02196302,-0.12110788,-0.08908277,-0.24902771,0.1453625,-0.5522003,-0.22346601,-0.11597035,0.031659648,0.19019271,0.38916075,-0.030463865,-0.18839958,-0.7214881,0.5581875,0.10751794,0.22527577,-0.09926624,0.119833,0.012540059,-0.21856906,0.043337848,0.25947893,0.022747776,0.33761188,-0.41720176,0.2235012,0.22964507,0.10691391,0.25695276,-0.5517204,-0.2163092,0.07322461,-0.5053034,0.24529317,-0.14579545]	47	11
27	[0.33871475,-0.0395914,-0.1864159,0.025815051,0.58538413,-0.3920666,0.4492479,0.4377115,0.42307183,0.3421575,-0.45561308,-0.0069839195,0.22846374,-0.07683712,0.08526647,-0.35227054,0.037017487,0.26581904,-0.23445198,0.08580692,0.013017602,0.037845016,0.04976751,0.31468648,-0.018681869,-0.06593704,-0.0047335033,-0.047758903,0.21511626,-0.2873679,0.19279252,-0.3006296,-0.05268382,0.21641074,-0.76727194,-0.6003349,-0.08428627,0.013752339,-0.063172765,-0.34507245,0.3021745,0.3998394,0.11386197,-0.3901937,0.08951342,-0.6193692,0.21770214,-0.58446264,-0.5608404,0.08388622,-0.071984224,0.32901862,-0.12530532,-0.11312241,-0.13746749,-0.47811392,-0.124921896,0.18689965,0.34338057,-0.40069625,0.5858155,-0.22203606,-0.09488155,0.2555713,0.23244509,0.13933346,-0.20897207,-0.33434296,0.13079439,0.06135289,-0.26156545,-0.28994018,0.16440707,-0.36758894,0.26574856,-0.0068015386,-0.1337174,-0.13168485,0.025567777,-0.23204112,0.3084382,-0.41127983,0.017563365,0.5445556,0.062457718,0.06312952,-0.6232581,0.047087703,0.14584015,-0.3795506,0.00058567687,-0.35812747,-6.862194,0.23313251,0.3385712,0.2825951,0.1617991,0.5843807,0.06317085,0.541761,0.19815688,-0.07811845,0.046133194,0.44298083,0.08896672,0.030654319,-1.337367,-0.03023614,0.19147749,-0.45128986,-0.034218132,-0.4733123,0.120756865,-0.069186844,0.19753565,0.051323432,0.119409464,0.34303895,-0.1697389,-0.020715162,-0.095117055,-0.21714835,-0.32708734,0.13906984,-0.0637406,-0.08514104,-0.11846517,0.51723427,0.4383346,0.25883958,0.093631424,-0.7543686,-0.5332414,0.91444373,0.032125562,0.24761951,-0.117466405,-0.7589752,-0.1752526,0.34576464,0.028811477,0.025033988,0.21677841,-0.54566824,-0.44684407,-0.04565813,0.17826442,-0.14972888,-0.5308874,0.22287597,-0.17752956,0.20741588,-1.0229374,-0.018560432,-0.38035253,-0.12196524,0.19269912,-0.20321597,0.5270346,0.4991882,0.2140488,-0.1236745,0.3788059,0.034628037,0.15696812,0.0036806834,-0.32116935,-0.2543152,0.26532856,0.062260635,0.30965248,0.31323633,0.12193046,0.18205376,-0.13415413,0.4733679,-1.4201177,-0.1279235,-0.7033771,-0.008934746,0.1153028,0.074481696,0.3356299,0.07725842,-0.1600033,0.52165055,0.4069599,0.071503505,-0.10195149,-0.09939191,0.12348729,-0.18321864,0.2839141,0.055372134,-0.82451344,0.17891298,-0.42508972,0.19468294,-0.4952056,0.043719765,0.19951014,0.50971794,0.2388921,0.17518747,0.0040346626,0.0619533,0.5154112,0.18960004,-0.010239442,0.4708528,-0.21040319,0.03934779,0.12700228,-0.4955337,-0.57390714,0.38723642,-0.14986797,0.2762341,-0.3039486,0.0058241296,0.17337021,-0.40654865,0.093250476,0.13150029,-0.1049243,0.088434204,0.025549231,-0.51259506,-0.32656905,-0.1640241,-0.20156297,0.6802917,-0.2257151,0.4201447,0.26650947,0.10731089,-0.25711092,0.097417824,-0.2191662,0.046569515,-0.13614227,-0.33482608,0.4241174,-0.31966788,0.11076024,-0.3413615,-0.0012283893,-0.25888413,-0.048895214,-0.1407636,-0.20032571,0.028524356,0.16210745,0.4250025,0.39092207,0.18626204,-0.41285127,0.044474922,-1.6314616,0.07220299,0.23347853,0.11575809,-0.21336894,-1.6642938,-0.05210714,-0.22660083,-0.10112705,-0.22875957,-0.087075025,0.4237009,-0.26389673,-0.13517293,-0.10244197,0.35893413,0.17889409,-0.25598264,0.46624112,0.26420653,-0.32934463,0.3119379,0.032528527,-0.27871802,-0.40566963,-0.28971437,0.20086518,0.2928019,1.2210721,-0.14028801,0.4552696,0.1097768,-0.14964779,0.306676,-0.11700853,0.10710103,-0.3325415,0.15734029,-0.10643063,-0.1895769,0.2416719,-0.081172384,-0.39185742,-0.077507354,-0.30365047,0.13856441,-0.2644372,-0.5276937,0.12577778,0.43310264,0.40657222,-0.039841037,0.25228465,-0.27908868,0.91030127,0.401174,-0.18463,0.22816436,0.10718888,-0.18513283,-0.5131705,-0.050358973,0.6332135,2.8091123,0.50265336,-0.06572714,0.7037862,-0.28194034,0.0695992,-0.26897877,0.13783674,0.096130855,0.009452176,-0.0013260609,0.04060266,-0.095895015,0.09097529,-0.25376672,-0.41818354,0.19977663,0.13420327,-0.12890634,0.001335136,-0.08461226,-0.6164897,-0.60088277,0.020005934,-0.33499572,0.59518325,0.16065963,-0.049197923,-0.10676548,-0.32088766,-0.131612,0.22784366,-0.26604033,0.14902815,-0.33749366,-0.26729256,0.7618316,0.51610553,-0.30029762,0.14037777,-0.14511023,-0.29986244,-0.14747468,-0.1334948,-0.043162145,0.028632535,-0.05200336,0.51697385,-0.08810211,0.036922302,-0.051542412,0.13931449,0.15088265,0.25547224,0.07061034,0.7459749,-0.09628814,0.06038977,0.16709612,0.33222485,-0.7394823,0.18605296,-0.4287484,0.44567245,0.18690896,0.34339532,0.030112173,0.09710147,0.015425525,-0.31909922,-0.5306433,-0.05270265,-0.36145708,-0.23162605,0.42787287,-0.66832346,0.041769847,0.12127684,-0.3042111,-0.13390763,-0.3551521,0.3094647,-0.15063882,-0.12784168,-0.283519,-0.20635988,0.16019668,-0.047993153,0.3633053,0.71794474,0.2412814,0.5166751,0.49484134,-0.5069777,-0.024712019,-0.23384897,0.07731288,-0.11443934,-0.44561416,-0.04807818,-0.010611369,-0.07114818,-0.5419664,0.4100351,-0.085512556,-0.046320286,-0.0047698575,1.4953407,-0.0670236,-0.17875303,-0.15634404,0.02865201,-0.36283672,0.16108021,-0.27120227,-0.37661523,-0.19106811,-0.3353249,-0.23867096,-0.18488628,0.11355898,0.3269281,-0.42741555,-0.5095438,-0.11124875,0.11726511,0.16916938,0.17850019,-0.52979296,-0.38716605,0.045888964,0.23522575,0.29843158,0.33655074,-0.35201555,-0.71708626,0.38922507,-0.2931263,0.4406703,0.010816257,0.13514955,0.57155675,-0.21479367,0.28053138,-0.02759808,-0.27690983,0.18744561,-0.16048977,-0.2452463,0.47298965,0.0642882,-0.24166636,-0.58657455,-0.17901754,0.15177189,-0.06679823,0.015585624,-0.21704195,-0.3265713,-0.15795183,-0.44663405,0.12245537,0.12448316,-0.15672904,-0.28211206,0.1085416,-0.33906227,-0.3663847,-0.54051155,0.10199637,0.10666141,0.45075494,-0.26403362,0.14652114,-0.2598383,-0.108107634,0.1762406,-0.16979001,-0.019903297,0.23072201,-0.011365205,0.15227623,0.0871391,0.03987471,-0.0016008822,-0.47183284,-0.29684561,-0.11743918,0.01903906,0.056860887,0.07016168]	49	12
28	[0.01053815,-0.19168088,-0.23477334,0.08207453,0.58763236,-0.47834843,0.31084692,0.05478309,0.52470845,-0.35886228,0.001075047,0.14597192,0.598176,-0.06786882,-0.08428688,-0.02161574,0.5769197,0.59637815,0.006422188,-0.1752651,-0.29640546,0.024930693,0.017101426,-0.09504561,0.15555847,0.19429137,0.46262106,-0.32172167,0.011301953,-0.4103841,0.06678756,0.017570954,0.07368879,0.53823656,-0.2587041,-0.29729939,-0.44398794,0.08048516,0.0056724306,-0.6448071,0.28290734,0.010409014,0.19711211,-0.5628128,0.013519627,-0.2601923,0.28759158,-0.5489903,-0.121321335,-0.011463854,-0.26616642,0.061622266,-0.2932921,-0.04352196,-0.46260998,-0.6130972,0.36585248,-0.18610011,0.02390167,-0.41559905,0.95957077,-0.1000006,-0.34983438,0.024370257,0.1880624,0.105593845,0.230777,-0.01874775,0.20539705,-0.028112354,-0.28920487,0.038803026,0.35421234,-0.3480173,0.6416769,0.23328766,0.13404556,0.0046721525,-0.09057664,0.056334794,0.2348927,0.023840684,-0.14965712,0.2295098,-0.0781433,-0.02885508,-0.66849047,-0.11921641,0.0057301414,-0.2772833,0.20849374,-0.30560446,-6.444007,-0.39186528,0.12568673,0.44937024,0.070842505,0.5259195,0.3135995,0.8945842,0.363635,-0.13795531,0.011750176,0.48009872,0.16971186,-0.41043124,-1.8905334,0.068261676,0.30872878,-0.33538222,0.20984967,-0.7411269,0.029582787,0.127543,0.08557811,0.102264464,0.1917991,-0.15954442,-0.66319704,0.01609737,-0.19909179,0.023287231,-0.6356077,0.23658016,-0.18139027,-0.03450902,0.1107331,0.007833298,0.35796142,0.22492181,0.31911737,-0.33670983,-0.4643659,0.8610422,0.34338677,0.19335124,-0.07049906,-0.4931532,-0.5267888,-0.01271635,-0.10635586,-0.31109068,0.2024839,-0.09817232,-0.12062046,0.28105304,0.18193999,0.25026995,-0.51612157,-0.15757279,-0.07725017,0.27291086,-0.45675772,-0.13654388,-0.11885798,0.08037687,0.001150777,0.098306604,0.55537546,-0.0066034244,0.15162896,-0.0047666347,0.13783592,-0.002887246,-0.12306605,-0.27378896,-0.61825114,-0.17538577,0.29663223,-0.3117767,0.23711498,0.13599794,0.21261525,0.24357294,-0.31519625,0.13763317,-1.1543237,0.056043163,-0.30017617,0.08019313,0.16788888,0.24593051,0.22729415,-0.16002092,-0.6245636,0.4401117,0.3431325,-0.10904145,-0.017580649,-0.20349163,0.30873197,0.31206214,0.21385357,0.03856177,-0.86040616,0.16055658,-0.51613027,0.28757533,-0.36298174,-0.020516114,-0.20649433,-0.14257856,0.29962367,0.35574657,0.07200988,-0.17551386,0.025182085,0.07783148,-0.11720112,0.5896719,-0.033686195,0.033226,-0.09670532,-0.1783448,-0.30997655,0.41780254,0.067660056,0.19903979,-0.08545339,0.17702776,0.13805662,-0.7355647,0.37738895,0.06424936,0.0014892786,0.31329995,0.010859102,-0.43157685,-0.04837883,-0.15974416,-0.15453477,0.18924205,-0.2793779,0.38445413,0.33861578,0.34878403,-0.20817943,0.14516735,-0.14631382,0.059630226,-0.17077853,0.112887084,0.43093327,-0.45389882,0.2687108,0.014099218,-0.044245247,-0.3708566,-0.2780858,-0.24691518,0.072530545,-0.19671364,0.2549385,0.4742794,0.38305146,0.26798984,-0.49493587,-0.2148324,-1.6119587,-0.01919105,-0.075207494,0.23826112,-0.27819222,-1.503781,0.04110582,-0.49289975,0.31585693,-0.077544875,-0.060314115,0.155963,-0.51233554,0.19103818,-0.4182529,0.39247483,0.3332099,-0.35026824,0.4726512,0.23290582,-0.19460276,0.15461807,-0.029625753,-0.110852204,-0.5299046,0.06632011,0.3833514,0.14091174,1.6254257,-0.3852941,0.07170922,0.12961112,-0.19699596,-0.05567918,0.09665457,0.32393628,-0.59579784,0.3330377,-0.42212874,-0.3879107,0.26476783,0.42182788,-0.6606535,-0.1461833,0.037466485,-0.25257576,-0.3224747,-0.46232635,-0.07845027,0.12885223,0.5287729,0.3561077,0.09719803,-0.38844943,0.8572622,0.15889236,-0.4059064,0.017456641,-0.20922092,-0.00801434,0.0904293,0.050066315,0.87068737,2.777455,0.4171344,0.021985428,0.569466,-0.40978912,0.30723548,-0.23753855,0.38302657,-0.24072471,0.13037306,-0.11744657,0.09870491,0.084776506,-0.015954839,-0.2463897,0.19645953,0.38941792,0.04256231,-0.015849859,-0.14436278,-0.3168824,-0.43321463,-0.91748166,0.16708227,-0.35862973,0.4335318,-0.024456188,-0.005745871,-0.2638309,-0.20471035,0.19651373,0.34951302,-0.34497112,0.3650648,0.05585628,-0.7590403,1.0028181,0.10574573,-0.08271705,-0.29432103,-0.3353873,-0.4300338,0.29797044,-0.33105427,0.003889608,-0.05027768,-0.028972965,0.5018961,0.12244899,0.05982132,0.5035529,0.18950129,0.054031637,-0.008052979,0.45229706,0.38475755,0.018591596,-0.15667066,0.2320714,0.058159802,-0.37167937,-0.23693578,-0.088274226,0.1078464,0.15287521,0.7034808,-0.18381047,-0.057346817,0.08884054,-0.26972258,-0.29381618,-0.21364495,-0.42935506,-0.30619198,0.54022604,-0.2895977,-0.017452795,0.426283,-0.46992347,-0.21599486,0.11405438,0.07484619,0.16173334,-0.227472,-0.4247082,-0.21575001,0.40239188,0.22692448,0.4942425,0.6050049,0.23918091,0.46816742,0.45162162,-0.26449424,0.021355227,-0.28391817,-0.019750308,-0.39609146,-0.54954,-0.03560421,0.032308076,-0.31604925,-0.8260244,0.06218014,0.029439148,-0.3670165,0.17290187,1.1566968,-0.03899427,0.016817601,0.44555056,-0.1577309,-0.7531064,0.3137103,-0.15245529,0.04388179,-0.24251081,-0.11161207,-0.4918227,-0.09888316,-0.19466648,0.119903594,-0.40400022,-0.07293811,-0.20141178,-0.5026147,0.070923746,-0.032465924,-0.16799842,-0.040068492,0.22480221,0.098946266,0.34397262,0.34361827,-0.31378388,-0.5540583,0.4415106,-0.5567867,0.14508298,-0.36952952,0.38016424,0.43312982,-0.27454138,0.22926517,0.25849652,-0.017453345,0.17799047,0.029364927,0.25576454,0.62359846,-0.26127684,0.038204845,-0.43607637,0.4932918,-0.086848624,0.12029324,0.12962042,0.10368084,-0.37286738,0.08500309,-0.5051721,-0.23731868,0.14735717,0.14775953,-0.15202284,-0.080153994,-0.12547627,-0.27015698,-0.6772676,0.33224615,-0.050878268,0.19664496,-0.2922679,-0.05009009,0.12127417,-0.09784777,-0.14402273,0.022531223,0.19382145,-0.050080415,-0.28777438,-0.16256097,0.21353725,0.7319472,-0.034167502,-0.6938365,-0.29758754,0.054460008,0.33091933,0.15649725,0.19317946]	50	12
29	[0.34463948,0.022563126,-0.07969551,0.12520605,0.7588113,-0.31946006,0.41416514,0.4574415,0.15366821,0.11099313,-0.12823188,0.59104043,0.8752042,0.09954389,-0.2059554,-0.30484486,0.48089176,0.5162359,0.05833338,0.017775461,0.10431741,0.36547562,-0.15271282,0.035355937,0.20182154,0.26567316,0.3466029,-0.149316,0.36338896,-0.50850743,0.048107542,-0.04709905,-0.16347726,0.39939693,-0.6989148,-0.5171121,-0.6043954,0.021984685,-0.06448471,-1.0565482,0.19299023,0.28510034,0.28714877,-0.16140461,0.33999398,0.17035921,0.27274296,-0.2458857,0.049630456,-0.3687475,0.23718403,0.01920018,0.111985125,-0.049388483,-0.28477627,-0.79816043,-0.053771812,0.2825957,0.434282,-0.48999074,-0.13962215,-0.30552778,-0.21720609,0.123388685,0.19039166,0.07894225,0.003931659,-0.09875035,0.11945537,-0.0887803,-0.4921001,-0.11594462,0.48637685,-0.06454499,-0.09020687,0.07237154,-0.11779974,-0.072691284,0.21794233,-0.3750519,0.2909905,-0.5400886,-0.2710346,-0.50358075,0.044889007,-0.5374007,-1.2189561,-0.072587036,0.45298135,-0.41634613,0.12754075,-0.0065157725,-6.684009,-0.086691506,0.20066746,0.44369048,-0.048231237,0.21104397,0.5410486,-0.1654471,0.3039386,-0.16407356,0.06376002,0.11620266,-0.47611392,0.30666646,-2.0591276,-0.25139338,0.4262544,0.06270997,0.18056113,-0.24985355,0.018549157,-0.36954746,8.908804e-05,-0.14362952,-0.11680642,-0.3425893,-0.26596782,-0.39205578,0.10659124,-0.32966286,-0.37620154,-0.062607154,0.114718884,0.18924657,-0.48474532,0.19337903,0.38873976,0.032226373,-0.063587815,0.010709996,-0.10968399,0.94704854,0.4394208,-0.036675468,-0.015670728,-0.7653851,-0.71390706,0.14601158,-0.40841907,0.029792817,0.08030408,-0.1839163,-0.26211876,-0.1628851,0.05354776,0.028639607,-0.10086183,-0.030001825,-0.030578488,0.1706045,-0.44646776,0.16218114,0.20707184,0.016611833,-0.19508551,-0.16403532,0.19094753,0.26662666,-0.06616913,-0.020251526,0.099543884,-0.058646798,0.45297164,0.34268224,-0.21761337,0.15187699,0.23362853,-0.43243527,0.08315787,-0.18081427,0.07107163,0.3415212,-0.35142124,0.75094074,-0.47866908,-0.34268713,-0.10339567,0.103242375,0.32945716,-0.0892249,0.027155401,0.020545175,-0.12732902,0.1122888,0.15999727,0.0017399526,-0.37040564,0.05789432,0.602138,0.1230599,0.24766335,-0.025661565,-0.7786758,0.21752511,-0.79754084,0.35709402,-0.50249475,0.27867326,0.066836044,0.10149638,0.15450473,0.4240132,0.25559086,0.0792064,-0.23862901,0.23774478,0.4782143,0.25304145,0.3757685,0.1841587,-0.20886932,-0.032936063,-0.22983277,0.5413041,-0.10801343,0.07670319,-0.51931614,0.021767493,-0.03774872,-0.25619572,0.23112752,-0.18919681,0.25742948,0.22769764,-0.12980594,-0.8103216,-0.21842547,-0.11697834,-0.57310206,0.2407885,0.16972874,0.07932432,0.4711174,0.58897495,-0.5693621,0.12889709,-0.17760713,-0.16125482,-0.29077753,-0.30557606,0.15273291,-0.29174045,0.36589804,0.08840373,0.14335057,-0.01706471,0.27399826,-0.56240475,-0.118813984,-0.101086,0.11190674,0.46169856,0.6063332,0.19804859,-0.2637828,0.097791836,-1.1308112,-0.1517368,-0.1486829,-0.06637442,-0.297566,-0.90396947,0.11771699,-0.26290977,-0.18924841,-0.18157944,0.1085502,-0.1224982,-0.33587193,0.26031333,-0.10932172,-0.12984532,0.13518773,0.17015955,0.48246378,-0.015833916,-0.16289896,0.32165217,0.28838748,-0.2755641,-0.32176915,0.34010178,0.17714065,0.41862476,1.3268143,-0.6592788,0.23060463,0.48950487,0.2741349,0.15600713,0.3420734,0.07439447,-0.23115617,0.4673113,-0.21926618,-0.5757864,0.66703635,0.13117583,0.020302698,0.16163692,0.20369893,0.123482645,0.03671719,-0.3275505,-0.26687685,-0.011185016,0.14857958,0.116934605,-0.06747659,-0.30718005,0.9451617,-0.3494572,-0.21636336,0.20550592,-0.17561017,0.14150415,0.10622989,0.21983828,0.8402885,2.253452,0.20435598,-0.4072404,0.3375219,-0.17488758,-0.2293157,-0.033621266,0.2248382,-0.0333275,0.22156474,-0.046669368,0.13595273,-0.049683247,0.2614415,0.10343437,-0.08893998,0.13338785,0.2859502,0.03427715,-0.1942709,-0.19148752,0.07298722,-0.27130815,-0.1762242,-0.5807157,0.6518275,0.48973307,0.08365928,-0.6322731,-0.15856136,0.24229172,0.5773093,-0.45588988,0.4790378,-0.11939592,-0.3289799,0.6799578,-0.013168966,-0.2988558,-0.44230974,-0.30478585,-0.5753073,0.31017685,-0.3391348,0.110415764,-0.25675604,0.28603217,0.6672114,-0.41757226,0.20865549,0.07906764,0.013878888,0.05835204,0.035472125,0.30827066,0.11683356,-0.37685198,0.37175995,0.1339293,0.6089153,0.16526769,-0.11518268,-0.2076848,0.15111122,0.109164976,0.24436273,0.072005145,0.18267883,-0.3901942,-0.7050827,-0.06740609,-0.20995392,-0.14438702,-0.024314735,0.35577214,-0.26871026,-0.075365864,-0.26089853,-0.587704,-0.36302632,-0.27402917,0.24207677,0.20478652,0.029108008,-0.10821935,0.13874172,0.24745992,0.3105076,0.22826782,-0.14811647,-0.05542574,0.34830406,0.6615526,-0.38357762,0.15791242,-0.37380576,0.01381441,-0.0006202024,-0.31991905,-0.23580065,0.04323667,0.032920487,-0.37191474,0.27091485,0.1529216,-0.30319777,-0.0011485341,0.707872,-0.35095063,-0.38369137,-0.13911441,-0.50360334,-0.6946178,0.43195704,-0.5040508,-0.123819456,-0.15506901,-0.21208951,-0.5479221,-0.09885639,-0.3157606,0.36899254,-0.30554983,-0.12239288,-0.26065794,-0.20619571,0.39246365,0.15678029,-0.4250349,-0.13591345,0.03329227,0.15933864,0.19922975,0.29138982,-0.17420033,-0.46274188,-0.046891384,-0.41253796,0.12409704,-0.43057862,0.25817192,0.36732885,-0.33368927,-0.097339936,0.09024048,-0.4170379,-0.026914338,0.07011394,0.33069924,0.21414275,-0.35433778,-0.27299258,-0.2753716,-0.22196138,0.15724547,0.7654492,0.2962293,0.054644503,-0.01274906,0.14575112,-0.50006235,0.41247135,0.16862191,0.40294746,0.20635532,0.060963053,0.07727296,-0.24260752,-0.4904171,0.09195279,0.11518663,0.14671412,-0.4402359,0.0018455955,0.10734522,-0.09219012,-0.25894693,-0.099671856,-0.30430174,0.00065401377,-0.46163982,0.18617839,0.010208858,0.6537823,-0.15526573,-0.33098212,-0.19647631,-0.16966544,0.050704833,0.036207486,-0.22098997]	51	12
\.


--
-- Data for Name: product_info_values; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_info_values (value, "productInfoId", "productId") FROM stdin;
Trung Quốc	3	6
Nhựa	4	6
NINJAGO	2	6
7	1	6
Trung Quốc	3	7
Nhựa	4	7
SPEED CHAMPIONS	2	7
7	1	7
Việt Nam	3	8
Nhựa	4	8
TECHNIC	2	8
7	1	8
Trung Quốc	3	9
Nhựa	4	9
Batmobile	2	9
13	1	9
Việt Nam	3	10
Nhựa	4	10
 Miniforce	2	10
7	1	10
Trung Quốc	3	11
Nhựa	4	11
MINIFORCE	2	11
7	1	11
Trung Quốc	3	2
Nhựa	4	2
BATMAN FIGURE	2	2
3	1	2
Trung Quốc	3	12
Nhựa	4	12
BOTTLEMAN	2	12
7	1	12
\.


--
-- Data for Name: product_informations; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.product_informations ("productInfoId", "productInfoName", "isActive", type, options, "createdAt", "updatedAt") FROM stdin;
1	Tuổi	t	INPUT_NUMBER	\N	2025-04-06 09:14:50.731+00	2025-04-06 09:14:50.731+00
2	Chủ đề	t	INPUT	\N	2025-04-06 09:14:56.637+00	2025-04-06 09:14:56.637+00
4	Chất liệu	t	SELECT	{Nhựa,Gỗ}	2025-04-06 09:15:42.255+00	2025-04-06 09:15:42.255+00
3	Xuất xứ	t	AUTOCOMPLETE	{"Việt Nam","Nhật Bản",Nga}	2025-04-06 09:15:27.841+00	2025-04-20 13:53:46.535+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.products ("productId", "productName", slug, quantity, description, vat, "soldNumber", "avgRating", "isActive", "createdAt", "updatedAt", "brandId", "categoryId") FROM stdin;
8	Đồ Chơi Lắp Ráp Xe Thể Thao Koenigsegg Jesko Absolut Màu Xám LEGO TECHNIC 42173 (801 Chi Tiết)	do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173-801-chi-tiet	100	Mang đến cảm hứng cho các bé trai và bé gái ở độ tuổi 10+ để lắp ráp chiếc siêu xe sang trọng với bộ lắp ráp LEGO® Technic™ Xe thể thao Koenigsegg Jesko Absolut màu xám (42173). Bộ lắp ráp này vinh danh một trong những chiếc siêu xe  với các tính năng thú vị dành cho những người đam mê xe hơi khám phá. Người chơi có thể mô phỏng lại các khái niệm kỹ thuật khi họ lắp ráp chi tiết động cơ V8 của chiếc siêu xe này. Sau đó, họ có thể kiểm tra tay lái bằng cách sử dụng phần núm có thể tháo rời bên trên khoang ngồi . Một tính năng thú vị của bộ lắp ráp này là hệ thống cửa xoắn đồng bộ lưỡng diện cho phép cửa xoay 90 độ và di chuyển ra ngoài, giống như trên chiếc siêu xe nguyên mẫu. Chiếc xe LEGO Technic này là một ý tưởng quà tặng tuyệt vời cho những trẻ yêu thích xe cộ. 	10	0	0	t	2025-04-16 06:16:23.02+00	2025-04-16 06:16:23.02+00	4	4
9	Chiến xe Batmobile Stunt Force RC BATMAN 6066871	chien-xe-batmobile-stunt-force-rc-batman-6066871	20	Bảo vệ thành phố cùng Chiến xe Batmobile Stunt Force! Chiếc xe Người Dơi này có thể thực hiện những pha truy đuổi đầy tốc độ. Bộ bánh xe với vỏ xốp giúp chiến xe chịu được va đập cực tốt.\r\n\r\nCHINH PHỤC MỌI BỀ MẶT TRONG NHÀ: Từ thảm đến sàn gỗ cứng, chiếc Batmobile này chinh phục mọi bề mặt phẳng bằng hệ dẫn động 4 bánh và động cơ đôi, mang đến khả năng vô tận cho những pha giải cứu nguy hiểm hoành tráng!\r\n\r\nTƯƠNG THÍCH VỚI MÔ HÌNH 4 INCH: Ghép với các nhân vật Batman 4 inch của bạn (được bán riêng) cùng chiếc ô tô đồ chơi này và tạo ra các nhiệm vụ và trận chiến ly kỳ!\r\n\r\n- Xe dùng pin sạc, pin có kèm theo xe\r\n- Điều khiển dùng 2 pin 3A - Pin không đi kèm\r\n- Khoảng cách điều khiến khoảng 30m	10	1	0	t	2025-04-16 06:18:02.009+00	2025-04-24 07:34:24.73+00	2	3
10	Robot Siêu Cảnh Sát Tuần Tra Patrol Cop Điện Năng Miniforce 505001	robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniforce-505001	50	Robot siêu cảnh sát tuần tra Patrol Cop điện năng là sản phẩm thuộc thương hiệu SAMG Entertainment đến từ Series phim hoạt hình được nhiều bạn nhỏ yêu thích – MINIFORCE.\r\n\r\nĐồ đồ chơi mô phỏng nhân vật Siêu cảnh sát tuần tra - Patrol Cop điện năng, có các đặc điểm sau: \r\n- Bé phát triển vận động tinh, học cách thực hiện theo sách hướng dẫn sử dụng;\r\n- Bộ sản phẩm có thể bẻ các khớp tay, chân.. để biến hình robot thành mô hình đầu nhân vật và ngược lại\r\n- Đi kèm 1 vũ khí Patrol Magnum và 1 huy hiệu cảnh sát có thể dùng để trưng bày mô hình đầu nhân vật\r\n\r\nThông tin sản phẩm: \r\n- Chứa các chi tiết đều được làm hoàn toàn từ chất liệu nhựa ABS cao cấp, ráp nối với nhau một cách tỉ mỉ, đảm bảo độ chắc chắn cũng như tính mỹ quan của sản phẩm.\r\n- Chất liệu nhựa không bao gồm những thành phần độc hại cho sức khoẻ của trẻ nhỏ khi sử dụng trong thời gian dài.	10	2	0	t	2025-04-16 06:19:44.476+00	2025-04-20 11:17:21.968+00	5	5
11	Robot Siêu Cảnh Sát Đặc Nhiệm Battle Cop Miniforce 505009	robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009	20	Siêu robot cảnh sát đặc nhiệm Battle Cop là sản phẩm thuộc thương hiệu SAMG Entertainment đến từ Series phim hoạt hình được nhiều bạn nhỏ yêu thích – MINIFORCE. Đồ đồ chơi mô phỏng nhân vật Siêu cảnh sát đặc nhiệm Battle Cop, có các đặc điểm sau:\r\n\r\n - Bé phát triển vận động tinh, học cách thực hiện theo sách hướng dẫn sử dụng;\r\n\r\n- Bộ sản phẩm có thể bẻ các khớp tay, chân.. để biến hình robot thành mô hình đầu nhân vật và ngược lại \r\n\r\n- Đi kèm 1 đại pháo đặc nhiệm và 1 huy hiệu cảnh sát có thể dùng để trưng bày mô hình đầu nhân vật Nhờ các khớp nối vô cùng linh hoạt, bé có thể hóa thân vào nhân vật và thể hiện những pha hành động mạnh mẽ.\r\n\r\nThông tin sản phẩm:\r\n\r\n - Chứa các chi tiết đều được làm hoàn toàn từ chất liệu nhựa ABS cao cấp, ráp nối với nhau một cách tỉ mỉ, đảm bảo độ chắc chắn cũng như tính mỹ quan của sản phẩm.\r\n\r\n- Chất liệu nhựa không bao gồm những thành phần độc hại cho sức khoẻ của trẻ nhỏ khi sử dụng trong thời gian dài.	10	0	0	t	2025-04-16 06:20:59.887+00	2025-04-16 06:20:59.887+00	5	5
7	Đồ Chơi Lắp Ráp Xe Đua Ferrari SF-24 F1 LEGO SPEED CHAMPIONS 77242	do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242	100	Trải nghiệm những pha đua tốc độ cao của Formula 1® với mô hình xe đua Ferrari SF-24 F1® được lắp ráp từ gạch Lego®. Sưu tầm, lắp ráp, trưng bày và trải nghiệm cùng mẫu xe ấn tượng này từ dòng Lego® Speed Champions, được thiết kế với những chi tiết chân thực lấy cảm hứng từ chiếc xe đua tham gia mùa giải Formula 1 năm 2024. Bộ sản phẩm còn đi kèm một nhân vật tay đua Ferrari Lego để đặt vào buồng lái và nhập vai trong các cuộc đua.\r\n\r\nMô hình xe đua Ferrari SF-24 F1® Lego® Speed Champions lắp ráp từ gạch Lego®\r\n\r\nBao gồm nhân vật tay đua Ferrari Lego để đặt vào buồng lái, tạo trải nghiệm nhập vai\r\n\r\nCác chi tiết thiết kế chân thực của Ferrari, bao gồm cả sticker nhà tài trợ và lốp sau rộng hơn\r\n\r\nKhám phá thêm những mẫu xe khác trong dòng Lego® F1®, được bán riêng\r\n\r\nĐồ chơi xe Lego® có thể trưng bày trên kệ hoặc bàn cạnh giường sau khi chơi\r\n\r\nMón quà lý tưởng cho trẻ từ 10 tuổi trở lên và những nhà sưu tầm mô hình xe hơi\r\n\r\nDòng Lego® Speed Champions giúp trẻ em và người hâm mộ xe hơi lắp ráp những mô hình chân thực\r\n\r\nMô hình xe Lego® gồm 275 mảnh ghép, có chiều dài hơn 20 cm (8 inch)	10	10	0	t	2025-04-16 06:14:35.508+00	2025-04-24 09:11:29.171+00	1	4
6	Đồ chơi lắp ráp Chiến giáp của Cole LEGO NINJAGO 71806	do-choi-lap-rap-chien-giap-cua-cole-lego-ninjago-71806	100	Siêu chiến giáp của Cole có buồng lái và được trang bị một cây búa để chiến đấu với những tên Chiến binh Sói gian ác. Và bây giờ, bạn có thể kết hợp các bộ phận của 3 cỗ máy ninja tuyệt vời do Cole, Sora và Kai điều khiển để tạo ra cỗ máy kết hợp của riêng bạn. Mỗi cỗ máy có thể tùy chỉnh và được bán riêng, đi kèm với chân, tay, vũ khí và thân có thể tháo rời để bạn có thể kết hợp.\r\n\r\n• Xây dựng những bộ chiến giáp của riêng bạn – Những bé hâm mộ NINJAGO® có thể tận hưởng hàng giờ vui vẻ sáng tạo khi kết hợp các bộ phận từ những bộ đồ chơi khác nhau (được bán riêng) để tạo ra những bộ siêu chiến giáp NINJAGO® của riêng mình\r\n\r\n• 2 nhân vật NINJAGO® – Bộ trò chơi bao gồm Cole với phụ kiện thanh kiếm mini và Chiến binh Sói gian ác cũng có thanh kiếm. Bé có thể tái hiện các trận chiến từ phần 2 của bộ phim hoạt hình NINJAGO Dragons Rising\r\n\r\n• Chiến giáp có thể điều chỉnh được – chiến giáp hạng nặng này có buồng lái để bé có thể đặt Cole vào, một chiếc búa lớn và tay chân có thể điều chỉnh được, có thể nghiêng và điều chỉnh thành các tư thế chiến đấu. Ngoài ra bé có thể hoán đổi và kết hợp các bộ phận từ chiến giáp của Cole với chiến giáp công nghệ của Sora (71807) và chiến giáp Kai (71808) được bán riêng\r\n\r\n• Quà tặng siêu hấp dẫn cho bé – Bộ LEGO® NINJAGO siêu đỉnh này sẽ mang đến cho bé nghiệm lắp ráp và vui chơi sáng tạo. Qúa thích hợp làm quà tặng cho những dịp sinh nhật hoặc lễ Tết.\r\n\r\n• Xây dựng thế giới LEGO® NINJAGO® của bé – Cùng sưu tập thêm những bộ trò chơi LEGO® NINJAGO® khác và xây dựng một thế giới của riêng bé, từ đó mở ra những câu chuyện mới\r\n\r\n• Kích thước – Bộ lắp ráp LEGO® gồm 235 mảnh, sau khi hoàn thiện cao trên 5,5 inch (14 cm)	10	13	0	t	2025-04-16 06:12:42.188+00	2025-04-24 07:30:09.398+00	3	4
2	Mô Hình Nhân Vật Người Dơi 4inch BATMAN 6055946	mo-hinh-nhan-vat-nguoi-doi-4inch-batman-6055946	100	Đồ chơi BATMAN mô hình siêu anh hùng 4 inch 6058529 là mô hình đồ chơi siêu anh hùng đến từ vũ trụ DC chiếm được tình cảm không nhỏ của mọi người trên toàn thế giới. Mô hình sở hữu các chi tiết hoàn hảo, lắp ráp dễ dàng với các khớp nối linh hoạt. Sản phẩm đến từ hãng BATMAN cực kỳ an toàn cho bé trong quá trình chơi cũng như kích thích sự phát triển trí tuệ của bé\r\n\r\nĐồ chơi siêu anh hùng 6058529 gây ấn tượng với những đặc điểm nổi bật sau đây:\r\n\r\n    Sản phẩm có đường nét và chi tiết sắc sảo kết hợp với áo choàng mềm mại cực kỳ giống với nhân vật trên phim ảnh mang đến một anh hùng người dơi “siêu thực”.\r\n    Mô hình hành động với kích thước chuẩn 10cm nhỏ gọn phù hợp mang đi nhiều nơi cũng như cho bé cầm nắm trong quá trình chơi.\r\n    Sản phẩm được đi kèm 3 vũ khí bí mật như: găng tay, khiên chắn, súng plasma nhằm hỗ trợ bé có thể biến hoá nhiều trạng thái thông qua khả năng tư duy lắp ráp của bé từ đó kích thích trí tuệ, sự tưởng tượng và sáng tạo của trẻ bay cao để cho các nhân vật trong việc hoàn thành nhiệm vụ hay kế hoạch đặt ra của các bé.\r\n    Sản phẩm được làm từ nhựa cao cấp, các góc cạnh được bo tròn với bề mặt nhẵn tạo sự an toàn, không làm trầy xước da khi bé chơi. \r\n    Sở hữu 11 khớp nối giúp bé có thể sáng tạo ra những hành động hay tư thế khác nhau để hòa mình vào cuộc chiến của riêng mình và các bạn chơi cùng.\r\n    Quá trình tháo lắp dễ dàng mà không sợ dễ dàng bị hư hỏng, rớt các khớp nên không hề độc hại trong quá trình bé chơi robot.\r\n    Hỗ trợ kích thích phát triển vận động cũng như trí não của bé trong quá trình chơi mô hình.\r\n    Sản phẩm phù hợp cho các bé có độ tuổi từ 3 tuổi trở lên.\r\n    Sản phẩm giao hàng ngẫu nhiên	10	22	0	t	2025-04-08 08:14:27.707+00	2025-04-20 13:38:02.116+00	2	3
12	Robot Nắp Chai Fujin Phong Thần BOTTLEMAN 175827	robot-nap-chai-fujin-phong-than-bottleman-175827	20	Robot Nắp Chai Fujin Phong Thần 175827 là sản phẩm của nhãn hàng Bottleman thuộc thương hiệu Takaratomy nổi tiếng tại Nhật Bản. Đồ chơi mô hình này lấy cảm hứng từ bộ phim hoạt hình Bottleman - Chiến Vương Nắp Chai.\r\n\r\nĐến với bộ đồ chơi sưu tập này, bé sẽ có cơ hội sở hữu một trong vô số người máy mạnh mẽ của Bottleman trong siêu phẩm phim hoạt hình bộ phim hoạt hình Bottleman - Chiến Vương Nắp Chai.\r\n\r\nĐược sản xuất theo công nghệ đồ chơi Nhật Bản, Robot Nắp Chai Fujin Phong Thần 175827 gây ấn tượng với những đặc điểm nổi bật sau đây:\r\n\r\n- Thiết kế mô phỏng theo người máy Bottleman trong phim hoạt hình, từng chi tiết điều tinh xảo và chính xác. Vì vậy, Robot Nắp Chai Fujin Phong Thần 175827 như bước ra từ những tập phim hoạt hình chắc chắn sẽ khiến bé thích thú.\r\n\r\n- Sản phẩm được làm bằng chất liệu nhựa cao cấp, không chứa chất độc hại. Áp dụng cấu trúc bắn nắp chai hoàn toàn mới các khả năng riêng biệt với từng sản phẩm\r\n\r\n- Mỗi người máy Bottleman đều có sức mạnh và khả năng xuất chiêu riêng biệt. Sở hữu Robot Nắp Chai Fujin Phong Thần 175827 hệ sức mạnh với nắp chai đầu kim loại và có khả năng kết hợp với Raijin Lôi Thần thành Hắc Bạch Thiên Long sẽ làm tăng bộ sưu tập Bottleman của bé. Sản phảm khuyến khích các bé học tập tư duy chiến thuật và tinh thần từ các nhân vật trong Bottleman. Hơn nữa, bé sẽ được thỏa thích chơi đùa, trò chuyện hoặc hóa thân trở thành các nhân vật Bottleman. Từ đó kích thích trí tưởng tượng và sáng tạo của trẻ bay cao bay xa.	10	13	0	f	2025-04-16 06:23:02.56+00	2025-04-20 13:52:56.812+00	6	6
\.


--
-- Data for Name: promotion_periods; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.promotion_periods ("promotionPeriodId", "discountType", "discountValue", "startDate", "endDate", "promotionId") FROM stdin;
2	fixed_amount	30000	2025-04-01 00:00:00	2025-04-30 00:00:00	1
3	fixed_amount	50000	2025-04-15 00:00:00	2025-04-30 00:00:00	1
\.


--
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.promotions ("promotionId", "promotionName", description, "createdAt", "updatedAt", "promotionThumbnailId") FROM stdin;
1	Giảm giá dịp Lễ 30/04 - 01/05	Giảm giá dịp Lễ 30/04 - 01/05	2025-04-08 12:59:12.629+00	2025-04-08 12:59:12.629+00	14
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.reviews ("reviewId", comment, rating, "createdAt", "orderDetailId", "userId", "productId", "parentReviewId") FROM stdin;
1	sản phẩm đúng như mô tả	4.5	2025-04-10 08:14:36.011+00	1	3	2	\N
2	cảm ơn quý khách đã chọn cửa hàng của chúng tôi!	\N	2025-04-10 08:15:25.981+00	\N	1	\N	1
3	sản phẩm giống mô tả	4	2025-04-17 09:26:53.809+00	4	1	6	\N
4	cảm ơn bạn	\N	2025-04-20 13:06:30.515+00	\N	1	\N	3
5	sản phẩm đúng như mô tả	3.5	2025-04-20 13:51:11.437+00	41	2	12	\N
6	cảm ơn quý khách	\N	2025-04-20 13:57:47.752+00	\N	1	\N	5
7	asd	4	2025-04-24 06:08:27.494+00	3	1	2	\N
8	tot	5	2025-04-24 07:32:29.53+00	46	8	6	\N
9	ok	5	2025-04-24 07:32:53.921+00	44	9	6	\N
10	ok	4	2025-04-24 07:33:01.775+00	45	9	7	\N
11	ok	3.5	2025-04-24 07:35:29.7+00	47	9	9	\N
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
54	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/ACg8ocKq1VFJcNDzB5to09e9pQHpTXUYvj1wOMgWfCn-o-trBqi5F97W=s96-c-1745140515308	images/ACg8ocKq1VFJcNDzB5to09e9pQHpTXUYvj1wOMgWfCn-o-trBqi5F97W=s96-c-1745140515308	\N	\N	\N
57	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/undefined-1745153926517	images/undefined-1745153926517	\N	\N	12
60	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1745157467544	images/6055946_2.webp-1745157467544	6	\N	\N
8	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/Luffy.jpg-1744009771420	images/Luffy.jpg-1744009771420	\N	\N	\N
10	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/avt3.png-1744097487436	images/avt3.png-1744097487436	\N	\N	\N
11	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/ACg8ocLd2Qh-PY4zPUE2bGJjWTo28wg5ovRYIAAVLKUnuBiDs0z8PFA=s96-c-1744099937087	images/ACg8ocLd2Qh-PY4zPUE2bGJjWTo28wg5ovRYIAAVLKUnuBiDs0z8PFA=s96-c-1744099937087	\N	\N	\N
12	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_1.webp-1744100008871	images/6055946_1.webp-1744100008871	\N	\N	\N
13	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_4.webp-1744100054990	images/6055946_4.webp-1744100054990	\N	2	\N
14	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_1.webp-1744100054990	images/6055946_1.webp-1744100054990	\N	2	\N
15	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/nguoi-doi-batman-4inch-6055946.webp-1744100054991	images/nguoi-doi-batman-4inch-6055946.webp-1744100054991	\N	2	\N
16	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1744100054992	images/6055946_2.webp-1744100054992	\N	2	\N
17	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/ACg8ocIFJ0CMb2gPOsDhxB9q6Mgq_vfzdCaEcqEBSf8pV8FfcwFdTXApuA=s96-c-1744100170505	images/ACg8ocIFJ0CMb2gPOsDhxB9q6Mgq_vfzdCaEcqEBSf8pV8FfcwFdTXApuA=s96-c-1744100170505	\N	\N	\N
55	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/unnamed.jpg-1745147148260	images/unnamed.jpg-1745147148260	\N	\N	\N
58	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/6055946_2.webp-1745154390021	images/6055946_2.webp-1745154390021	4	\N	\N
61	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/ACg8ocItr9HqOvTvoSE55UPpdmazHWzRH2ypSl9dfT_tY73AOBH1MKek=s96-c-1745470706472	images/ACg8ocItr9HqOvTvoSE55UPpdmazHWzRH2ypSl9dfT_tY73AOBH1MKek=s96-c-1745470706472	\N	\N	\N
19	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1744783780019	images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1744783780019	\N	\N	\N
29	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1744783959918	images/71806_4bd05f3b-92a3-4f59-9596-fc0d990b708b.webp-1744783959918	\N	6	\N
30	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_2.webp-1744783959918	images/71806_2.webp-1744783959918	\N	6	\N
31	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/71806_1.webp-1744783959919	images/71806_1.webp-1744783959919	\N	6	\N
32	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242_7.webp-1744784072961	images/do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242_7.webp-1744784072961	\N	7	\N
33	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242_2.webp-1744784072962	images/do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242_2.webp-1744784072962	\N	7	\N
34	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242.webp-1744784072962	images/do-choi-lap-rap-xe-dua-ferrari-sf-24-f1-lego-speed-champions-77242.webp-1744784072962	\N	7	\N
35	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173_7.webp-1744784181017	images/do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173_7.webp-1744784181017	\N	8	\N
36	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173_3.webp-1744784181019	images/do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173_3.webp-1744784181019	\N	8	\N
37	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173_1.webp-1744784181020	images/do-choi-lap-rap-xe-the-thao-koenigsegg-jesko-absolut-mau-xam-lego-technic-42173_1.webp-1744784181020	\N	8	\N
38	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/chien-xe-batmobile-stunt-force-rc-6066871_3.webp-1744784279903	images/chien-xe-batmobile-stunt-force-rc-6066871_3.webp-1744784279903	\N	9	\N
39	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/chien-xe-batmobile-stunt-force-rc-6066871_1.webp-1744784279904	images/chien-xe-batmobile-stunt-force-rc-6066871_1.webp-1744784279904	\N	9	\N
40	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/chien-xe-batmobile-stunt-force-rc.webp-1744784279904	images/chien-xe-batmobile-stunt-force-rc.webp-1744784279904	\N	9	\N
41	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_1.webp-1744784320550	images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_1.webp-1744784320550	\N	\N	\N
42	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_3.webp-1744784382341	images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_3.webp-1744784382341	\N	10	\N
43	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_2.webp-1744784382342	images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_2.webp-1744784382342	\N	10	\N
44	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_1.webp-1744784382342	images/robot-sieu-canh-sat-tuan-tra-patrol-cop-dien-nang-miniiforce-505001_1.webp-1744784382342	\N	10	\N
45	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009_2.webp-1744784457615	images/robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009_2.webp-1744784457615	\N	11	\N
46	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009_3.webp-1744784457615	images/robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009_3.webp-1744784457615	\N	11	\N
47	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009_1.webp-1744784457616	images/robot-sieu-canh-sat-dac-nhiem-battle-cop-miniforce-505009_1.webp-1744784457616	\N	11	\N
48	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/175827_4.webp-1744784522418	images/175827_4.webp-1744784522418	\N	\N	\N
49	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/175827_1.webp-1744784579995	images/175827_1.webp-1744784579995	\N	12	\N
50	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/175827_4.webp-1744784579995	images/175827_4.webp-1744784579995	\N	12	\N
51	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/robot-nap-chai-fujin-phong-than-175827.webp-1744784579995	images/robot-nap-chai-fujin-phong-than-175827.webp-1744784579995	\N	12	\N
52	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/undefined-1744882839622	images/undefined-1744882839622	\N	\N	\N
56	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/Gui-gop-y-va-khieu-nai.webp-1745147163849	images/Gui-gop-y-va-khieu-nai.webp-1745147163849	\N	\N	\N
59	https://uswmuftkubwmolbqboyn.supabase.co/storage/v1/object/public/ToyStore/images/undefined-1745157391141	images/undefined-1745157391141	\N	\N	14
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.users ("userId", "fullName", email, password, phone, gender, birthday, "isActive", "createdAt", "updatedAt", "avatarId", "roleId") FROM stdin;
1	Duong Hoai Bao	admin@gmail.com	$2b$10$v1Q5Ltn3N78FVqqx4eEJRe5GykpO8TQj1AG5Qt0NwsD5Z4LQXjfmO	0942463758	t	2003-05-25 00:00:00	t	2025-03-09 09:21:09.627+00	2025-04-08 05:57:18.166+00	8	2
4	Thiện Đạt Tăng	tangthiendat2003@gmail.com	\N	\N	\N	\N	t	2025-04-08 08:16:10.837+00	2025-04-08 08:16:10.837+00	17	1
3	Nguyễn Văn A	clone001.test@gmail.com	\N	0942463758	t	2000-01-01 00:00:00	t	2025-04-08 08:12:17.412+00	2025-04-16 05:29:56.257+00	11	1
5	Hubert	duongbao026@gmail.com	\N	\N	\N	\N	t	2025-04-20 09:15:16.061+00	2025-04-20 09:15:16.061+00	54	1
2	Duong Hoai Bao	dhbao2505@gmail.com	$2b$10$wqfVs3vwqQTgt9yRicgnIeBvy0d.BAgCGiGO6nkSnIY.rFOo.LeNm	0912345678	t	1999-12-31 17:00:00	t	2025-04-08 07:12:07.649+00	2025-04-24 04:56:38.984+00	10	1
7	Duong Hoai Bao B2103488	baob2103488@student.ctu.edu.vn	\N	\N	\N	\N	t	2025-04-24 04:58:27.338+00	2025-04-24 04:58:27.338+00	61	1
8	Nguyen Van A	nva@gmail.com	$2b$10$cBS836iBhZ7LcyvFhkXABe6WAkBhlP1Z11Wu2smwyvAnVcrL3rFqS	0912345678	t	2025-04-01 00:00:00	t	2025-04-24 07:14:55.908+00	2025-04-24 07:14:55.908+00	\N	1
9	Nguyen Van B	nvb@gmail.com	$2b$10$uNcM5akOMRduf.xYgR.6NO6JGUQHD4fi27FumdlGyz9UCZX0tcHTK	0912345678	t	2025-04-08 00:00:00	t	2025-04-24 07:15:26.13+00	2025-04-24 07:15:26.13+00	\N	1
10	Nguyen Van C	nvc@gmail.com	$2b$10$KSW5uW7kBiuo4VsS71d/Au9KTWXJX0OQ6.TspatKe/ZzaUEpp86Vy	0912345678	t	2025-04-23 00:00:00	t	2025-04-24 07:37:09.648+00	2025-04-24 07:37:09.648+00	\N	1
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: dhoaibao
--

COPY public.vouchers ("voucherId", "voucherCode", "discountType", "discountValue", "minOrderPrice", "maxPriceDiscount", "startDate", "endDate", quantity, "collectedQuantity", "currentUsedQuantity", "createdAt", "updatedAt") FROM stdin;
1	NGUOIMOI	fixed_amount	30000	0	0	2025-04-01 00:00:00	2025-04-30 00:00:00	100	1	0	2025-04-08 08:20:32.967+00	2025-04-08 08:20:40.152+00
2	GIANGSINH	percentage	20	50000	50000	2025-04-01 00:00:00	2025-04-30 00:00:00	20	0	0	2025-04-08 09:36:45.37+00	2025-04-08 09:36:45.37+00
4	TEST2	fixed_amount	20000	0	50000	2025-04-01 00:00:00	2025-04-30 00:00:00	20	0	0	2025-04-08 09:58:02.384+00	2025-04-08 09:58:02.384+00
5	TEST3	percentage	100	50000	20000	2025-04-01 00:00:00	2025-04-30 00:00:00	20	0	0	2025-04-08 09:59:01.01+00	2025-04-08 09:59:01.01+00
6	TEST4	fixed_amount	20000	0	0	2025-04-01 00:00:00	2025-04-30 00:00:00	20	3	1	2025-04-08 09:59:20.024+00	2025-04-20 12:57:49.361+00
7	TEST5	percentage	30	100000	50000	2025-04-01 00:00:00	2025-04-30 00:00:00	20	1	1	2025-04-08 10:00:30.73+00	2025-04-20 13:38:03.017+00
3	TEST1	percentage	50	50000	50000	2025-04-01 00:00:00	2025-04-30 00:00:00	20	1	1	2025-04-08 09:57:28.825+00	2025-04-20 13:55:07.133+00
\.


--
-- Name: addresses_addressId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."addresses_addressId_seq"', 7, true);


--
-- Name: banners_bannerId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."banners_bannerId_seq"', 1, false);


--
-- Name: brands_brandId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."brands_brandId_seq"', 6, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 7, true);


--
-- Name: categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."categories_categoryId_seq"', 6, true);


--
-- Name: messages_messageId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."messages_messageId_seq"', 18, true);


--
-- Name: newses_newsId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."newses_newsId_seq"', 3, true);


--
-- Name: order_addresses_orderAddressId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_addresses_orderAddressId_seq"', 45, true);


--
-- Name: order_details_orderDetailId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_details_orderDetailId_seq"', 48, true);


--
-- Name: order_statuses_orderStatusId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."order_statuses_orderStatusId_seq"', 1, false);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 45, true);


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

SELECT pg_catalog.setval('public."price_histories_priceHistoryId_seq"', 15, true);


--
-- Name: product_embeddings_product_embedding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public.product_embeddings_product_embedding_id_seq', 36, true);


--
-- Name: product_image_embeddings_productImageEmbeddingId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_image_embeddings_productImageEmbeddingId_seq"', 29, true);


--
-- Name: product_informations_productInfoId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."product_informations_productInfoId_seq"', 4, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."products_productId_seq"', 12, true);


--
-- Name: promotion_periods_promotionPeriodId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."promotion_periods_promotionPeriodId_seq"', 3, true);


--
-- Name: promotions_promotionId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."promotions_promotionId_seq"', 1, true);


--
-- Name: reviews_reviewId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."reviews_reviewId_seq"', 11, true);


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

SELECT pg_catalog.setval('public."upload_images_uploadImageId_seq"', 61, true);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."users_userId_seq"', 10, true);


--
-- Name: vouchers_voucherId_seq; Type: SEQUENCE SET; Schema: public; Owner: dhoaibao
--

SELECT pg_catalog.setval('public."vouchers_voucherId_seq"', 7, true);


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
-- Name: newses_upload_image_id_key; Type: INDEX; Schema: public; Owner: dhoaibao
--

CREATE UNIQUE INDEX newses_upload_image_id_key ON public.newses USING btree (upload_image_id);


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
-- Name: newses newses_upload_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dhoaibao
--

ALTER TABLE ONLY public.newses
    ADD CONSTRAINT newses_upload_image_id_fkey FOREIGN KEY (upload_image_id) REFERENCES public.upload_images("uploadImageId") ON UPDATE CASCADE ON DELETE RESTRICT;


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

