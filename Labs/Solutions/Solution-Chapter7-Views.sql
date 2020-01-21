/***************************************************************************************
**																					  **
** 		CHAPTER 7. Practical 1.					  	                                  **
**		VIEWs.					 			                                          **
**										                                              **
***************************************************************************************/
sp_help company

--p1)  CREATE a VIEW named London.
--     It is going to show rows and columns from the 'company' table.
--     It should show company number, name and county columns.
--     It should only include rows in the London area (County = 'London'). 
--     When used for data entry it should NOT ALLOW non-London companies to be added.
--     Be a developer and CREATE the view.

CREATE VIEW London 
AS 
SELECT 	company_no, name, county 
FROM 	company
WHERE 	county = 'London'
WITH CHECK OPTION

--p2)  Now be the 'user' and SELECT everything (all rows and all columns) 
--     FROM the newly created VIEW.  
--     (3 rows, with 3 columns each)

SELECT 	*
FROM	London

company_no  name                 county          
----------- -------------------- --------------- 
1000        Happy Heaters PLC    London
2000        Icicle Igloos PLC    London
3000        Judo Jeans PLC       London

-- p3)  Copy/paste the code from 1) and
--	    Alter the VIEW to add the 'post_code' column to the VIEW so that it appears 
--      before 'county'.

ALTER VIEW London 
AS 
SELECT 	company_no, name, post_Code, county 
FROM 	company
WHERE 	county = 'London'
WITH CHECK OPTION

--p4)  Now SELECT from the VIEW again as you did in 2) above, but this time
--     only include 'name' and 'post_code' columns.
--     Include a 'WHERE' clause that only SELECTs rows from the VIEW if 
--     the post_code starts with an 'N'.
--     Order the rows by 'post_code'.

SELECT 	name, post_code
FROM	London
WHERE   post_code LIKE 'N%'
ORDER BY post_code

name                 post_code  
-------------------- ---------- 
Icicle Igloos PLC    N1 4LH    
Judo Jeans PLC       N9 2FG    

--p5)  Try to run this INSERT statement of a company based in 'Essex'. It shouldn’t be  allowed! 
--     If it is successful, you have forgotten 3 key words from your CREATE/ALTER syntax.

INSERT INTO london
VALUES	(5000, 'ABC CO','RF45 7GH', 'ESSEX')

"The attempted INSERT or UPDATE failed because the target VIEW either specifies 
WITH CHECK OPTION or spans a VIEW that specifies WITH CHECK OPTION and one or more 
rows resulting from the operation did not qualify under the CHECK OPTION constraint.
The statement has been terminated. (SQL Server Message)"

-- The INSERT fails because the data violates the With Check Option condition.

-- If your INSERT did run successfully use this DELETE statement to remove the row.

DELETE FROM company WHERE company_no = 5000

/***************************************************************************************
**																					  **
** 		END OF CHAPTER 7. VIEWs					                                      **
**										                                              **
***************************************************************************************/