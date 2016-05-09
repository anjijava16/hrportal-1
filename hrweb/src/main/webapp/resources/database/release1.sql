ALTER TABLE hrportal.bills ADD COLUMN PAIDON DATETIME;
ALTER TABLE hrportal.employee ADD COLUMN PERSONALEMAILID varchar(255);
ALTER TABLE hrportal.customer modify COLUMN EMAIL varchar(255) default null;
ALTER TABLE hrportal.vendor modify COLUMN EMAIL varchar(255) default null;
ALTER TABLE hrportal.payroll modify COLUMN LOP double(20,2) default null ;