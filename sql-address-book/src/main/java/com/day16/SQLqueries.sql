-- UC1
CREATE DATABASE address_book_service;
-- CREATE DATABASE address_book_service	1 row(s) affected	



-- UC2
USE address_book_service;
CREATE TABLE address_book
(
firstname VARCHAR(15) NOT NULL,
lastname VARCHAR(15) NOT NULL,
address VARCHAR(50) NOT NULL,
city VARCHAR(20) NOT NULL,
state VARCHAR(20) NOT NULL,
zip VARCHAR(6) NOT NULL,
phone INT NOT NULL,
email VARCHAR(50) NOT NULL,
PRIMARY KEY (firstname)
);
-- CREATE TABLE address_book 0 row(s) affected



-- UC3
INSERT INTO address_book(firstname,lastname,address,city,state,zip,phone,email) VALUES
('Riya','Sharma','45abcd','Gurgaon','Haryana','123','6274676','riya@gmail.com'),('Tiya','Verma','55abcd','Amritsar','Punjab','456','352356','tiya@gmail.com'),('Ram','Singh','65abcd','Faridabad','Haryana','789','2556347','ram@gmail.com');
-- INSERT INTO address_book(firstname,lastname,address,city,state,zip,phone,email) VALUES	3 row(s) affected  Records: 3  Duplicates: 0 
SELECT * FROM address_book;



-- UC4
ALTER TABLE address_book;
UPDATE address_book set city ='Gurugram' 
WHERE firstname = 'Riya';
SELECT * FROM address_book;
-- Riya	Sharma	45abcd	Gurugram	Haryana	123	6274676	riya@gmail.com
-- Tiya	Verma	55abcd	Amritsar	Punjab	456	352356	tiya@gmail.com
-- Ram	Singh	65abcd	Faridabad	Haryana	789	2556347	ram@gmail.com



-- UC5
DELETE FROM address_book 
WHERE firstname='Ram';
SELECT * FROM address_book;
-- Riya	Sharma	45abcd	Gurugram	Haryana	123	6274676	riya@gmail.com
-- Tiya	Verma	55abcd	Amritsar	Punjab	456	352356	tiya@gmail.com
INSERT INTO address_book(firstname,lastname,address,city,state,zip,phone,email) VALUES
('Ram','Singh','65abcd','Faridabad','Haryana','789','2556347','ram@gmail.com');
SELECT * FROM address_book;



-- UC6
SELECT firstname,city,state FROM address_book
WHERE city='Amritsar' or state='Punjab';
-- Tiya	 Amritsar  Punjab



-- UC7
SELECT COUNT(city or state)
FROM address_book
WHERE city='Amritsar' or state='Haryana';
-- 3 



-- UC8
SELECT * FROM address_book
WHERE state='Haryana'
ORDER BY firstname;
-- Ram	Singh	65abcd	Faridabad	Haryana	789	2556347	ram@gmail.com
-- Riya	Sharma	45abcd	Gurugram	Haryana	123	6274676	riya@gmail.com



-- UC9
ALTER TABLE address_book 
ADD COLUMN type VARCHAR(50) AFTER lastname;
UPDATE address_book 
SET type ='Friends' 
WHERE firstname = 'Riya' or firstname ='Tiya';
UPDATE address_book 
SET type ='Family' 
WHERE firstname = 'Ram';
SELECT * FROM address_book;
-- Ram	Singh	Family	65abcd	Faridabad	Haryana	789	2556347	ram@gmail.com
-- Riya	Sharma	Friends	45abcd	Gurugram	Haryana	123	6274676	riya@gmail.com
-- Tiya	Verma	Friends	55abcd	Amritsar	Punjab	456	352356	tiya@gmail.com



-- UC10
SELECT COUNT(firstname)
FROM address_book
WHERE Type='Friends';
-- 2



-- UC11
UPDATE address_book
SET Type = 'Friends, Family'
WHERE firstname = 'riya';
SELECT * FROM address_book;
-- Ram	Singh	Family			65abcd	Faridabad	Haryana	789	2556347	ram@gmail.com
-- Riya	Sharma	Friends, Family	45abcd	Gurugram	Haryana	123	6274676	riya@gmail.com
-- Tiya	Verma	Friends			55abcd	Amritsar	Punjab	456	352356	tiya@gmail.com


