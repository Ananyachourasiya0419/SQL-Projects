select * from locations
select * from departmentss
select * from job
select * from employyees


CREATE TABLE LOCATIONs (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATIONs (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

       select * from locations

  CREATE TABLE DEPARTMENTss (
  DepartmentsId INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATIONs(Location_ID)
);


INSERT INTO DEPARTMENTss (DepartmentsId, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

       select * from departmentss


      CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT');

select * from job

CREATE TABLE EMPLOYyees
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENTsID  INT FOREIGN KEY
REFERENCES DEPARTMENTss(DEPARTMENTsID));

INSERT INTO EMPLOYyEEs VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30), 
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30);

select * from employyees



Simple Queries:

--1. List all the employyees details. 

select * from employyees

--2. List all the department details. 

select * from departments

--3. List all job details. 

select * from job

--4. List all the locations. 

select * from locations

--5. List out the First Name, Last Name, Salary, Commission for all Employees. 

select first_name,last_name,salary,comm from employyees

--6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the 
--Employee", Department ID as "Dep_id". 

select employee_id as "ID_of_the_Employee" ,
last_name as "Name_of_the_Employee",
departmentsid as "Dep_id"
from employyees


--7. List out the annual salary of the employees with their names only.


select concat(first_name,' ',last_name) as employyees_name,
salary*12 as annual_salary
from employyees



WHERE Condition: 

--1. List the details about "Smith". 

select * from employyees
where last_name='smith'

--2. List out the employees who are working in department 20. 

select * from employyees
where departmentsid= 20


--3. List out the employees who are earning salary between 2000 and 3000. 

select * from employyees
where salary between 2000 and 3000

--4. List out the employees who are working in department 10 or 20.

select * from employyees 
where departmentsid in (10,20)

--5. Find out the employees who are not working in department 10 or 30. 

select * from employyees 
where departmentsid not in (10,30)

--6. List out the employees whose name starts with 'L'. 

select first_name from employyees
where first_name like 'L%'


--7. List out the employees whose name starts with 'L' and ends with 'E'. 

select first_name from employyees
where first_name like 'L%E'


--8. List out the employees whose name length is 4 and start with 'J'. 

select first_name,LAST_NAME  from employyees
where LEN(FIRST_NAME)=4 AND
first_name like 'J%'


--9. List out the employees who are working in department 30 and draw the salaries more than 2500. 

SELECT * FROM EMPLOYYEES
WHERE DEPARTMENTSID=30 AND
SALARY>2500


--10. List out the employees who are not receiving commission. 

select * from employyees
where comm is null



ORDER BY Clause: 

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 

select employee_id,last_name
from employyees
order by employee_id asc

--2. List out the Employee ID and Name in descending order based on salary. 

select employee_id,last_name,first_name,salary
from employyees
order by salary desc

--3. List out the employee details according to their Last Name in ascending-order. 

select * from employyees
order by last_name asc

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
 
select * from employyees
order by last_name asc, departmentsid desc



GROUP BY and HAVING Clause: 

--1. List out the department wise maximum salary, minimum salary and average salary of the employees. 

select departmentsid,min(salary) as min_sal,max(salary) as max_sal,avg(salary) as avg_sal
from employyees
group by departmentsid

--2. List out the job wise maximum salary, minimum salary and average salary of the employees.

select job_id,min(salary) as min_sal,max(salary) as max_sal,avg(salary) as avg_sal
from employyees
group by job_id

--3. List out the number of employees who joined each month in ascending order.

select datename(month,hire_date) as month,
count(*) as no_of_employyees
from employyees
group by datename(month,hire_date)
order by datename(month,hire_date) asc

--4. List out the number of employees for each month and year in 
--ascending order based on the year and month. 

select datename(month,hire_date) as month,
year(hire_date) as year,
count(*) as no_of_employyees
from employyees
group by datename(month,hire_date),year(hire_date)
order by datename(month,hire_date) ,year(hire_date) asc


--5. List out the Department ID having at least four employees. 

select departmentsid, count(*) as no_of_employees
from employyees
group by departmentsid
having count(*)>=4


--6. How many employees joined in February month. 

select count(*) as no_of_employees_joined_feb
from employyees
where month(hire_date)=2

--7. How many employees joined in May or June month.

select count(*) as no_of_employees
from employyees
where month(hire_date) in (5,6)

--8. How many employees joined in 1985? 

select count(*) as Employees_Joined_1985
from employyees
where year(hire_date)=1985

--9. How many employees joined each month in 1985? 

select datename(month,hire_date) as month,
count(*) as Employees_Joined_1985
from employyees
where year(hire_date)=1985
group by datename(month,hire_date)
order by datename(month,hire_date)

--10. How many employees were joined in April 1985? 

select count(*) as Employees_Joined_april_1985
from employyees
where year(hire_date)=1985 and
month(hire_date)=4

--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985? 

select departmentsid,count(*) as Employees_Joined_april_1985
from employyees
where year(hire_date)=1985 and
month(hire_date)=4 
group by departmentsid
having count(*)>=3


Joins:

--1. List out employees with their department names. 

select e.first_name,e.last_name,d.name
from employyees e
inner join departmentss d
on (e.departmentsid=d.departmentsid)

--2. Display employees with their designations. 

select e.first_name,e.last_name,j.designation,e.employee_id
from employyees e
inner join job j
on (e.job_id=j.job_id)

--3. Display the employees with their department names and city. 

select e.first_name,e.last_name,d.name,l.city
from employyees e
inner join departmentss d
on (e.departmentsid=d.departmentsid)
inner join locations l
on (d.location_id=l.location_id)

--4. How many employees are working in different departments? Display with department names. 

select d.name,count(employee_id) as no_of_employees
from employyees e
inner join departmentss d
on (e.departmentsid=d.departmentsid)
group by d.name

--5. How many employees are working in the sales department? 

select d.name,count(employee_id) as no_of_employees
from employyees e
join departmentss d
on (e.departmentsid=d.departmentsid)
where d.name='sales'
group by d.name

--6. Which is the department having greater than or equal to 3 
--employees and display the department names in ascending order

select d.name,count(employee_id) as no_of_employees
from employyees e
inner join departmentss d
on (e.departmentsid=d.departmentsid)
group by d.name
having count(employee_id)>=3
order by d.name asc
 
--7. How many employees are working in 'Dallas'? 

select l.city,count(employee_id) as no_of_employees
from employyees e
join departmentss d
on (e.departmentsid=d.departmentsid)
join locations l
on (d.location_id=l.location_id)
where l.city='dallas'
group by l.city

--8.Display all employees in sales or operation departments. 

select e.employee_id,e.first_name,e.last_name,d.name
from employyees e
join departmentss d
on (e.departmentsid=d.departmentsid)
where d.name in ('sales' , 'operations')


CONDITIONAL STATEMENT:

--1. Display the employee details with salary grades. Use conditional statement to create a grade column. 

select employee_id,first_name,last_name,salary,
case
 when salary>=2500 then 'A'
 WHEN salary between 1000 and 2400 then 'B'
 ELSE 'C'
end as salary_grade
from employyees
order by salary desc

--2. List out the number of employees grade wise. Use conditional statement to create a grade column.

SELECT 
CASE
WHEN Salary >= 2000 THEN 'Grade A'
WHEN Salary BETWEEN 1400 AND 1900 THEN 'Grade B'
WHEN Salary BETWEEN 1000 AND 1300 THEN 'Grade C'
 ELSE 'Grade D'
END AS Salary_Grade,
 COUNT(*) AS Number_of_Employees
FROM Employyees
GROUP BY 
 CASE
WHEN Salary >= 2000 THEN 'Grade A'
WHEN Salary BETWEEN 1400 AND 1900 THEN 'Grade B'
WHEN Salary BETWEEN 1000 AND 1300 THEN 'Grade C'
ELSE 'Grade D'
 END
ORDER BY Salary_Grade;

--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

SELECT 
CASE
WHEN Salary BETWEEN 500 AND 1000 THEN 'Grade C'
WHEN Salary BETWEEN 1100 AND 1800 THEN 'Grade B'
WHEN Salary BETWEEN 1900 AND 3000 THEN 'Grade A'
END AS Salary_Grade,
    COUNT(*) AS Number_of_Employees
FROM Employyees
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY 
 CASE
WHEN Salary BETWEEN 500 AND 1000 THEN 'Grade C'
WHEN Salary BETWEEN 1100 AND 1800 THEN 'Grade B'
 WHEN Salary BETWEEN 1900 AND 3000 THEN 'Grade A'
  END
ORDER BY Salary_Grade;


Subqueries: 

--1. Display the employees list who got the maximum salary. 

select employee_id,first_name,last_name,salary,job_id
from employyees
where salary=(select max(salary) as maximum_salary from employyees)

--2. Display the employees who are working in the sales department. 

select employee_id,first_name,last_name,salary,departmentsid
from employyees
where departmentsid=(
select departmentsid
from departmentss
where name='sales')


--3. Display the employees who are working as 'Clerk'.

select employee_id,job_id,first_name,last_name,salary,departmentsid
from employyees
where job_id = (select job_id
from job
where designation='clerk') 

--4. Display the list of employees who are living in 'Boston'. 

select employee_id,job_id,first_name,last_name,salary,departmentsid
from employyees
where departmentsid in (select departmentsid
from departmentss 
where location_id in (select location_id
from locations
where city='boston'))

--5. Find out the number of employees working in the sales department. 

select employee_id, count(employee_id) as no_of_employyees
from employyees
where departmentsid = (select departmentsid 
from departmentss 
where name='sales')
group by employee_id

--6. Update the salaries of employees who are working as clerks on the basis of 10%. 

update employyees
set salary= salary * 1.10
where job_id = (select job_id
from job
where designation='clerk'
);

--7. Display the second highest salary drawing employee details. 

with abc
as
(select * ,
DENSE_RANK() over (order by salary DESC) as DR
from employyees
)
SELECT * from abc 
where DR=2

--8.List out the employees who earn more than every employee in department 30. 

with abc
as
( select *,
DENSE_RANK() over (order by salary desc) as DR
from employyees
where departmentsid=30
)
select * from abc
where DR=1

--9.Find out which department has no employees.

SELECT DepartmentsID,Name
FROM DEPARTMENTss
WHERE DepartmentsId NOT IN (
SELECT DISTINCT DepartmentsId
FROM EMPLOYyees
WHERE DepartmentsId IS NOT NULL
)

--10.Find out the employees who earn greater than the average salary for 
their department. 

select employee_id ,FIRST_NAME,LAST_NAME,salary,DEPARTMENTsID
from EMPLOYyees e
where salary>(select avg(salary) as avg_salary
from EMPLOYyees
where departmentsid=e.departmentsid)









