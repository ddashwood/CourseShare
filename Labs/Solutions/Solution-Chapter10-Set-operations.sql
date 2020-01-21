/***************************************************************************************
**																					  **
** 		CHAPTER 10. Practical 1.				  	                                  **
**		Unions.	                                    		                          **
**										                                              **
***************************************************************************************/

SELECT * FROM dept
SELECT * FROM salesperson
SELECT * FROM sale
SELECT * FROM contact
SELECT * FROM company


--p1) We want to produce one list comprising three things all in one list
--	a) Manager names
--  b) Sales people's firstname and surname concatenated 
--  c) All Contacts names.
--    A second column called 'Type' should contain an 'm' or 'p' or 'c' as appropriate
--    to indicate manager/person/contact respectively
--    Sort the result set based on the second (type) column

SELECT 	manager 'Name', 'm' AS Type
FROM 	dept
UNION
SELECT 	fname + ' ' + lname, 'p'
FROM 	salesperson 
UNION
SELECT	name, 'c'
FROM	contact
ORDER BY Type


Name                            Type
------------------------------- ----
Munching Mike                   c
Naughty Nick                    c
Ollie Octopus                   c
Purposeful Peter                c
Quentin Quail                   c
Ricky Rambo                     c
Robber Red                      c
Terrible Tim                    c
Uppy Umbrella                   c
Adam Apricot                    m
Barbara Banana                  m
Diver Dan                       m
Paul Peach                      m
Alan Brick                      p
Billy Custard                   p
Chris Digger                    p
Dick Ernst                      p
Ernest Flipper                  p
Fred Goalie                     p







-- Perhaps we have done enough SQL for one course now

/***************************************************************************************
**																					  **
** 		END OF CHAPTER 10. Demo											       	      **
**																					  **
***************************************************************************************/