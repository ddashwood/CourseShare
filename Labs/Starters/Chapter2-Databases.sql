/***************************************************************************************
**										      										  **
** 		CHAPTER 2. Introduction to Relational Databases.        	                  **
**										      			                              **
** Familiarisation with the SQL Server interactive interface                          **
** and getting to know the data that you will work with on this course.		          **
**										      			                              **
***************************************************************************************/


 
--   Part 1. Highlight and execute the following 'batch' of PRINT/SELECT statements. 

--  **NOTE** PRINT is not an SQL statement but is a SQL SERVER Transact-SQL language verb, used here to
--           produce headings for the results.


PRINT 'Here are the "departments"'
SELECT * FROM dept
PRINT 'Here are the "salespeople" (they work in "departments")'
SELECT * FROM salesperson
PRINT 'Here are the "sales" made by the "salespeople" (to customer "contacts")'
SELECT * FROM sale
PRINT 'Here are the "contacts" (who work for "companies"), that the "sales" were made to'
SELECT * FROM contact
PRINT 'Here are those "companies" (that the "contacts" work for)'
SELECT * FROM company                  


-- Part 2. 
--   By scrolling  through the "Results" pane and looking at the data in
--   the 5 different tables type the answers to the following 10 questions.

--   You SHOULD NOT be WRITING ANY SQL YET!!

--1) Write down how many 'departments' will exist AFTER you remove departments managed by anyone 
--   with an 'X' in their name.


--2) How many departments have salespeople in them?


--3) Who (salesperson) has the biggest sales target?


--4) How many salespeople have sold?


--5) To which contact (their name) was the sale on Nov 15th made?


--6) What was the post code of the company that the sale on Jan 23rd was made to?


--7) How many contacts have been sold to/not sold to?


--8) Choose the biggest sale and find the name of the manager of the dept that the sale 
--   'belongs to'.



/***************************************************************************************
**										                                              **
** 		END OF CHAPTER 2. Introduction to Relational Databases.        	              **
**										                                              **
****************************************************************************************/