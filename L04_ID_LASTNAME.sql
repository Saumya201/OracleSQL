/*1.	Create table the following tables and their given constraints: (20%)
MOVIES (id:int, title:varchar(35), year:int, director:int,score:decimal(3,2))*/

CREATE TABLE MOVIES (
id int PRIMARY KEY,
title varchar (35) not null,
year int not null, 
director int not null,
score decimal (3,2) CHECK (score <5 AND score>0)
);

/*ACTORS (id:int, name:varchar(20), lastname:varchar(30))*/

CREATE TABLE ACTORS (
id int PRIMARY KEY,
name varchar(20) not null, 
lastname varchar(30) not null
);
/*CASTINGS (movieid:int, actorid:int)*/

CREATE TABLE CASTINGS (
movieid int , 
actorid int ,
PRIMARY KEY(movieid,actorid),
FOREIGN KEY (movieid) REFERENCES MOVIES(id) ,
FOREIGN KEY (actorid) REFERENCES ACTORS(id)
); 

/*DIRECTORS(id:int, name:varchar(20), lastname:varchar(30))*/

CREATE TABLE DIRECTORS (
id int PRIMARY KEY, 
name varchar(20) not null, 
lastname varchar(30) not null

);

/*2.	Modify the movies table to create a foreign key constraint that refers to table directors. (10%) */

ALTER TABLE MOVIES 
ADD FOREIGN KEY (director) REFERENCES DIRECTORS(id);

/*3.	Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed.*/

ALTER TABLE MOVIES
MODIFY title varchar (35) not null UNIQUE;

/*4.	Write insert statements to add the following data to table directors and movies. */

INSERT INTO DIRECTORS 
VALUES('1010','Rob','Minkoff'),
	  ('1020','Bill','Condon'),
      ('1050','Josh','Cooley'),
      ('2010','Brad','Bird'),
      ('3020','Lake','Bell');
      
INSERT INTO MOVIES
VALUES('100','The Lion King','2019','3020','3.50'),
	  ('200','Beauty and the Beast','2017','1050','4.20'),
      ('300','Toy Story 4','2019','1020','4.50'),
      ('400','Mission Impossible','2018','2010','5.00'),
      ('500','The Secret Life of Pets','2016','1010','3.90');
      Yes, Referential Intregrity.
/*1.	Create a new empty table employee2 exactly the same as table employees. */

CREATE TABLE employees2 (
employeeNumber int(11) PRIMARY KEY, 
lastName varchar(50) ,
firstName varchar(50) ,
extension varchar(10) ,
email varchar(100) ,
officeCode varchar(10), 
reportsTo int(11), 
jobTitle varchar(50)
);

/*2. Create a new empty table employee2 exactly the same as table employees. */

ALTER TABLE employees2
ADD username char ;
