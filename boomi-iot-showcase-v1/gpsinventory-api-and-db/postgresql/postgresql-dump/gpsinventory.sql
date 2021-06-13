-- Adminer 4.8.1 PostgreSQL 9.5.25 dump

DROP TABLE IF EXISTS "gpsinventory";
DROP SEQUENCE IF EXISTS gpsinventory_id_seq;
CREATE SEQUENCE gpsinventory_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 4 CACHE 1;

CREATE TABLE "public"."gpsinventory" (
    "id" bigint DEFAULT nextval('gpsinventory_id_seq') NOT NULL,
    "customer_id" character varying(255),
    "customer_name" character varying(255),
    "gpsterminal_id" character varying(255),
	"driver_id" character varying(255),
	"driver_name" character varying(255),
	"vehicle_number" character varying(255),
	"vehicle_category" character varying(255),
	"fuel_total" double precision,
    "lat" double precision,
    "lon" double precision,
    CONSTRAINT "gpsinventory_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "gpsinventory" ("id", "customer_id", "customer_name", "gpsterminal_id", "driver_id", "driver_name", "vehicle_number", "vehicle_category", "fuel_total", "lat", "lon") VALUES
(1,	'1',	'ABC001 limited',	'gps-01-001', 'dr-1111-1', 'ritesh kumar', 'dl01-mk-1111', 'haulage', 0, 0, 0),
(2,	'2',	'ABC002 limited',	'gps-01-002', 'dr-2222-1', 'shyam sunder', 'mh-ab-1111', 'tipper', 0, 0, 0),
(3,	'3',	'ABC003 limited',	'gps-01-003', 'dr-3333-1', 'murugesh kumar', 'ka-xy-1111', 'trailer', 0, 0, 0),
(4,	'4',	'ABC004 limited',	'gps-01-004', 'dr-4444-1', 'kuttu swamy', 'tn-ba-1111', 'delivery', 0, 0, 0);

-- 2021-06-08 07:01:59.003644+00
