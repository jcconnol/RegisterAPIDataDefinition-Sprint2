CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "transaction";

CREATE TABLE transaction (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  recordid character varying(32) NOT NULL DEFAULT(''),
  employeeid character varying(32) NOT NULL DEFAULT(''),
  totalAmt int NOT NULL DEFAULT(0),
  type character varying(2) NOT NULL DEFAULT(''), --'s' for sale 'r' for return
  refid character varying(32) NOT NULL DEFAULT(''), 
  CONSTRAINT transaction_pkey PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS ix_transaction_employeeid
  ON employee
  USING btree(employeeid);

