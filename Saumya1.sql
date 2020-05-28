SELECT  OBJECT_SCHEMA_NAME(v.object_id) schema_name,v.name
FROM sys.views v;

 SELECT view_name
 from user_views;
 
 SELECT * 
 FROM user_views 
 WHERE view_name = 'WHSSEC_MAN_VU';
 
 
 SELECT view_name
 FROM user_views
 
CREATE INDEX emp_last_name_idx 
ON 	employees (last_name);

CREATE INDEX emp_first_name_idx 
ON 	employees (first_name);

CREATE TABLE TOWNS AS
(SELECT * FROM LOCATIONS WHERE LOCATION_ID < 1500);

PURGE RECYCLEBIN;

Drop table towns;

SELECT * FROM recyclebin;

FLASHBACK TABLE towns TO BEFORE DROP;
DESCRIBE towns
SELECT * FROM recyclebin;

DROP TABLE towns PURGE;

FLASHBACK TABLE towns TO BEFORE DROP;

CREATE OR REPLACE VIEW CAN_CITY_VU AS(
  SELECT d.DEPARTMENT_NAME AS "DName", 
         c.CITY AS "City",
         c.STATE_PROVINCE AS "Prov"
  FROM CITIES c LEFT JOIN DEPARTMENTS d USING(LOCATION_ID)
  JOIN LOCATIONS l USING(LOCATION_ID)
  WHERE c.COUNTRY_ID NOT LIKE 'US' 
);

drop view CAN_CITY_VU


SELECT * 
FROM CAN_CITY_VU

CREATE OR REPLACE VIEW CAN_CITY_VU AS(
 SELECT   STREET_ADDRESS,
         POSTAL_CODE,
         CITY,
         STATE_PROVINCE
 FROM CITIES
 WHERE COUNTRY_ID='CA'
);

SELECT *
FROM CITIES

