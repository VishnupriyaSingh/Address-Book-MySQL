-- UC1
CREATE DATABASE address_book_service;
-- CREATE DATABASE address_book_service	1 row(s) affected	


-- UC2
USE address_book_service;
CREATE TABLE address_book
(
id INT NOT NULL,
firstname VARCHAR(15) NOT NULL,
lastname VARCHAR(15) NOT NULL,
address VARCHAR(50) NOT NULL,
city VARCHAR(20) NOT NULL,
state VARCHAR(20) NOT NULL,
zip VARCHAR(6) NOT NULL,
phone INT NOT NULL,
email VARCHAR(50) NOT NULL,
PRIMARY KEY (ID)
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


-- UC12
-- Creating Person table
CREATE TABLE Person (
    PersonID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(15) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Zip VARCHAR(6) NOT NULL,
    Phone INT NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PRIMARY KEY (PersonID)
);

-- Creating ContactType table
CREATE TABLE ContactType (
    TypeID INT NOT NULL AUTO_INCREMENT,
    TypeName VARCHAR(50) NOT NULL,
    PRIMARY KEY (TypeID)
);

-- Creating junction table for Person-ContactType relationship
CREATE TABLE Person_ContactType_Relation (
    PersonID INT NOT NULL,
    TypeID INT NOT NULL,
    PRIMARY KEY (PersonID, TypeID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (TypeID) REFERENCES ContactType(TypeID)
);

-- Inserting data into Person table
INSERT INTO Person (FirstName, LastName, Address, City, State, Zip, Phone, Email)
VALUES
    ('Riya', 'Sharma', '45abcd', 'Gurgaon', 'Haryana', '123', 6274676, 'riya@gmail.com'),
    ('Tiya', 'Verma', '55abcd', 'Amritsar', 'Punjab', '456', 352356, 'tiya@gmail.com'),
    ('Ram', 'Singh', '65abcd', 'Faridabad', 'Haryana', '789', 2556347, 'ram@gmail.com');

-- Inserting data into ContactType table
INSERT INTO ContactType (TypeName)
VALUES
    ('Friends'),
    ('Family');

-- Inserting data into Person_ContactType_Relation junction table
INSERT INTO Person_ContactType_Relation (PersonID, TypeID)
VALUES
    (1, 1), -- Riya is 'Friends'
    (2, 1), -- Tiya is 'Friends'
    (3, 2); -- Ram is 'Family'
    

-- UC13
-- Retrieving queries to check  UC 6, UC 7, UC 8 and UC 10 working properly.
SELECT FirstName, City, State FROM Person
WHERE City = 'Amritsar' OR State = 'Punjab';
-- Tiya		Amritsar	Punjab

SELECT COUNT(*) FROM Person
WHERE City = 'Amritsar' OR State = 'Haryana';
-- 3

SELECT * FROM Person
WHERE State = 'Haryana'
ORDER BY FirstName;
-- 3	Ram	Singh	65abcd	Faridabad	Haryana	789	2556347	ram@gmail.com
-- 1	Riya	Sharma	45abcd	Gurgaon	Haryana	123	6274676	riya@gmail.com

SELECT COUNT(*) FROM Person_ContactType_Relation
WHERE TypeID = (SELECT TypeID FROM ContactType WHERE TypeName = 'Friends');
-- 2
