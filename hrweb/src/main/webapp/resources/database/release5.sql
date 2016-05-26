ALTER TABLE hrportal.tds DROP COLUMN EMPID;

ALTER TABLE hrportal.tds MODIFY COLUMN COMMENTS VARCHAR(255) DEFAULT NULL;

DROP TABLE hrportal.sequence;

DROP TABLE hrportal.commonconstants;