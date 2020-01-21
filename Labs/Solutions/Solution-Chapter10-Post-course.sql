/***************************************************************************************
**																					  **
** 		CHAPTER 10. Post-course Practical		  	                                  **
**		Reading SQL				 			                                          **
**										                                              **
****************************************************************************************/
--  Read, execute if you wish, and type in in English what each piece
--  of SQL does.


--p1) Depts that have hit target 

SELECT 	D.dept_no, dept_name
FROM 	dept D JOIN salesperson SP
	ON D.dept_no = SP.dept_no
JOIN 	sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target <= SUM(order_value)



--p2) Depts that have not hit target, but have sold something.

SELECT 	D.dept_no, dept_name
FROM 	dept D JOIN salesperson SP
	ON D.dept_no = SP.dept_no
JOIN 	sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target > SUM(order_value)



--p3) Depts that have not hit target, but have either sold something 
--    or have sales people in who have not sold at all, but does not 
--    include any depts that have no sales people at all.

SELECT 	D.dept_no, dept_name
FROM 	dept D JOIN salesperson SP
	ON D.dept_no = SP.dept_no
LEFT JOIN sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target >= SUM(order_value)
OR 	SUM(order_value) IS NULL



--p4) All depts that have not hit target, regardless of whether they
--    have either sold anything or whether they have sales people in them.

SELECT 	D.dept_no, dept_name
FROM 	dept D LEFT JOIN salesperson SP
	ON D.dept_no = SP.dept_no
LEFT JOIN sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target >= SUM(order_value)
OR 	SUM(order_value) IS NULL




--p5) Sales people who have sold to all companies - Fred Goalie.
--    "List sales people if the count of different companies they have sold 
--    to is equal to the number of companies in the company table".

SELECT 	SP.emp_no, fname, lname
FROM 	sale S JOIN salesperson SP
	ON S.emp_no = SP.emp_no
Group by 
	SP.emp_no, fname, lname
HAVING 	COUNT(DISTINCT company_no) = 
	(
	SELECT COUNT(*)
	FROM company
	)


--p6) Sales people who have sold to all companies (again!) - Fred Goalie.
--    "List sales people if there isn't (NOT EXISTS) a company that isn't
--    represented (NOT EXISTS) in their sales. The 2nd subquery is trying 
--    to find 'is there an answer set when you look for sales of one person
--    to one company?'"	

SELECT 	emp_no, fname, lname
FROM 	salesperson SP
WHERE 	NOT EXISTS
	(
	SELECT 	*
	FROM 	company C
	WHERE 	NOT EXISTS
		(
		SELECT 	* 
		FROM 	sale S
		WHERE 	S.company_no 	= C.company_no     --correlated on company_no	
		AND 	S.emp_no 	= SP.emp_no  --correlated on emp_no
		) 
	)





--p7) Names of depts who have employees who have not hit target but
--    have sold something. 

SELECT 	DISTINCT D.dept_no ,dept_name 
FROM 	salesperson SP JOIN sale S
	ON SP.emp_no = S.emp_no
	JOIN dept D
	ON D.dept_no = SP.dept_no
GROUP BY D.dept_no, dept_name, SP.emp_no, SP.sales_target 
HAVING 	SUM(order_value) < SP.sales_target


--p8) Names of depts who have someone who has not hit target. 
--    Includes those who have not sold at all.

SELECT 	DISTINCT D.dept_no ,dept_name 
FROM 	salesperson SP LEFT JOIN sale S
	ON SP.emp_no = S.emp_no
	JOIN dept D
	ON D.dept_no = SP.dept_no
GROUP BY 
	D.dept_no, dept_name, SP.emp_no, SP.sales_target 
HAVING 	SUM(order_value) < SP.sales_target
OR 	SUM(order_value) IS NULL 



/****************************************************************************************
**										                                               **
** 		END OF Chapter 10. Post course practical	                                   **
**																					   **
****************************************************************************************/
