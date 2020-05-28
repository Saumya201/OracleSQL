CREATE TABLE cust (

cust# number(6),

custname varchar2(30),

city varchar2(20),

rating char(1),

comments varchar2(200),

salesrep# number(7),

CONSTRAINT cust_cust#_pk PRIMARY KEY (Cust#),

CONSTRAINT cust_custname_city_uk UNIQUE (CustName, City),

CONSTRAINT cust_rating_ck CHECK (Rating IN ('A', 'B', 'G', 'E','F','H')),

CONSTRAINT cust_salesrep#_fk FOREIGN KEY (SalesRep#)

    REFERENCES salesrep (repid));
    
SELECT UNIQUE employee_id
FROM employees
WHERE department_id=80

INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(502, 'Black Giant', 'Ottawa', 'B',202);
DROP TABLE SALESREP

CREATE TABLE salesrep (
repid number(6),
fname varchar2(20),
lname varchar2(25),
phone# varchar2(20),
salary number(8,2),
commission number(2,2),
CONSTRAINT salesrep_repid_pk PRIMARY KEY (repid)
);

INSERT INTO salesrep
    SELECT employee_id, first_name, last_name, phone_number, salary, commission_pct 
        FROM employees
        WHERE department_id = 80;
        
SELECT UNIQUE repid
FROM salesrep


INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(501, 'ABC LTD.', 'Montreal', 'C', 201);
INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(502, 'Black Giant', 'Ottawa', 'B', 202);
INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(503, 'Mother Goose', 'London', 'B', 202);
INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(701, 'BLUE SKY LTD', 'Vancouver', 'B', 102);
INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(702, 'MIKE and SAM LTD', 'Kingston', 'A', 107);
INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(703, 'RED PLANET', 'Missisauga', 'C', 107);
INSERT INTO cust (cust#, custname, city, rating, salesrep#) VALUES(717, 'BLUE SKY LTD', 'Regina', 'D', 102);

CREATE TABLE goodcust (
custid NUMBER(6),
"name" VARCHAR2(30),
"location" VARCHAR2(20),
repid NUMBER(7));

INSERT INTO goodcust
    SELECT cust#, custname, city, salesrep#
        FROM cust
        WHERE UPPER(rating) IN ('A', 'B');

ALTER TABLE salesrep
    ADD JobCode VARCHAR2(12);
    
ALTER TABLE salesrep
MODIFY (salary NUMBER(8, 2) NOT NULL)

ALTER TABLE goodcust
MODIFY ("location" VARCHAR2(20))

ALTER TABLE salesrep
MODIFY ( fname VARCHAR2(37));

DESCRIBE salesrep

SELECT MAX(LENGTH("name")) 
FROM goodcust;


ALTER TABLE goodcust
MODIFY ( "name" VARCHAR2(MAX(LENGTH("name"))));

ALTER TABLE salesrep
DROP COLUMN jobcode;

ALTER TABLE salesrep
ADD CONSTRAINT salesrep_repid_pk PRIMARY KEY (repid);

ALTER TABLE goodcust
ADD CONSTRAINT goodcust_custid_pk PRIMARY KEY (custid);

ALTER TABLE salesrep
ADD CONSTRAINT salesrep_phone#_uk UNIQUE (phone#);

ALTER TABLE goodcust
ADD CONSTRAINT goodcust_name_uk UNIQUE ("name");

ALTER TABLE salesrep
    ADD CONSTRAINT salesrep_salary_ck CHECK(salary >= 6000 AND INSERT INTO goodcust (repid)
SELECT repid FROM salesrep;salary <= 12000)
    ADD CONSTRAINT salesrep_commission_ck CHECK(commission <= .50);
    
ALTER TABLE salesrep
    DROP CONSTRAINT salesrep_salary_ck;

ALTER TABLE salesrep
    ADD CONSTRAINT salesrep_salary_ck CHECK(salary >= 5000 AND salary <= 15000);
    
SELECT  constraint_name, constraint_type, search_condition, table_name
FROM     user_constraints      
WHERE table_name IN ('SALESREPS','GOODCUST')
ORDER  BY  4 , 2

DESCRIBE employees

DESCRIBE GOODCUST

CREATE TABLE DIVISION34 (
    DIVISION_ID number(3),
    DIVISION_NAME varchar(25) NOT NULL UNIQUE,
    CONSTRAINT DIV_34_DIV_ID_pk PRIMARY KEY (DIVISION_ID)   
);

INSERT INTO DIVISION34 (division_id, division_name) VALUES ('10', 'Eastern');
INSERT INTO DIVISION34 (division_id, division_name) VALUES ('20', 'Ontario');
INSERT INTO DIVISION34 (division_id, division_name) VALUES ('30', 'Quebec');

SELECT *
FROM DIVISION34

CREATE TABLE WAREHOUSE34(
    Warehouse_id number(3),
    City varchar(25) NOT NULL UNIQUE,
    Rating char(1),
    Found_date date NOT NULL,
    Division_id number(3) NOT NULL,
    CONSTRAINT WAREHOUSE_34_Warehouse_id_pk PRIMARY KEY (Warehouse_id),
    CONSTRAINT WAREHOUSE_34_Division_id_fk FOREIGN KEY (Division_id) 
    REFERENCES DIVISION34(DIVISION_ID),
    CONSTRAINT CHK_Rating CHECK (Rating IN ('A','C','D'))
);  

INSERT INTO WAREHOUSE34 (warehouse_id,city, rating, found_date, division_id) VALUES ('1', 'Montreal','A',sysdate,'10');
INSERT INTO WAREHOUSE34 (warehouse_id,city, rating, found_date, division_id) VALUES ('7', 'Fredericton','C',sysdate,'10');
INSERT INTO WAREHOUSE34 (warehouse_id,city, rating, found_date, division_id) VALUES ('10', 'Toronto','A',sysdate,'30');

Drop table WAREHOUSE34

SELECT * 
FROM WAREHOUSE34 

CREATE TABLE SECTION(
    warehouse_id number(3),
    section_id number(2),
    descrption varchar(40) NOT NULL,
    capacty number(8),
    CONSTRAINT SECTION_Warehouse_id_pk PRIMARY KEY (warehouse_id,section_id),
    CONSTRAINT SECTION_Warehouse_id_fk FOREIGN KEY (warehouse_id) 
    REFERENCES WAREHOUSE34(warehouse_id)
);

ALTER TABLE SECTION
ADD mgr_id number(6);

ALTER TABLE WAREHOUSE34
DROP CONSTRAINT CHK_Rating;

ALTER TABLE WAREHOUSE34
ADD CONSTRAINT CHK_Rating CHECK (Rating IN ('A','C','D', 'Z'));

CREATE SEQUENCE Whse_id_seq_2020
start with 1510
increment by 10
maxvalue 7000
nocycle
cache 5;

INSERT INTO DIVISION34 VALUES(40,'Europe');

SELECT * FROM DIVISION34;  

INSERT INTO WAREHOUSE34 (WAREHOUSE_ID, CITY, RATING, FOUND_DATE,DIVISION_ID) VALUES (Whse_id_seq_2020.NEXTVAL,'Atlanta','Z',SYSDATE,40);

CREATE TABLE CITIES2000 AS
(SELECT * FROM LOCATIONS WHERE LOCATION_ID < 2000);

SELECT * FROM CITIES2000

DESCRIBE CITIES2000;

CREATE VIEW WHSSEC_MAN_VU AS(
  SELECT WAREHOUSE_ID, 
         SECTION_ID, 
         CITY, 
         DIVISION_NAME,
         LAST_NAME
  FROM WAREHOUSE34 JOIN SECTION USING(WAREHOUSE_ID)
  JOIN DIVISION34 USING(DIVISION_ID)
  JOIN EMPLOYEES
  ON MGR_ID = EMPLOYEE_ID
);

SELECT *
FROM sys.views
WHERE create_date >= DATEADD(month,-2, GETDATE());