CREATE DATABASE db_library2;
GO
USE db_library2;
GO
---Tables----------------------------------
CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) UNIQUE,
	Address VARCHAR(50),
	Phone VARCHAR(50)
	); 

INSERT INTO PUBLISHER
(PublisherName, Address, Phone) 
VALUES
('Red Inc.', '615 Main St. Reddings SD, 58338', '555-555-5555'),
('Blue Inc.', '616 Main St. Seaside OR, 87443', '555-555-5556'),
('Green Inc.', '617 Main St. Greenville AB, 55638', '555-555-5557'),
('Yellow Inc.', '618 Main St. Sundale CA, 98338', '555-555-5558')
;

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1001,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
	);

INSERT INTO BOOKS
(Title, PublisherName)
VALUES 
('The Lost Tribe', 'Red Inc.'), ('The Stand', 'Blue Inc.'),('The Gunslinger', 'Blue Inc.'),('The Hobbit', 'Green Inc.'), 
('The Fellowship of the Rings', 'Green Inc.'),('1Q84', 'Red Inc.'), ('1984', 'Yellow Inc.'),('Animal Farm', 'Red Inc.'), ('The Great Gatsby', 'Green Inc.'),
('Red Rising', 'Red Inc.'), ('The Cat in the Hat', 'Blue Inc.'),
('The Shining', 'Red Inc.'),('100 Years of Solitude', 'Blue Inc.'),('A River Runs Through It', 'Blue Inc.'),('TLolita', 'Green Inc.'), 
('1776', 'Green Inc.'),('Angelas Ashes', 'Red Inc.'), ('The Nine', 'Yellow Inc.'),('Killing Commadatore', 'Red Inc.'), ('The Traitor Baru Cormarante', 'Green Inc.'),
('Blankets', 'Red Inc.'), ('Folks This Aint Normal', 'Blue Inc.')
;


CREATE TABLE AUTHORS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	AuthorName VARCHAR(50) NULL,
	);

INSERT INTO AUTHORS
(BookID, AuthorName)
VALUES
(1001, 'Mark Lee'),(1002, 'Stephen King'),(1003, 'Stphen King'),
(1004, 'J.R.R. Tolkein'),(1005, 'J.R.R. Tolkein'),(1006, 'Murakami'),
(1007, 'J.R.R. Tolkein'),(1008, 'George Orwell'),(1009, 'F. Scott Fitxgerald'),
(1010, 'Dan Brown'),(1011, 'Dr. Suess'),(1012, 'Stephen King'),
(1012, 'Gabriel Garcia Marques'),(1014, 'Norman McClain'),(1015, 'Vladamir Nbakov'),
(1016, 'David McCoughlick'),(1017, 'Frank McCort'),(1018, 'Jan Burke'),
(1019, 'Murakami'),(1020, 'James Lee'),(1021, 'Dan Arnold'),
(1022, 'Joel Salatin');

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(400, 1),
	Name VARCHAR(50),
	Address VARCHAR(50),
	Phone VARCHAR(50),
	);

INSERT INTO BORROWER
(Name, Address, Phone)
VALUES
('Greg Auger', '711 N. 60th St. Seattle WA', '362-987-3309'),
('Adalei Auger', '711 N. 60th St. Seattle WA', '362-988-3309'),
('Katelynne Toren', '711 N. 60th St. Seattle WA', '363-987-3309'),
('Jami Armstrong', '4355 S. 70th St. Seattle WA', '362-987-3309'),
('Katie Armstrong', '4355 S. 70th St. Seattle WA', '362-465-5409'),
('Elliot Armstrong', '4355 S. 70th St. Seattle WA', '362-989-6277'),
('Rolf Gardner', '8772 W. Beltrami St. Seattle WA', '362-984-4421'),
('Maddisson Gardner', '8772 W. Beltrami St. Seattle WA', '362-987-3679'),
('Peter Skoe', '8472 Birchmont Dr. Seattle WA, 98192', '218-556-5555')
;

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50 )NOT NULL,
	Address VARCHAR(50) NOT NULL,);

INSERT INTO LIBRARY_BRANCH
(BranchName, Address) 
VALUES
('Central', '100 Pike AVE Seattle, WA 98104'),
('Sharpstown', '1818 Cutters Road Sharpstown, WA 97345'),
('Greenwood', '8100 Phinney Ave Seattle, WA 98103'),
('Freemont', '4922 Freemont Dr. NW Seattle, WA 98107')
;

CREATE TABLE BOOK_COPIES (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	Number_Of_Copies INT NOT NULL,
	);

INSERT INTO BOOK_COPIES 
(BookID, BranchID, Number_Of_Copies)
VALUES
(1001, 2, 3),(1002, 1, 2),(1003, 1,2),(1004, 3, 4),(1005,4,5),
(1006, 2, 3),(1007, 1, 2),(1008, 1,2),(1009, 3, 4),(1010,4,5),
(1011, 2, 3),(1012, 1, 2),(1013, 1,2),(1014, 3, 4),(1015,4,5),
(1016, 2, 3),(1017, 1, 2),(1018, 1,2),(1019, 3, 4),(1020,4,5),
(1001, 1, 3),(1002, 4, 2),(1003, 4,2),(1004, 1, 4),(1005,3,5),
(1006, 1, 3),(1007, 4, 2),(1008, 4,2),(1009, 1, 4),(1010,3,5),
(1011, 1, 3),(1012, 4, 2),(1013, 4,2),(1014, 1, 4),(1015,3,5),
(1016, 1, 3),(1017, 4, 2),(1018, 4,2),(1019, 1, 4),(1020,3,5),
(1001, 4, 3),(1002, 3, 2),(1003, 3,2),(1004, 4, 4),(1005,2,5),
(1006, 4, 3),(1007, 3, 2),(1008, 3,2),(1009, 4, 4),(1010,2,5),
(1011, 4, 3),(1012, 3, 2),(1013, 3,2),(1014, 4, 4),(1015,2,5),
(1016, 4, 3),(1017, 3, 2),(1018, 3,2),(1019, 4, 4),(1020,2,5)
;

CREATE TABLE BOOK_LOANS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT FOREIGN KEY REFERENCES BORROWER(CardNo),
	DateOut CHAR(50) NOT NULL,
	DateDue CHAR(50) NOT NULL,
	);

INSERT INTO BOOK_LOANS
(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
(1022, 1, 400, '2018-11-08', '2018-11-22'),(1021, 1, 400, '2018-11-08', '2018-11-22'),(1020, 1, 400, '2018-11-08', '2018-11-22'),(1019, 1, 400, '2018-11-08', '2018-11-22'),(1022, 1, 400, '2018-11-08', '2018-11-22'),(1018, 1, 400, '2018-11-08', '2018-11-22'),(1017, 1, 400, '2018-11-08', '2018-11-22'),
(1002, 1, 401, '2018-11-01', '2018-11-15'),(1003, 1, 401, '2018-11-01', '2018-11-15'),(1004, 1, 401, '2018-11-01', '2018-11-15'),(1005, 1, 401, '2018-11-01', '2018-11-15'),(1006, 1, 401, '2018-11-01', '2018-11-15'),(1007, 1, 401, '2018-11-01', '2018-11-15'),
(1009, 2, 402, '2018-12-01', '2018-11-20'),(1010, 2, 402, '2018-16-01', '2018-11-20'),(1011, 2, 402, '2018-12-01', '2018-11-16'),(1012, 2, 402, '2018-12-01', '2018-11-16'),(1013, 2, 402, '2018-12-01', '2018-11-16'),(1014, 2, 402, '2018-12-01', '2018-11-16'),(1015, 2, 402, '2018-12-01', '2018-11-16'),
(1011, 3, 403, '2018-12-01', '2018-11-16'),(1012, 3, 403, '2018-12-01', '2018-11-16'),(1013, 3, 403, '2018-12-01', '2018-11-16'),(1014, 3, 403, '2018-12-01', '2018-11-16'),(1015, 3, 403, '2018-12-01', '2018-11-16'),(1016, 3, 403, '2018-12-01', '2018-11-16'),(1017, 3, 403, '2018-12-01', '2018-11-16'),
(1019, 4, 404, '2018-11-07', '2018-11-21'),(1018, 4, 404, '2018-11-07', '2018-11-21'),(1016, 4, 404, '2018-11-07', '2018-11-21'),(1017, 4, 404, '2018-11-07', '2018-11-21'),(1015, 4, 404, '2018-11-07', '2018-11-21'),(1014, 4, 404, '2018-11-07', '2018-11-21'),
(1022, 2, 405, '2018-11-08', '2018-11-22'),(1012, 2, 405, '2018-11-08', '2018-11-22'),(1021, 2, 405, '2018-11-08', '2018-11-22'),(1020, 2, 405, '2018-11-08', '2018-11-22'),(1019, 2, 405, '2018-11-08', '2018-11-22'),(1010, 2, 405, '2018-11-08', '2018-11-22'),
(1012, 4, 407, '2018-11-11', '2018-11-26'),(1014, 4, 407, '2018-11-11', '2018-11-26'),(1016, 4, 407, '2018-11-11', '2018-11-26'),(1018, 4, 407, '2018-11-11', '2018-11-26'),(1002, 4, 407, '2018-11-11', '2018-11-26'),(1004, 4, 407, '2018-11-11', '2018-11-26'),
(1006, 3, 406, '2018-11-11', '2018-11-26'),(1007, 3, 406, '2018-11-11', '2018-11-26'),(1008, 3, 406, '2018-11-11', '2018-11-26'),(1009, 3, 406, '2018-11-11', '2018-11-26'),(1010, 3, 406, '2018-11-11', '2018-11-26'),(1011, 3, 406, '2018-11-11', '2018-11-26');

--Proc1 to find # copies of "The Lost Tribe (id=1001) at Sharpstown branch (id=2)
GO
CREATE PROCEDURE dbo.NoLostTribeAtSharps
AS
SELECT Number_Of_Copies AS 'Copies of The Lost Tribe At Sharpstown'
FROM BOOK_COPIES
WHERE BookID=1001 AND BranchID=2;
GO


--Procedure2 to find how many copies of "The Lost Tribe" are at each library branch.
Go
CREATE PROCEDURE dbo.copiesOfLostTribe
AS
SELECT BranchName, SUM(Number_of_Copies) AS 'Number of Copies'
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH 
ON LIBRARY_BRANCH.BranchID=BOOK_COPIES.BranchID
INNER JOIN BOOKS ON BOOKS.BookID=BOOK_COPIES.BookID
WHERE BOOKS.Title = 'The Lost Tribe' 
GROUP BY BranchName;
GO

---Proc3-----
GO
CREATE PROCEDURE dbo.NamesWithNoBooks
AS
SELECT Name AS 'Names with no books'
FROM BORROWER
WHERE BORROWER.CardNo NOT IN(SELECT CardNo FROM BOOK_LOANS)
;
GO

--Proc 4 to view books and borrowers due at Sharpstown today
GO
CREATE PROCEDURE dbo.SharpsDue
AS
SELECT Title AS 'Title Due', BORROWER.Name, BORROWER.Address
FROM BOOK_LOANS
INNER JOIN BORROWER 
ON BOOK_LOANS.CardNo = BORROWER.CardNo
INNER JOIN BOOKS
ON BOOKS.BookID=BOOK_LOANS.BookID
WHERE BOOK_LOANS.BranchID=2
AND BOOK_LOANS.DateDue= '2018-11-20'
;
GO

--Proc5 to view # checked out books at each branch
GO
CREATE PROCEDURE dbo.BranchCountOut
AS
SELECT BranchName, COUNT(*) AS 'Checked Out'
FROM LIBRARY_BRANCH
LEFT JOIN BOOK_LOANS
ON LIBRARY_BRANCH.BranchID=BOOK_LOANS.BranchID
GROUP BY LIBRARY_BRANCH.BranchName
;
GO

--Proc6 listing name and adrees and #books out for borrowers with 5 or more.
GO
CREATE PROCEDURE dbo.MoreThanFive
AS
SELECT Name, Address, COUNT(BOOK_LOANS.CardNo) AS 'Checked Out'
FROM BORROWER
LEFT JOIN BOOK_LOANS
ON BORROWER.CardNo=BOOK_LOANS.CardNo
GROUP BY BORROWER.Name, BORROWER.Address
HAVING COUNT(BOOK_LOANS.CardNo)>=5
;
GO

--Procedure 7 listing all the books and #copies by Stephen King at Central Branckh
--Results are a little funny because of how data was entered into 'BOOKS_COPIES' Table.
GO
CREATE PROCEDURE dbo.KingAtCentral
AS
SELECT Title, Number_Of_Copies
FROM BOOK_COPIES
LEFT JOIN BOOKS
ON BOOK_COPIES.BookID=BOOKS.BookID
LEFT JOIN AUTHORS
ON BOOK_COPIES.BookID=AUTHORS.BookID
WHERE AuthorName='Stephen King' AND BranchID=1
;
GO
--Drill 1
EXECUTE dbo.NoLostTribeAtSharps;
--Drill 2
EXECUTE dbo.copiesOfLostTribe;
--Drill 3
EXECUTE dbo.NamesWithNoBooks;
--Drill 4
EXECUTE dbo.SharpsDue;
--Drill 5
EXECUTE dbo.BranchCountOut;
--Drill 6
EXECUTE dbo.MoreThanFive;
--Drill 7
EXECUTE dbo.KingAtCentral;

DROP TABLE BOOK_COPIES;
DROP TABLE BOOK_LOANS;
DROP TABLE BORROWER;
DROP TABLE AUTHORS;
DROP TABLE BOOKS;
DROP TABLE PUBLISHER;
DROP TABLE LIBRARY_BRANCH;

USE master;

DROP DATABASE db_library2;




