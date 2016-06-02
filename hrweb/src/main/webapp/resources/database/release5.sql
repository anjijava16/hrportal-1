ALTER TABLE hrportal.tds DROP COLUMN EMPID;

ALTER TABLE hrportal.tds MODIFY COLUMN COMMENTS VARCHAR(255) DEFAULT NULL;

DROP TABLE hrportal.sequence;

DROP TABLE hrportal.commonconstants;

ALTER TABLE hrportal.invoice ADD COLUMN SERVICETAXPER VARCHAR(255) DEFAULT NULL;

ALTER TABLE hrportal.invoicedetails ADD COLUMN NOOFDAYS BIGINT(20) DEFAULT NULL;