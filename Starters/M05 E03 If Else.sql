/*
If Else

Task 1 : Trialing the code
1.	Open the file “d:\qatsqlplus\M05E03 If Else.sql”
2.	Test the query with the @Vendor set to ‘QA’.  The query should return 4 rows.
3.	Test the query with the @Vendor set to NULL.  The query should return no rows.
4.	Keep the query window open for the following tasks.
Task 2 : Checking for NULL value
1.	Update the query to check for a NULL value after the SET statement.  An IF statement should be used and a message returned if the value is NULL.  The original query should be performed if the value is not NULL.
2.	Test the query with the @Vendor set to ‘QA’.  The query should return 4 rows.
3.	Test the query with the @Vendor set to NULL.  A message should be shown.
4.	Keep the query window open for the following tasks.
?
Task 3 : Checking for non-existent Vendors
1.	Update the query to also check for a non-existent Vendor names.  
•	Use the code below for the IF statement:

IF NOT EXISTS (SELECT * FROM dbo.Vendor 
          WHERE VendorName = @Vendor)

•	This should form an IF within the original ELSE section.

IF @Vendor IS NULL
          ….
ELSE
          IF NOT EXISTS (SELECT * FROM dbo.Vendor 
                    WHERE VendorName = @Vendor)
                    ....
          ELSE
                    ….

2.	Test the query with the @Vendor set to ‘QA’.  The query should return 4 rows.
3.	Test the query with the @Vendor set to NULL.  A message should be shown.
4.	Test the query with the @Vendor set to ‘AQ’.  A message should be shown.
5.	Keep the query window open for the following tasks.
Task 4 : Checking for non-existent Vendors (again)
1.	Restructure the previous query to use the RETURN statement.  
•	The return statement should be placed after each message is shown.
•	The return statement stops the execution of following code.
•	The IF statements should follow each other instead of being embedded.
2.	Test the query with the @Vendor set to ‘QA’.  The query should return 4 rows.
3.	Test the query with the @Vendor set to NULL.  A message should be shown.
4.	Test the query with the @Vendor set to ‘AQ’.  A message should be shown.
5.	Close the query and save if you would like.
*/

USE QATSQLPLUS
GO

--TASK 1(a):
DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
GO

--TASK 1(b):
DECLARE @Vendor VARCHAR(100)
SET @Vendor = NULL
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
GO

--TASK 2:


--TASK 3:

--TASK 4:

