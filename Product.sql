CREATE EXTENSION pgcrypto; --Allows PostgreSQL to understand UUIDs. Only have to create the extension once for a database.

--DROP TABLE product;

CREATE TABLE product (
  id uuid NOT NULL DEFAULT gen_random_uuid(), --The record ID. Stored in the edu.uark.dataaccess.entities:BaseEntity#id property. See also the named constant defined in edu.uark.dataaccess.entities:BaseFieldNames that is used for Java <-> SQL mappings.
  lookupcode character varying(32) NOT NULL DEFAULT(''), --Stored in the edu.uark.models.entities:ProductEntity#lookupCode property. See also the named constant defined in edu.uark.models.entities.fieldnames:ProductFieldNames that is used for Java <-> SQL mappings.
  count int NOT NULL DEFAULT(0), --Stored in the edu.uark.models.entities:ProductEntity#count property. See also the named constant defined in edu.uark.models.entities.fieldnames:ProductFieldNames that is used for Java <-> SQL mappings.
  createdon timestamp without time zone NOT NULL DEFAULT now(), --Stored in the edu.uark.dataaccess.entities:BaseEntity#createdOn property. See also the named constant defined in edu.uark.dataaccess.entities:BaseFieldNames that is used for Java <-> SQL mappings.
  sales int NOT NULL DEFAULT(0),
  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

--DROP INDEX ix_product_lookupcode;

CREATE INDEX ix_product_lookupcode --An index on the product table lookupcode column
  ON product
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default"); --Index on the lower case of the lookup code. Queries for product by lookupcode should search using the lower case of the lookup code.

INSERT INTO product (lookupcode, count) VALUES ( --id and createdon are generated by default.
       'lookupcode1'
     , 100)
RETURNING id, createdon;

INSERT INTO product (lookupcode, count) VALUES (
       'lookupcode2'
     , 125)
RETURNING id, createdon;

INSERT INTO product (lookupcode, count) VALUES (
       'lookupcode3'
     , 150)
RETURNING id, createdon;

--SELECT * FROM product;

--DELETE FROM product;

