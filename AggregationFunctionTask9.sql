--Company Database
use Company_SD;
--1.  Count total number of employees in the Employees table. 
SELECT COUNT(*) AS total_employees FROM Employee;

--2.  Calculate average salary from the Salaries table. 
SELECT AVG(Salary) AS average_salary FROM Employee;

--3.  Count employees in each department using Employees grouped by Dept_ID. 
SELECT Dno, COUNT(*) AS employee_count
FROM Employee
GROUP BY Dno;

--4.  Find total salary per department by joining Employees and Salaries. 
SELECT Dno, SUM(Salary) AS Employee
FROM Employee
GROUP BY Dno;

--5. Show departments (Dept_ID) having more than 5 employees with their counts. 
SELECT Dno, COUNT(*) AS employee_count
FROM Employee
GROUP BY Dno
HAVING COUNT(*) > 5;



