-- Creating database IMS that stands for Inventory Management System

CREATE DATABASE IMS;

-- Creating tables PRODUCT, LOCATION and PRODUCTMOVEMENT with attributes as specified

CREATE TABLE IMS.PRODUCT(
product_id VARCHAR(200) NOT NULL,
PRIMARY KEY(product_id)
);

CREATE TABLE IMS.LOCATION(
location_id VARCHAR(200) NOT NULL,
PRIMARY KEY(product_id)
);

CREATE TABLE IMS.PRODUCTMOVEMENT(
movement_id VARCHAR(200) NOT NULL,
timestamp TIMESTAMP NOT NULL,
from_location VARCHAR(200),
to_location VARCHAR(200),
product_id VARCHAR(200) NOT NULL,
qty INT NOT NULL,
CONSTRAINT fk_pid FOREIGN KEY (product_id) REFERENCES IMS.PRODUCT(product_id),
CONSTRAINT fk_lid_from FOREIGN KEY (from_location) REFERENCES IMS.LOCATION(location_id),
CONSTRAINT fk_lid_to FOREIGN KEY (to_location) REFERENCES IMS.LOCATION(location_id)

);

-- Inserting values into the created tables

INSERT INTO IMS.PRODUCT
VALUES (101), (102), (201), (202);

INSERT INTO IMS.LOCATION
VALUES (2001),(2002);

INSERT INTO IMS.PRODUCTMOVEMENT
VALUES ('M01', '2021-02-11 12:30:15',  NULL, '2001', '101', '5'),
      ('M02', '2021-02-11 12:20:15',  NULL, '2001', '102', '6'),
      ('M03', '2021-02-11 01:20:15',  NULL, '2002', '101', '9'),
      ('M04', '2021-02-11 01:29:15',  NULL, '2002', '102', '11'),
      ('M05', '2021-02-12 10:00:11', '2001',  NULL, '101', '2'),
      ('M06', '2021-02-13 15:02:21', '2002',  NULL, '102', '4'),
      ('M07', '2021-02-14 08:12:21', '2001', '2002', '102', '1'),
      ('M08', '2021-02-14 08:16:12', '2002', '2001', '102', '2'),
      ('M09', '2021-02-12 19:09:12', '2002', '2001', '101', '1'),
      ('M10', '2021-02-11 01:01:11', '2002', '2001', '101', '1'),
      ('M11', '2021-02-12 14:45:23', '2001', '2002', '101', '1'),
      ('M12', '2021-02-11 19:49:17',  NULL, '2001', '101', '10'),
      ('M13', '2021-02-12 12:49:11', '2001', '2002', '101', '3'),
      ('M14', '2021-02-13 07:40:41',  NULL, '2002', '202', '13'),
      ('M15', '2021-02-12 17:20:21',  NULL, '2002', '201', '15'),
      ('M16', '2021-02-11 07:21:31',  NULL, '2001', '201', '8'),
      ('M17', '2021-02-12 19:20:39',  NULL, '2001', '201', '8'),
      ('M18', '2021-02-11 09:07:19',  NULL, '2001', '202', '9'),
      ('M19', '2021-02-09 01:02:11', '2002', '2001', '202', '2'),
      ('M20', '2021-02-10 03:52:12', '2001', '2002', '201', '1');


-- Creating Procedures
DELIMITER //

-- To view all entries in PRODUCT
CREATE PROCEDURE IMS.SHOW_p()
BEGIN

SELECT * FROM PRODUCT;

END //

-- To view all entries in LOCATION
CREATE PROCEDURE IMS.SHOW_l()
BEGIN

SELECT * FROM LOCATION;

END //

-- To view all entries in PRODUCTMOVEMENT
CREATE PROCEDURE IMS.SHOW_pm()
BEGIN

SELECT * FROM PRODUCTMOVEMENT;

END //

-- To view remaining products at all locations
CREATE PROCEDURE IMS.SHOW_bal()
BEGIN

SELECT p.product_id,
       l.location_id,
       IFNULL( (SELECT Sum(pm.qty)
				FROM   ims.productmovement AS pm
				WHERE  pm.to_location = l.location_id
					   AND pm.product_id = p.product_id) - (SELECT Sum(pm.qty)
															FROM ims.productmovement AS pm
															WHERE pm.from_location = l.location_id
															AND pm.product_id = p.product_id) AS rem
		, 0),
FROM   ims.product AS p,
       ims.location AS l; 
END //
DELIMITER ;

-- To call the created procedures

CALL IMS.SHOW_p();
CALL IMS.SHOW_l();
CALL IMS.SHOW_pm();
CALL IMS.SHOW_bal();
