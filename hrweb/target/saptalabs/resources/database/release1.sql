ALTER TABLE hrportal.bills ADD COLUMN PAIDON DATETIME;
ALTER TABLE hrportal.customer modify COLUMN EMAIL varchar(255) default null;
ALTER TABLE hrportal.vendor modify COLUMN EMAIL varchar(255) default null;