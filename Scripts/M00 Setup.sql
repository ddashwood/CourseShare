/*
QATSQLPLUS Setup
*/
USE MASTER;

IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'QATSQLPLUS')
	BEGIN
		DROP DATABASE QATSQLPLUS
	END
GO

CREATE DATABASE QATSQLPLUS;
GO

-- add structures

USE QATSQLPLUS;
GO

CREATE TABLE dbo.Vendor(
	VendorID INT IDENTITY(1,1) PRIMARY KEY,
	VendorName VARCHAR(100) NOT NULL,
	ContactName VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(15)
)
GO

CREATE TABLE dbo.Course(
	CourseID INT IDENTITY(1,1) PRIMARY KEY,
	CourseName VARCHAR(200) NOT NULL,
	VendorID INT NOT NULL REFERENCES dbo.Vendor(VendorID)
)
GO

CREATE TABLE dbo.Trainer(
	TrainerID INT IDENTITY(1,1) PRIMARY KEY,
	TrainerName VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(15)
)
GO

CREATE TABLE dbo.CourseRun(
	CourseRunID INT IDENTITY(1,1) PRIMARY KEY,
	CourseID INT NOT NULL REFERENCES dbo.Course(CourseID),
	TrainerID INT NOT NULL REFERENCES dbo.Trainer(TrainerID),
	StartDate DATE NOT NULL,
	DurationDays INT NOT NULL
)
GO

CREATE TABLE dbo.Delegate(
	DelegateID INT IDENTITY(1,1) PRIMARY KEY,
	DelegateName VARCHAR(100) NOT NULL,
	CompanyName VARCHAR(50)
)
GO

CREATE TABLE dbo.DelegateAttendance(
	AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
	CourseRunID INT NOT NULL REFERENCES dbo.CourseRun(CourseRunID),
	DelegateID INT NOT NULL REFERENCES dbo.Delegate(DelegateID)
)
GO

CREATE TABLE dbo.BookTransfers(
	ProductID INT NOT NULL,
	TransferDate DATETIME NOT NULL,
	TransferReason VARCHAR(30) NOT NULL,
	TransferAmount INT NOT NULL
)
GO
CREATE TABLE dbo.BookStock(
	ProductID INT NOT NULL,
	StockAmount INT NOT NULL CHECK (StockAmount >= 0)
)

GO
----- add data
SET IDENTITY_INSERT dbo.Vendor ON

INSERT INTO dbo.Vendor(VendorID, VendorName, ContactName, PhoneNumber) VALUES
	(1,'QA','Peter Jones','0345 074 7857'),
	(2,'Microsoft','Bill Gates','555-789-0102'),
	(3,'Oracle','Larry Ellison','555-453-5436')

SET IDENTITY_INSERT dbo.Vendor OFF
GO

SET IDENTITY_INSERT dbo.Course ON

INSERT INTO dbo.Course(CourseID, CourseName, VendorID) VALUES
	(1000,'QATSQL',1),
	(1001,'QATSQLPLUS',1),
	(1002,'QASQLRB08',1),
	(1003,'QASQLRS',1),
	(20761,'Querying data with Transact-SQL (2016)',2),
	(20762,'Developing SQL Databases (2016)',2),
	(20764,'Administering a SQL Database Infrastructure (2016)',2),
	(20765,'Provisioning SQL Database (2016)',2),
	(20767,'Implementing a SQL Data Warehouse (2016)',2),
	(20768,'Developing SQL Data Models (2016)',2),
	(66378,'mySQL for Developers',3)

SET IDENTITY_INSERT dbo.Course OFF
GO

SET IDENTITY_INSERT dbo.Trainer ON

INSERT INTO dbo.Trainer(TrainerID, TrainerName, PhoneNumber) VALUES
	(100,'Peter Jones','0345 074 7857'),
	(101,'Jason Bourne','0345 074 7858'),
	(102,'Mark Spitz','0345 074 7859'),
	(103,'Bob Carpenter','0345 074 7859'),
	(104,'Judy Phillips','0345 074 7859')

SET IDENTITY_INSERT dbo.Trainer OFF
GO

SET IDENTITY_INSERT dbo.Delegate ON

INSERT INTO dbo.Delegate(DelegateID,DelegateName,CompanyName) VALUES
	(1,'Simon Lidberg','ACME Computer Co.'),
	(2,'Siva Galla','ACME Computer Co.'),
	(3,'Brian Rainer','HAL'),
	(4,'Patrick Corfe','HAL'),
	(5,'Jaya Matthews','HAL'),
	(6,'Chris Mitchell','Computapoint'),
	(7,'Lilly Vargas','Computapoint'),
	(8,'Mary Wall','Scum Newspapers PLC'),
	(9,'Jorge Luna','Space Marine'),
	(10,'Sam Leicester','Simple Mistakes Ltd'),
	(11,'Jason Bourne','Sampler Ltd'),
	(12,'Page Rodgers','Computapoint'),
	(13,'Rob Stewart','ACME Computer Co.'),
	(14,'Laura Byrne','Computapoint'),
	(15,'Jason Ball','ACME Computer Co.'),
	(16,'Lamar Alexander','Totalling Ltd'),
	(17,'Tammy Baldwin','Accoration'),
	(18,'Richard Blumental','Liquid Air Ltd'),
	(19,'Cory Booker','Accoration'),
	(20,'Barbara Colly','Canae PLC'),
	(21,'Maria Cantwell','Finite Resources Ltd'),
	(22,'Bob Casey','Atone'),
	(23,'Susan Collins','Atone'),
	(24,'Tom Cotton','Atone'),
	(25,'Richard Durban','Canae PLC'),
	(26,'Jeff Flack','Airport Management'),
	(27,'Cory Gardner','Initprep'),
	(28,'Dean Keller','Totalling Ltd'),
	(29,'John Hernandez','Initprep'),
	(30,'Jerry Mullin','Liquid Air Limited'),
	(31,'Bob Portman','Kerring'),
	(32,'Harry Reed','Kerring')

SET IDENTITY_INSERT dbo.Delegate OFF
GO 

SET IDENTITY_INSERT dbo.CourseRun ON

INSERT INTO dbo.CourseRun(CourseRunID,CourseID,TrainerID,StartDate,DurationDays) VALUES
	(1,1000,100,'2016-10-03',2),
	(2,66378,101,'2016-10-03',5),
	(3,20761,100,'2016-10-10',3),
	(4,20762,100,'2016-10-10',4),
	(5,1000,100,'2016-10-13',2),
	(6,1001,100,'2016-10-17',2),
	(7,20764,101,'2016-10-24',5),
	(8,20767,103,'2016-10-24',4),
	(9,1001,104,'2016-10-24',2),
	(10,1003,100,'2016-10-24',2),
	(11,1002,104,'2016-10-26',2),
	(12,20768,103,'2016-10-31',3)

SET IDENTITY_INSERT dbo.CourseRun OFF
GO

INSERT INTO dbo.DelegateAttendance VALUES
	(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),
	(2,9),(2,10),
	(3,11),(3,12),
	(5,9),(5,15),(5,1),
	(6,1),(6,3),(6,4),(6,14),(6,15),
	(7,13),(7,14),(7,16),(7,15),(7,3),
	(7,1),(7,2),(7,4),(7,5),(7,6),(7,18),(7,19),(7,20),(7,22),(7,23),(7,25),(7,24),
	(9,7),(9,8),
	(11,7),(11,8),(11,9),
	(12,1),(12,2),(12,6),(12,19),(12,20),(12,22),(12,23)
GO

INSERT dbo.BookTransfers VALUES 
(1, CAST(N'2011-01-29T00:00:00.000' AS DateTime), N'Start Stock', 46),
(1, CAST(N'2011-07-01T00:00:00.000' AS DateTime), N'Transfer Out', -15),
(1, CAST(N'2011-08-01T00:00:00.000' AS DateTime), N'Transfer Out', -11),
(1, CAST(N'2011-08-10T00:00:00.000' AS DateTime), N'Transfer Out', -19),
(2, CAST(N'2012-01-29T00:00:00.000' AS DateTime), N'Start Stock', 73),
(2, CAST(N'2012-05-30T00:00:00.000' AS DateTime), N'Transfer Out', -5),
(2, CAST(N'2012-07-11T00:00:00.000' AS DateTime), N'Transfer Out', -15),
(2, CAST(N'2012-11-28T00:00:00.000' AS DateTime), N'Transfer Out', -7),
(2, CAST(N'2013-01-28T00:00:00.000' AS DateTime), N'Transfer Out', -40),
(2, CAST(N'2013-01-30T00:00:00.000' AS DateTime), N'Transfer Out', -3),
(2, CAST(N'2013-04-30T00:00:00.000' AS DateTime), N'Restock', 10),
(2, CAST(N'2014-02-12T00:00:00.000' AS DateTime), N'Transfer Out', -1),
(3, CAST(N'2011-03-01T00:00:00.000' AS DateTime), N'Start Stock', 70),
(3, CAST(N'2011-05-25T00:00:00.000' AS DateTime), N'Transfer Out', -28),
(3, CAST(N'2011-08-29T00:00:00.000' AS DateTime), N'Transfer Out', -15),
(3, CAST(N'2011-11-29T00:00:00.000' AS DateTime), N'Transfer Out', -26),
(3, CAST(N'2012-08-28T00:00:00.000' AS DateTime), N'Restock', 90),
(3, CAST(N'2013-08-29T00:00:00.000' AS DateTime), N'Transfer Out', -83),
(4, CAST(N'2012-03-30T00:00:00.000' AS DateTime), N'Start Stock', 174),
(4, CAST(N'2012-06-30T00:00:00.000' AS DateTime), N'Transfer Out', -85),
(4, CAST(N'2012-09-28T00:00:00.000' AS DateTime), N'Restock', 100),
(4, CAST(N'2012-12-28T00:00:00.000' AS DateTime), N'Transfer Out', -116),
(4, CAST(N'2013-03-30T00:00:00.000' AS DateTime), N'Restock', 200),
(4, CAST(N'2013-06-30T00:00:00.000' AS DateTime), N'Transfer Out', -60),
(4, CAST(N'2013-09-29T00:00:00.000' AS DateTime), N'Transfer Out', -74),
(5, CAST(N'2012-02-25T00:00:00.000' AS DateTime), N'Start Stock', 82),
(5, CAST(N'2012-05-30T00:00:00.000' AS DateTime), N'Transfer Out', -4),
(5, CAST(N'2012-08-28T00:00:00.000' AS DateTime), N'Transfer Out', -5),
(5, CAST(N'2012-11-28T00:00:00.000' AS DateTime), N'Transfer Out', -13),
(5, CAST(N'2013-02-28T00:00:00.000' AS DateTime), N'Transfer Out', -37),
(5, CAST(N'2013-05-30T00:00:00.000' AS DateTime), N'Restock', 20),
(5, CAST(N'2013-08-29T00:00:00.000' AS DateTime), N'Transfer Out', -5),
(5, CAST(N'2013-11-29T00:00:00.000' AS DateTime), N'Transfer Out', -26),
(6, CAST(N'2013-02-28T00:00:00.000' AS DateTime), N'Start Stock', 40),
(6, CAST(N'2013-05-30T00:00:00.000' AS DateTime), N'Transfer Out', -17),
(6, CAST(N'2013-08-29T00:00:00.000' AS DateTime), N'Transfer Out', -16),
(6, CAST(N'2013-11-29T00:00:00.000' AS DateTime), N'Transfer Out', -7),
(7, CAST(N'2011-12-29T00:00:00.000' AS DateTime), N'Start Stock', 40),
(7, CAST(N'2012-03-30T00:00:00.000' AS DateTime), N'Transfer Out', -11),
(7, CAST(N'2012-06-30T00:00:00.000' AS DateTime), N'Transfer Out', -12),
(7, CAST(N'2012-09-28T00:00:00.000' AS DateTime), N'Transfer Out', -12),
(8, CAST(N'2013-01-28T00:00:00.000' AS DateTime), N'Start Stock', 44),
(8, CAST(N'2013-04-30T00:00:00.000' AS DateTime), N'Transfer Out', -12),
(8, CAST(N'2013-07-31T00:00:00.000' AS DateTime), N'Transfer Out', -14),
(8, CAST(N'2013-10-29T00:00:00.000' AS DateTime), N'Transfer Out', -12)
GO

INSERT INTO dbo.BookStock
	SELECT ProductID, SUM(TransferAmount)
		FROM dbo.BookTransfers
		GROUP BY ProductID
GO

--- create other objects referenced in the course
CREATE FUNCTION dbo.udf_DelegateDays(@DelegateID INT)
	RETURNS TABLE
	AS
	RETURN (
	SELECT count(*) as NumberCourses, sum(CR.DurationDays) AS NumberDays
		FROM dbo.CourseRun AS CR
			INNER JOIN dbo.DelegateAttendance AS DA
				ON CR.CourseRunID = DA.CourseRunID
		WHERE DelegateID = @DelegateID
	)
GO

CREATE FUNCTION dbo.udf_DelegateCourseString(@DelegateID INT)
	RETURNS @C TABLE (Courses VARCHAR(1000))
	AS
	BEGIN
		DECLARE @CourseString VARCHAR(1000)
		SELECT @CourseString = ISNULL(@CourseString + ', ' + C.CourseName,C.CourseName)
			FROM dbo.CourseRun AS CR
				INNER JOIN dbo.DelegateAttendance AS DA
					ON CR.CourseRunID = DA.CourseRunID
				INNER JOIN dbo.Course AS C
					ON C.CourseID = CR.CourseID
			WHERE DelegateID = @DelegateID
		INSERT INTO @C SELECT @CourseString
		RETURN
	END
GO

CREATE VIEW dbo.VendorCourseDelegateCount AS
	SELECT V.VendorName, C.CourseName, count(*) as NumberDelegates
		FROM dbo.Vendor AS V
			INNER JOIN dbo.Course AS C
				ON C.VendorID = V.VendorID
			INNER JOIN dbo.CourseRun as CR
				ON CR.CourseID = C.CourseID
			INNER JOIN dbo.DelegateAttendance AS DR
				ON CR.CourseRunID = DR.CourseRunID
		GROUP BY V.VendorName, C.CourseName
GO

CREATE VIEW dbo.VendorCourseDateDelegateCount AS
	SELECT V.VendorName, C.CourseName, CR.StartDate, count(*) as NumberDelegates
		FROM dbo.Vendor AS V
			INNER JOIN dbo.Course AS C
				ON C.VendorID = V.VendorID
			INNER JOIN dbo.CourseRun as CR
				ON CR.CourseID = C.CourseID
			INNER JOIN dbo.DelegateAttendance AS DR
				ON CR.CourseRunID = DR.CourseRunID
		GROUP BY V.VendorName, C.CourseName, CR.StartDate
GO

CREATE PROC dbo.ResetBookStock AS
	BEGIN
		DELETE FROM dbo.BookStock
		INSERT INTO dbo.BookStock
			SELECT ProductID, SUM(TransferAmount)
				FROM dbo.BookTransfers
				GROUP BY ProductID
		DELETE FROM dbo.BookTransfers	
			WHERE TransferDate >= '2015/01/01'
	END
	
GO
SELECT * FROM dbo.Course
SELECT * FROM dbo.CourseRun
SELECT * FROM dbo.DelegateAttendance
SELECT * FROM dbo.Trainer
SELECT * FROM dbo.Vendor

SELECT * FROM dbo.Delegate
SELECT * FROM dbo.BookTransfers
SELECT * FROM dbo.BookStock

SELECT * FROM dbo.VendorCourseDelegateCount

