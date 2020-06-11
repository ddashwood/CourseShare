/*
Transactions

Task 1 : Design and code
1.	The two tables used in this exercise are:
•	dbo.BookTransfers
?	ProductID int not null
?	TransferDate datetime not null
?	TransferReason varchar(30) not null
?	TransferAmount int not null
•	dbo.BookStock
?	ProductID not null
?	StockAmount int not null must be >= 0
2.	The original code:

3.	What issues may arise from the code given the table designs?
?
Task 2: Alter the code to stop issues
1.	Open the start code from “d:\qatsqlplus\M07 E01 Transactions.sql”.
2.	Update the code to:
•	Check and reject NULL variable values
•	Start a TRY block
•	Start a transaction within the TRY block
•	Perform the original insert and update
•	Commit the transaction
•	End the TRY block
•	Start a CATCH block
•	Rollback the transaction
•	THROW an error
•	End the CATCH block
3.	Test the query with different parameters:
•	@ProductID = 1, @Amount = 3000
?	The result should be that an error will be thrown
•	@ProductID = 1, @Amount = 1
?	The result should be that an error will be thrown
•	@ProductID = NULL, @Amount = 3
?	The result should be that an error will be thrown
•	@ProductID = 4, @Amount = 1
?	2 “(1 row(s) affected)” messages
4.	The query can be saved if you want.

*/
USE QATSQLPLUS
GO

--TASK 1:
/* Original code given
DECLARE @ProductID INT = 1
DECLARE @Amount INT = 3

INSERT INTO dbo.BookTransfers VALUES (@ProductID,getdate(),'Transfer Out',@Amount)
UPDATE dbo.BookStock
	SET StockAmount = StockAmount - @Amount
	WHERE ProductID = @ProductID
*/

-- original code:
DECLARE @ProductID INT = 1
DECLARE @Amount INT = 1

INSERT INTO dbo.BookTransfers VALUES (@ProductID,getdate(),'Transfer Out',-@Amount)
UPDATE dbo.BookStock
	SET StockAmount = StockAmount - @Amount
	WHERE ProductID = @ProductID
GO

--- results should be the same
SELECT ProductID, SUM(TransferAmount) AS TotalTransfers
	FROM dbo.BookTransfers
	GROUP BY ProductID

SELECT *
	FROM dbo.BookStock
GO

-- TASK 2:

