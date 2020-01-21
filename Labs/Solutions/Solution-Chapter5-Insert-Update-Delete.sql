/***************************************************************************************
**																					  **
** 		CHAPTER 5. Practical.				  	                                      **
**		INSERTing & DELETE'ing & UPDATE'ing Data                                      **
** 										                                              **
***************************************************************************************/


--p1)  You are going to INSERT 1 row into the contact table.
--     We are not going to bother to type in the full comma separated list of column names, 
--     simply the right number of column values(6) in the CORRECT sequence.
--     Check the sequence matches the schema.
--     The contact is in company 4000, with a contact code of 'MM'.
--     A name and job-title have been invented and the last 2 cols are set to NULL


INSERT INTO contact
VALUES (4000, 'MM', 'Marvellous Marvin', 'Magician', NULL, NULL)


--p2)  Lets check the new contact is in the table (run this code)

SELECT  *
FROM	contact

company_no  contact_code name                 job_title                      tel                       notes                                                        
----------- ------------ -------------------- ------------------------------ ------------------------- ------------------------------------------------------------ 
1000        MM           Munching Mike        Accounts Officer               (0207)223-9887            We first visited her in January 2006
2000        NN           Naughty Nick         Bought Ledger Manager          01546-456566 Ext 22       Works only on Monday and Wednesdays
2000        OO           Ollie Octopus        Chief Executive Officer        0207-341-566670 ext 10    
3000        PP           Purposeful Peter     Development Director           0131 324545 ext 213       Insists on personally signing all orders
3000        QQ           Quentin Quail        Electrical Manager             01456 802071 ext 44       Has been in his job a long time
3000        RR           Robber Red           Federal Reporting Officer      0356-345345               Has a preference for Apple Macs
4000        MM           Marvellous Marvin    Magician                       NULL                      NULL
4000        RR           Ricky Rambo          Gourmet Foods Purchaser        0207-988-0777             
4000        TT           Terrible Tim         Head of Inter Office Systems   05673-476878 ext 221      Is listed in Whos Who 2005 onwards
4000        UU           Uppy Umbrella        Accounts Officer               0823-598494 ext 1         Is upset because he is not chief executive!

--p3)  DELETE any department whose manager's name contains the character 'x'.
--     We can check who should be DELETEd before running the DELETE, by using the proposed
--     WHERE clause in a SELECT first.

SELECT 	manager
FROM 	dept
WHERE 	manager LIKE '%X%'

manager              
-------------------- 
Xavier Xylophone    

DELETE  FROM dept
WHERE 	manager LIKE '%X%'

(1 row(s) affected)

SELECT * 
FROM dept

dept_no     dept_name            manager              sales_target   
----------- -------------------- -------------------- -------------- 
1           Animal Products      Adam Apricot         5.00
2           Business Systems     Barbara Banana       15.00
3           Credit Control       Paul Peach           25.00
4           Desktop Systems      Diver Dan            5.00




--p4)  Departments have sales_targets, so do salespeople.
--     We want to change the sales_targets of each DEPT.

--     Each dept's target is to be be INCREASED by 5 'units'(you don't care what the 'unit' is).
--     The code has been inserted BETWEEN the 2 SELECT statements that follow 

--     Run the 3 statements TOGETHER, ONCE and ONCE ONLY. 
--     This will enable you (one time only) to see the 'before' and 'after' version of the 
--     row(s) you change.

SELECT * FROM dept

UPDATE 	dept 
SET 	sales_target = sales_target + 5  

SELECT * FROM dept

-- before image
dept_no     dept_name            manager              sales_target   
----------- -------------------- -------------------- -------------- 
1           Animal Products      Adam Apricot         5.00
2           Business Systems     Barbara Banana       15.00
3           Credit Control       Paul Peach           25.00
4           Desktop Systems      Diver Dan            5.00
(4 row(s) affected) 

-- the UPDATE
(4 row(s) affected) 

-- after image
dept_no     dept_name            manager              sales_target   
----------- -------------------- -------------------- -------------- 
1           Animal Products      Adam Apricot         10.00
2           Business Systems     Barbara Banana       20.00
3           Credit Control       Paul Peach           30.00
4           Desktop Systems      Diver Dan            10.00
(4 row(s) affected) 

--p5)  Now we are going to change the contact Ricky Rambo's job title to 'VP of Development'
--     and SIMULTANEOUSLY change his/her telephone number to '01242-112233 Ext 444'.
--     Do this in ONE statement. Again the code is INSERT'ed between the 2 precoded 'SELECTs' and 
--     so run all 3 statements again.

SELECT * FROM contact

UPDATE 	contact
SET 	job_title =  'VP of Development', tel = '01242-112233 Ext 444'
WHERE 	name = 'Ricky Rambo'

SELECT * FROM contact

-- before image
company_no  contact_code name                 job_title                      tel                       notes                                                        
----------- ------------ -------------------- ------------------------------ ------------------------- ------------------------------------------------------------ 
1000        MM           Munching Mike        Accounts Officer               (0207)223-9887            We first visited her in January 2006
2000        NN           Naughty Nick         Bought Ledger Manager          01546-456566 Ext 22       Works only on Monday and Wednesdays
2000        OO           Ollie Octopus        Chief Executive Officer        0207-341-566670 ext 10    
3000        PP           Purposeful Peter     Development Director           0131 324545 ext 213       Insists on personally signing all orders
3000        QQ           Quentin Quail        Electrical Manager             01456 802071 ext 44       Has been in his job a long time
3000        RR           Robber Red           Federal Reporting Officer      0356-345345               Has a preference for Apple Macs
4000        MM           Marvellous Marvin    Magician                       NULL                      NULL
4000        RR           Ricky Rambo          Gourmet Foods Purchaser        0207-988-0777             
4000        TT           Terrible Tim         Head of Inter Office Systems   05673-476878 ext 221      Is listed in Whos Who 2005 onwards
4000        UU           Uppy Umbrella        Accounts Officer               0823-598494 ext 1         Is upset because he is not chief executive!

(10 row(s) affected)

-- the UPDATE
(1 row(s) affected)

-- after image
company_no  contact_code name                 job_title                      tel                       notes                                                        
----------- ------------ -------------------- ------------------------------ ------------------------- ------------------------------------------------------------ 
1000        MM           Munching Mike        Accounts Officer               (0207)223-9887            We first visited her in January 2006
2000        NN           Naughty Nick         Bought Ledger Manager          01546-456566 Ext 22       Works only on Monday and Wednesdays
2000        OO           Ollie Octopus        Chief Executive Officer        0207-341-566670 ext 10    
3000        PP           Purposeful Peter     Development Director           0131 324545 ext 213       Insists on personally signing all orders
3000        QQ           Quentin Quail        Electrical Manager             01456 802071 ext 44       Has been in his job a long time
3000        RR           Robber Red           Federal Reporting Officer      0356-345345               Has a preference for Apple Macs
4000        MM           Marvellous Marvin    Magician                       NULL                      NULL
4000        RR           Ricky Rambo          VP of Development              01242-112233 Ext 444      
4000        TT           Terrible Tim         Head of Inter Office Systems   05673-476878 ext 221      Is listed in Whos Who 2005 onwards
4000        UU           Uppy Umbrella        Accounts Officer               0823-598494 ext 1         Is upset because he is not chief executive!

(10 row(s) affected)

--p3) IF YOU HAVE TIME

-- Run this
SELECT * FROM company

-- old image
company_no  name                 tel             county          post_code  
----------- -------------------- --------------- --------------- ---------- 
1000        Happy Heaters PLC    (01306)345672   London          SE3 89L   
2000        Icicle Igloos Inc    0207-987-1265   London          N1 4LH    
3000        Judo Jeans PLC       0207-478-2990   London          N9 2FG    
4000        Kipper Kickers Inc   01254-987766    Devon           PL4 9RT   

-- 'Icicle Igloos Inc' has just floated on the Stock Exchange.
-- Let us change it's company name to 'Icicle Igloos PLC'.

UPDATE company
SET name = 'Icicle Igloos PLC'
WHERE company_no = 2000   -- or 'WHERE name = 'Icicle Igloos Inc'

(1 row(s) affected)

-- Re-Run this
SELECT * FROM company


-- new image
company_no  name                 tel             county          post_code  
----------- -------------------- --------------- --------------- ---------- 
1000        Happy Heaters PLC    (01306)345672   London          SE3 89L   
2000        Icicle Igloos PLC    0207-987-1265   London          N1 4LH    
3000        Judo Jeans PLC       0207-478-2990   London          N9 2FG    
4000        Kipper Kickers Inc   01254-987766    Devon           PL4 9RT   



/***************************************************************************************
**										                                              **
** 		END OF CHAPTER 5. Practical.				     			         	      **
**										                                              **
***************************************************************************************/