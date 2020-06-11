/*
Batches

1.	Review the code below:
2.	Diagnose why the errors are being shown.
3.	Open the file “d:\qatsqlplus\M05E01 Batch Review.sql” and correct the errors.
4.	Run the query to confirm no errors are returned and the query executes successfully.
5.	The query window can be closed, and optionally saved.
*/
USE QATSQLPLUS
GO

--TASK 1:
/*
1. GO (line 4) ends the batch so variables @StartDate and @Vendor are dropped
2. Variable @EndDT is not declared
3. GO should be placed before the CREATE VIEW statement
*/
	DECLARE @StartDT datetime = GETDATE()
	DECLARE @EndDT datetime
	DECLARE @Vendor VARCHAR(50)
	PRINT @StartDT
	GO

	DECLARE @X INT = 0
	WHILE @X < 100
		BEGIN
			PRINT @X
			SET @X = @X + 1
		END
	SET @EndDT = GETDATE()
	SELECT @StartDT, @EndDT

	IF EXISTS (SELECT * FROM sysobjects WHERE Name = 'NewView')
		DROP VIEW dbo.NewView

	CREATE VIEW dbo.NewView AS
		SELECT * FROM dbo.Delegate
	GO

