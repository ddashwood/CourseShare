/***************************************************************************************
**																					  **
** 		CHAPTER 9. Practical 1.					  									  **
**		Standard Subqueries			 												  **
**																					  **
***************************************************************************************/

SELECT * FROM dept
SELECT * FROM salesperson
SELECT * FROM sale
SELECT * FROM contact
SELECT * FROM company

--p1) Show the full name of the salesperson(s) (could be more than one) 
--    who has/have the largest sales target. 
--    (Answer - Billy Custard)

SELECT 	fname, lname
FROM 	salesperson 
WHERE 	sales_target =
        (
		SELECT 	MAX(sales_target) 
		FROM 	salesperson
		)

fname           lname              
--------------- ---------------  
Billy           Custard         

-- Question, was it safe to say '=' instead of 'IN'? Why?




--p2) We would like to write a query that displays the number '3'.
--    Why? Because that is the answer to "How many people have sold?".

--    Before starting, run the two queries supplied below, and work out the result (3) manually. 
--    We think there are only 2 ways of doing it. See if you can work out the 2 ways.  

--    Then try to write SQL that mimics exactly what you just did manually.
--    It can be done using a simple subquery. 
--    You may think of a way of doing it without a subquery.
--    Don't try any sort of JOIN!

SELECT emp_no AS 'emp nos of the people' FROM salesperson
SELECT emp_no AS 'emp nos who have sold' FROM sale ORDER BY emp_no


-- The answer is 3 so surely either coded solution query must start with:
SELECT 	COUNT(*)   -- you complete the rest.
FROM    salesperson
WHERE 	emp_no IN
	(
	SELECT emp_no
	FROM   sale
	)

--OR
SELECT COUNT(DISTINCT emp_no)
FROM   sale 




/***************************************************************************************
**																					  **
** 		END OF CHAPTER 9. Practical 1.			        	                          **
**										                                              **
***************************************************************************************/










/***************************************************************************************
**																					  **
** 		CHAPTER 9. Practical 2.					  									  **
**		NOT EXISTS and in-line view	 												  **
**																					  **
***************************************************************************************/


--p1) Write a query using NOT EXISTS to find department(s) without salespeople.
--    (Note that this could also be done using a NOT IN test, or an OUTER JOIN...)


SELECT *
FROM dept
WHERE NOT EXISTS (
	SELECT 1
	FROM salesperson 
	WHERE salesperson.dept_no = dept.dept_no
)


dept_no     dept_name            manager              sales_target
----------- -------------------- -------------------- ---------------------------------------
4           Desktop Systems      Diver Dan            5.00



--p2) Use an in-line view to display salespeople 
--    with the maximum sales_target for each person's department included in the results.


SELECT main.dept_no, fname, lname, sales_target, max_target
FROM salesperson main
JOIN
(
	SELECT dept_no, Max(sales_target) AS max_target
	FROM salesperson
	GROUP BY dept_no
) AS inline
ON main.dept_no = inline.dept_no


dept_no     fname           lname           sales_target                            max_target
----------- --------------- --------------- --------------------------------------- ---------------------------------------
1           Alan            Brick           9.00                                    9.00
2           Billy           Custard         14.00                                   14.00
2           Chris           Digger          7.00                                    14.00
3           Dick            Ernst           11.00                                   13.00
3           Ernest          Flipper         12.00                                   13.00
3           Fred            Goalie          13.00                                   13.00





/***************************************************************************************
**																					  **
** 		END OF CHAPTER 9. Practical 2.			        	                          **
**										                                              **
***************************************************************************************/