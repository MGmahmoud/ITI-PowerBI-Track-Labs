----------------------------------------------- Queries On Company_SD Database ---------------------------------------------------
USE Company_SD;
GO
------------------------------------------------- Start Lab_3 Part (1) -------------------------------------------------------------------------

----------------------------------------------- Task (1) ----------------------------------------

-- 🔍 Retrieve the Department ID, Name, and Manager's ID & Name. 
SELECT 
    d.Dnum As [Department Number], 
    d.Dname As [Department Name],
    d.MGRSSN AS [Manager SSN],
    e.Fname + ' ' + e.Lname AS [Manager Name]
FROM Departments d
JOIN Employee e 
    ON e.SSN = d.MGRSSN;

GO

----------------------------------------------- End (1) -----------------------------------------


----------------------------------------------- Task (2) ----------------------------------------

-- 🔍 Retrieve the names of departments and the projects under their control. 
SELECT 
    d.Dname AS DepartmentName, 
    p.Pname AS ProjectName
FROM Departments d
INNER JOIN Project p 
    ON d.Dnum = p.Dnum;

GO

----------------------------------------------- End (2) -----------------------------------------


----------------------------------------------- Task (3) ----------------------------------------

-- 🔍 Retrieve full details of all dependents along with the name of the employee they depend on.  
SELECT 
    e.Fname + ' ' + e.Lname AS EmployeeName, 
    d.Dependent_name AS DependentName,
    CAST(d.Bdate AS DATE) AS DependentBirthDate, 
    d.Sex AS DependentGender
FROM Employee e
INNER JOIN Dependent d 
    ON e.SSN = d.ESSN;

GO

----------------------------------------------- End (3) -----------------------------------------


----------------------------------------------- Task (4) ----------------------------------------

-- 🔍 Retrieve the ID, name, and location of projects in Cairo or Alexandria  
SELECT 
    Pnumber AS ProjectID, 
    Pname AS ProjectName, 
    Plocation AS ProjectLocation
FROM Project
WHERE City IN ('Cairo', 'Alex');

GO

----------------------------------------------- End (4) -----------------------------------------


----------------------------------------------- Task (5) ----------------------------------------

-- 🔍 Retrieve full details of projects where the name starts with the letter "A"  
SELECT *  
FROM Project  
WHERE Pname LIKE 'A%';

GO

----------------------------------------------- End (5) -----------------------------------------


----------------------------------------------- Task (6) ----------------------------------------

-- 🔍 Retrieve all employees in department 30 with a salary between 1000 and 2000 LE monthly
SELECT 
    Fname + ' ' + Lname AS EmployeeName,
    Salary,
	Dno AS DepartmentNumber
FROM Employee
WHERE Salary BETWEEN 1000 AND 2000
  AND Dno = 30;

GO

----------------------------------------------- End (6) -----------------------------------------


----------------------------------------------- Task (7) ----------------------------------------

-- 🔍 Retrieve the names of all employees in department 10 who work more than or equal to 10 hours per week on the "AL Rabwah" project.
SELECT 
    e.Fname + ' ' + e.Lname AS EmployeeName,
    e.Dno AS DepartmentNumber,
    wf.Hours AS WeeklyHours,
    p.Pname AS ProjectName
FROM Employee e
INNER JOIN Works_for wf
    ON wf.ESSN = e.SSN
INNER JOIN Project p
    ON p.Pnumber = wf.Pno
WHERE e.Dno = 10
  AND wf.Hours >= 10
  AND p.Pname = 'AL Rabwah';

GO

----------------------------------------------- End (7) -----------------------------------------


----------------------------------------------- Task (8) ----------------------------------------

-- 🔍 Retrieve the names of employees who are directly supervised by Kamel Mohamed.
-- TRIM() is used to remove any leading or trailing spaces in the names to ensure accurate concatenation and comparison.
SELECT 
    TRIM(e.Fname) + ' ' + TRIM(e.Lname) AS EmployeeName,
    TRIM(es.Fname) + ' ' + TRIM(es.Lname) AS SupervisorName
FROM Employee e
INNER JOIN Employee es
    ON es.SSN = e.Superssn
WHERE TRIM(es.Fname) + ' ' + TRIM(es.Lname) = 'Kamel Mohamed';

GO

----------------------------------------------- End (8) -----------------------------------------



----------------------------------------------- Task (9) ----------------------------------------

-- 🔍 Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
SELECT 
    e.Fname + ' ' + e.Lname AS EmployeeName,
    p.Pname AS ProjectName
FROM Employee e
LEFT JOIN Works_for wf 
    ON wf.ESSn = e.SSN
LEFT JOIN Project p 
    ON wf.Pno = p.Pnumber
ORDER BY p.Pname;

GO

----------------------------------------------- End (9) -----------------------------------------


----------------------------------------------- Task (10) ----------------------------------------

-- 🔍 Retrieve the project number, the controlling department name, the department manager's last name, address, and birthdate, for each project located in Cairo City.
SELECT 
    p.Pnumber AS ProjectNumber,
    d.Dname AS DepartmentName,
    e.Lname AS ManagerLastName,
    e.Address AS ManagerAddress,
    CAST(e.Bdate AS date) AS ManagerBirthdate
FROM Employee e
INNER JOIN Departments d 
    ON e.SSN = d.MGRSSN
INNER JOIN Project p 
    ON p.Dnum = d.Dnum
WHERE p.City = 'Cairo';

GO

----------------------------------------------- End (10) -----------------------------------------


----------------------------------------------- Task (11) ----------------------------------------

-- 🔍 Retrieve all data of the managers
SELECT 
    e.Fname + ' ' + e.Lname AS ManagerName,
    e.Address AS ManagerAddress,
    CONVERT(date, e.Bdate ) AS ManagerBdate,
    e.Salary AS ManagerSalary,
    e.SSN AS ManagerSSN,
    e.Sex AS ManagerSex,
	d.Dname As ManagerDepartment
FROM Departments d
INNER JOIN Employee e 
    ON e.SSN = d.MGRSSN;

GO

----------------------------------------------- End (11) -----------------------------------------


----------------------------------------------- Task (12) ----------------------------------------

-- 🔍 Retrieve all employees' data and the data of their dependents, even if they have no dependents.
SELECT 
    e.Fname + ' ' + e.Lname AS EmployeeName,
    e.Address AS EmployeeAddress,
    CONVERT(date, e.Bdate) AS EmployeeBirthdate,
    e.Salary AS EmployeeSalary,
    e.SSN AS EmployeeSSN,
    e.Sex AS EmployeeSex,
    d.Dependent_name AS DependentName
FROM Employee e
LEFT JOIN Dependent d 
    ON d.ESSN = e.SSN;

GO

----------------------------------------------- End (12) -----------------------------------------


----------------------------------------------- Task (13) ----------------------------------------

-- 🔍 Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary = 3000.
INSERT INTO Employee (Fname, Lname, SSN, Address, Bdate, Sex, Salary, Superssn, Dno) 
VALUES ('Mahmoud', 'Elhelaly', 102672, 'Nasr City, Cairo', '1998-09-23', 'M', 3000, 112233, 30);

-- Retrieve the newly inserted employee's data to confirm the insertion.
SELECT * 
FROM Employee 
WHERE SSN = 102672;

GO

----------------------------------------------- End (13) -----------------------------------------


----------------------------------------------- Task (14) ----------------------------------------

-- 🔍 Insert another employee with personal data of your friend as a new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number.
INSERT INTO Employee (Fname, Lname, SSN, Address, Bdate, Sex, Dno) 
VALUES ('New', 'Friend', 102660, 'Nasr City, Cairo', '2000-10-23', 'M', 30);

-- Retrieve the newly inserted employee's data to confirm the insertion.
SELECT * 
FROM Employee 
WHERE SSN = 102660;

GO

----------------------------------------------- End (14) -----------------------------------------


----------------------------------------------- Task (15) ----------------------------------------

-- 🔍 Upgrade your salary by 20% of its last value.
UPDATE Employee 
SET Salary = Salary * 1.2 
WHERE SSN = 102672;

-- Retrieve the updated employee's data to confirm the salary upgrade.
SELECT * 
FROM Employee 
WHERE SSN = 102672;

GO

----------------------------------------------- End (15) -----------------------------------------


------------------------------------------------- END Lab_3 Part (1) -------------------------------------------------------------------------
