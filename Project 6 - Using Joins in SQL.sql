/*

Using Joins : Inner Join/Join , Left Join/Left Outer Join, Right Join/Right Outer Join, Cross Join,
              Self Join
*/

--Inner Join/Join

Drop Table if exists employee_e
Create Table employee_e
            (emp_id varchar(20), emp_name varchar(50), salary int, dept_id varchar(50), manager_id varchar(50));

Insert Into employee_e
Values      ('E1', 'Rahul', 15000, 'D1', 'M1'),
            ('E2', 'Manoj', 15000, 'D1', 'M1'),
			('E3', 'James', 55000, 'D2', 'M2'),
			('E4', 'Michael', 25000, 'D2', 'M2'),
			('E5', 'Ali', 20000, 'D10', 'M3'),
			('E6', 'Robin', 35000, 'D10', 'M3');

Create Table department
            (dept_id varchar(20), dept_name varchar(50));

Insert Into department
Values      ('D1', 'IT'),
			('D2', 'HR'),
			('D3', 'Finance'),
			('D4', 'Admin');

Create Table manager
            (manager_id varchar(20), manager_name varchar(50), dept_id varchar(20));

Insert Into manager
Values     ('M1', 'Prem', 'D3'),
           ('M2', 'Shripadh', 'D4'),
		   ('M3', 'Nick', 'D1'),
		   ('M4', 'Cory', 'D1');

Create Table projects
            (project_id varchar(20), project_name varchar(100), team_member_id varchar(20));

Insert Into projects
Values      ('P1', 'Data Migration', 'E1'),
			('P1', 'Data Migration', 'E2'),
			('P1', 'Data Migration', 'M3'),
			('P2', 'ETL Tool', 'E1'),
			('P2', 'ETL Tool', 'M4');

Select * From employee_e
Select * From department
Select * From manager
Select * From projects

----------------------------------------------------------------------------------------------------------
--Fetch the employee name and the department name they belong to.
--Inner Join/Join fetches matching records only

Select e.emp_name, d.dept_name
From employee_e e
Join department d on e.dept_id = d.dept_id;

Select * From employee_e
Select * From department
----------------------------------------------------------------------------------------------------------
--Left Join = Inner Join + any additional records in the left table.

Select e.emp_name, d.dept_name
From employee_e e
Left Join department d on e.dept_id = d.dept_id;

Select * From employee_e
Select * From department
-----------------------------------------------------------------------------------------------------------
--Right Join = Inner Join + any additional records in the right table.

Select e.emp_name, d.dept_name
From employee_e e
Right Join department d on e.dept_id = d.dept_id;

Select * From employee_e
Select * From department
------------------------------------------------------------------------------------------------------------
--Fetch details of all employees, their manager, their department and the projects they work on.

Select * From employee_e
Select * From department
Select * From manager
Select * From projects

Select e.emp_name, d.dept_name, m.manager_name
From employee_e e
Left Join department d on e.dept_id = d.dept_id
Inner Join manager m on m.manager_id = e.manager_id
----------------------------------------------------------------

Select e.emp_name, d.dept_name, m.manager_name, p.project_name
From employee_e e
Left Join department d on e.dept_id = d.dept_id
Inner Join manager m on m.manager_id = e.manager_id
Join projects p on p.team_member_id = e.emp_id;
----------------------------------------------------------------

Select e.emp_name, d.dept_name, m.manager_name --p.project_name
From employee_e e
Left Join department d on e.dept_id = d.dept_id
Inner Join manager m on m.manager_id = e.manager_id
Left Join projects p on p.team_member_id = e.emp_id;
----------------------------------------------------------------

Select e.emp_name, d.dept_name, m.manager_name, p.project_name
From employee_e e
Left Join department d on e.dept_id = d.dept_id
Inner Join manager m on m.manager_id = e.manager_id
Left Join projects p on p.team_member_id = e.emp_id;

-----------------------------------------------------------------
--Full Join = Inner Join
--Full Join + all remaining records from Left Table
--Full Join + all remaining records from Right Table
--Full Join fetch out all the matching records using inner join first the the records left using left join 
--then using right join for right table

Select e.emp_name, d.dept_name
From employee_e e
Full Join department d on d.dept_id = e.dept_id;

--The first four records are results of the inner join
--The fifth and sixth records are results of the right join
--The seventh and eighth records are results of the left join

----------------------------------------------------------------------------------------------------------
--Things to remember:

--Whether you use full outer join or you use full join they both basically mean the same so the outer
--keyword is just an optional keyword

--left join ==> left outer join
--right join ==> right outer join
--inner join ==> join

----------------------------------------------------------------------------------------------------------
--Cross Join - It also reffered to as cartesian join
--Cross Join returns cartesian product meaning that every record from the left hand table will match with every 
--record from the left side table

--Cross join doesn't need a join condition...you just mentioned the two tables

Select e.emp_name, d.dept_name
From employee_e e
Cross Join department d;

------------------------------------------------------------------------------------------------------------
--Write a query to fetch the employee name and their corresponding department name.
--Also make sure to display the company name and the company location corresponding to each employee

Drop table if exists company
Create Table company
            (company_id varchar(10), company_name varchar(50), location varchar(20)); 

Insert Into company
Values      ('C001', 'techTFQ Solutions', 'Kuala Lumpur');

Select e.emp_name, d.dept_name, c.company_name, c.location
From employee_e e
Inner Join department d ON e.dept_id = d.dept_id
Cross Join company c ; 

-------------------------------------------------------------------------------------------------------------
--Self Join
Create Table family
            (member_id varchar(10), name varchar(50), age int, parent_id varchar(10));

Insert Into family
Values      ('F1', 'David', 4, 'F5'),
            ('F2', 'Carol', 10, 'F5'),
			('F3', 'Michael', 12, 'F5'),
			('F4', 'Johnson', 36, ''),
			('F5', 'Maryam', 40, 'F6'),
			('F6', 'Stewart', 70, ''),
			('F7', 'Rohan', 6, 'F4'),
			('F8', 'Asha', 8, 'F4');

Select *
From family

--Write a query to fetch the child name and their age corresponding to their parent name and parent age

Select child.name AS child_name
       , child.age AS child_age
	   , parent.name AS parent_name
	   , parent.age AS parent_age

From family as child
Join family as parent on child.parent_id = parent.member_id ;

Select *
From family

Select child.name AS child_name
       , child.age AS child_age
	   , parent.name AS parent_name
	   , parent.age AS parent_age

From family as child
Left Join family as parent on child.parent_id = parent.member_id ;

--------------------------------------------------------------------------------------------------------