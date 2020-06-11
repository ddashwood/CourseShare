/*
Error Messages

Task 1 : Analyse the code
1.	Analyse the code below to select the line(s) that need replacing by the THROW statement

Task 2: Update the code
1.	Open the query “d:\qatsqlplus\M06 E02 Raising Errors.sql”.
2.	Update the code to THROW rather than PRINT errors. 
•	The error number should be 54000 and the state should be 1.
•	If the @Vendor is NULL then the error message should be “Vendor must not be NULL”
•	if the @Vendor does not exist then the error message should be “Vendor cannot be found”
3.	Test the code with:
•	@Vendor = ‘QA’ (4 rows)
•	@Vendor = ‘AQ’ (error – Vendor cannot be found)
•	@Vendor = NULL (error – Vendor must not be NULL)
4.	Keep the query window open for the following tasks.
?
Task 3 (if time permits) : Update the code again
1.	Open the query “d:\qatsqlplus\M06 E02 Raising Errors.sql”.
2.	Update the code to enhance the second error message
•	if the @Vendor does not exist then the error message should be “Vendor <insert @Vendor value> cannot be found”
•	use FORMATMESSAGE to create the message text
3.	Test the code with:
•	@Vendor = ‘QA’ (4 rows)
•	@Vendor = ‘AQ’ (error – Vendor AQ cannot be found)
•	@Vendor = NULL (error – Vendor must not be NULL)
4.	Keep the query window open for the following tasks.

*/
USE QATSQLPLUS
GO

--TASK 1:
DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'

IF @Vendor IS NULL
	BEGIN
		PRINT 'Vendor must not be NULL'
		RETURN
	END

IF NOT EXISTS (SELECT * FROM dbo.Vendor WHERE VendorName = @Vendor)
	BEGIN
		PRINT 'Vendor ' + @Vendor + ' does not exist'
		RETURN
	END

SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE VendorName = @Vendor	
GO

--TASK 2:
DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'

IF @Vendor IS NULL
	BEGIN
		PRINT 'Vendor must not be NULL'
		RETURN
	END

IF NOT EXISTS (SELECT * FROM dbo.Vendor WHERE VendorName = @Vendor)
	BEGIN
		PRINT 'Vendor ' + @Vendor + ' does not exist'
		RETURN
	END

SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE VendorName = @Vendor	
GO

--TASK 3:
DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'

IF @Vendor IS NULL
	BEGIN
		PRINT 'Vendor must not be NULL'
		RETURN
	END

IF NOT EXISTS (SELECT * FROM dbo.Vendor WHERE VendorName = @Vendor)
	BEGIN
		PRINT 'Vendor ' + @Vendor + ' does not exist'
		RETURN
	END

SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE VendorName = @Vendor	
GO