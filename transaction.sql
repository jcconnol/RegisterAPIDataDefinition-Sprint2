CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "transaction";

CREATE TABLE transaction (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  recordid character varying(32) NOT NULL DEFAULT(''),
  employeeid character varying(32) NOT NULL DEFAULT(''),
  totalAmt character varying(1000) NOT NULL DEFAULT(''),
  type character varying(2) NOT NULL DEFAULT(''), --'s' for sale 'r' for return
  refid character varying(32) NOT NULL DEFAULT(''), 
  CONSTRAINT employee_pkey PRIMARY KEY (id)
) 

CREATE INDEX IF NOT EXISTS ix_employee_employeeid
  ON employee
  USING btree(employeeid);

