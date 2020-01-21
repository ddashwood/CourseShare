/****************************************************************************************
**																					   **
** 		CHAPTER 10. Post Course Practical.				  									   **
**		Reading SQL				 												       **
**																					   **
****************************************************************************************/
--  Read, execute if you wish, and type in in English what each piece
--  of SQL does.


--p1) 

SELECT 	D.dept_no, dept_name
FROM 	dept D JOIN salesperson SP
	ON D.dept_no = SP.dept_no
JOIN 	sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target <= SUM(order_value)



--p2) 

SELECT 	D.dept_no, dept_name
FROM 	dept D JOIN salesperson SP
	ON D.dept_no = SP.dept_no
JOIN 	sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target > SUM(order_value)



--p3) 

SELECT 	D.dept_no, dept_name
FROM 	dept D JOIN salesperson SP
	ON D.dept_no = SP.dept_no
LEFT JOIN sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target >= SUM(order_value)
OR 	SUM(order_value) IS NULL



--p4) 

SELECT 	D.dept_no, dept_name
FROM 	dept D LEFT JOIN salesperson SP
	ON D.dept_no = SP.dept_no
LEFT JOIN sale S
	ON SP.emp_no = S.emp_no
GROUP BY 
	D.dept_no, dept_name, D.sales_target 
HAVING	D.sales_target >= SUM(order_value)
OR 	SUM(order_value) IS NULL




--p5) 

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


--p6) 

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





--p7) 

SELECT 	DISTINCT D.dept_no ,dept_name 
FROM 	salesperson SP JOIN sale S
	ON SP.emp_no = S.emp_no
	JOIN dept D
	ON D.dept_no = SP.dept_no
GROUP BY D.dept_no, dept_name, SP.emp_no, SP.sales_target 
HAVING 	SUM(order_value) < SP.sales_target


--p8) 

SELECT 	DISTINCT D.dept_no ,dept_name 
FROM 	salesperson SP LEFT JOIN sale S
	ON SP.emp_no = S.emp_no
	JOIN dept D
	ON D.dept_no = SP.dept_no
GROUP BY 
	D.dept_no, dept_name, SP.emp_no, SP.sales_target 
HAVING 	SUM(order_value) < SP.sales_target
OR 	SUM(order_value) IS NULL 



/***************************************************************************************
**																					  **
** 		END OF Chapter 10. Post course practical 	                                  **
**										                                              **
***************************************************************************************/


