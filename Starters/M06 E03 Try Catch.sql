/*
Try Catch

Task 1 : Analyse the code
1.	Analyse the code below to view potential issue(s).
2.	The Vendor table used in this exercise is defined as:
•	dbo.Vendor
?	VendorID primary key int not null
?	VendorName varchar(100) not null
?	ContactName varchar(100) not null
?	PhoneNumber varchar(15) nulls allowed
3.	The original code:
4.	What issues may arise from the code given the table designs?

Task 2: Update the code
1.	Open the query “d:\qatsqlplus\M06 E03 Try Catch.sql”.
2.	Alter the code to catch errors from within the code and return a formatted message with error number = 60000 and state = 1.
3.	Execute the code with different parameters:
•	@Vendor = ‘QA’
?	1 row(s) updated
•	@Vendor = NULL
?	Error message with error number 60000

*/
USE QATSQLPLUS
GO

SELECT * FROM dbo.Vendor

--TASK 1:
DECLARE @Vendor VARCHAR(30) = 'QA'
UPDATE dbo.Vendor
	SET VendorName = @Vendor
	WHERE VendorID = 1

--TASK 2:











