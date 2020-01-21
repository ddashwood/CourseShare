create table dept
     ( dept_no integer not null primary key,
       dept_name char(20) not null,
       manager char(20) null,
       sales_target decimal(12,2) null	       -- changed from (12,4)
     )
go
create table salesperson
     ( emp_no integer not null primary key,
       fname varchar(15) null,
       lname varchar(15) not null,
       dept_no integer null references dept,   -- changed from not null
       sales_target decimal(12,2) null,        -- changed from (12,4)
       county varchar(15) null,
       post_code char(10) null,
       tel varchar(15) null,
       notes varchar(50) null
     )
go  
create table company
     ( company_no integer not null primary key,
       name varchar(20) not  null,
       tel char(15)     null,
       county varchar(15) null,
       post_code char(10) null
     )
go 
create table contact
     ( company_no integer not null references company,
       contact_code char(3) not null,
       name varchar(20) null,
       job_title varchar(30) null,
       tel char(25) null,
       notes varchar(60) null,
       primary key (company_no, contact_code)
     )
go 
create table sale
     ( order_no integer not null primary key,
       emp_no integer not null references salesperson,   -- their order_no column removed
       company_no integer not null,
       contact_code char(3) not null,
       order_value integer null,
       order_date datetime null,                         -- changed from datetime
       description varchar(50) not null,                 -- changed from (140)
       foreign key(company_no, contact_code)
           references contact
     )
 
