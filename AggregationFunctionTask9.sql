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

 ---------------------
 --University Database  
 use university; 
--6.  Count total number of students in the Student table.
SELECT COUNT(*) AS total_students FROM Student;

--7. Count number of students per city (group by City in Student).
--SELECT City, COUNT(*) AS student_count
--FROM Student
--GROUP BY City;

--8. Count students per course using Enrols (group by CourseID). 
SELECT Course_ID, COUNT(*) AS student_count
FROM Course
GROUP BY Course_ID;

--9. Count number of courses per department using Course (group by DepartmentID).
SELECT Department_ID, COUNT(*) AS course_count
FROM Course
GROUP BY Department_ID;

--10.  Count number of students assigned to each hostel (group by HostelID).
SELECT Hostel_ID, COUNT(*) AS student_count
FROM Student
GROUP BY Hostel_ID;


