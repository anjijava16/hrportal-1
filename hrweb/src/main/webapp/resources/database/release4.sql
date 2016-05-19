ALTER TABLE hrportal.payroll DROP COLUMN BONUS;

ALTER TABLE hrportal.payroll DROP COLUMN LOP;

ALTER TABLE hrportal.empassignment ADD PO_WO VARCHAR(255);

ALTER TABLE hrportal.payroll modify COLUMN TOTALDEDUCTION double(20,2) default null ;

ALTER TABLE hrportal.customer modify COLUMN PINCODE VARCHAR(255) default null ;

ALTER TABLE hrportal.vendor modify COLUMN PINCODE VARCHAR(255) default null ;

ALTER TABLE hrportal.empassignment ADD COLUMN BILLTYPE varchar(1) DEFAULT NULL,
								   ADD COLUMN AMOUNTTYPE varchar(3) DEFAULT NULL,
								   ADD COLUMN AMOUNT double(20,2) DEFAULT NULL;
								   
ALTER TABLE hrportal.invoice MODIFY COLUMN AMOUNTTYPE VARCHAR(3)  NOT NULL;

ALTER TABLE hrportal.empctc ADD COLUMN BANDCHANGE varchar(1) DEFAULT NULL,
							ADD COLUMN DESIGNATION varchar(255) DEFAULT NULL;