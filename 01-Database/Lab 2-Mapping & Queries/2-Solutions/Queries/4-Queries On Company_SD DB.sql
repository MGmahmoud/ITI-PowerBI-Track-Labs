----------------------------------------------- Queries On Company_SD ---------------------------------------------------
USE Company_SD;
GO
------------------------------------------------- Start Question (2) -------------------------------------------------------------------------

----------------------------------------------- Task (1) ----------------------------------------

-- 🔍 Retrieve all employee data in a structured format
SELECT 
    FNAME AS First_Name,          -- Employee's first name
    LNAME AS Last_Name,           -- Employee's last name
    SSN AS Social_Security_Number,-- Unique identifier for each employee
    BDATE AS Birth_Date,          -- Employee's date of birth
    ADDRESS,                      -- Employee's residential address
    SEX,                          -- Gender of the employee
    SALARY,                       -- Employee's salary
    SUPERSSN AS Supervisor_SSN,   -- SSN of the employee's supervisor (FK to another EMPLOYEE)
    DNO AS Department_Number      -- Department to which the employee belongs (FK to DEPARTMENT)
FROM 
    EMPLOYEE;

Go

-- 🔍 Retrieve all employee data (Alternative using SELECT *) NOT RECOMMENDED
SELECT * 
FROM EMPLOYEE;

GO
----------------------------------------------- End (1) -----------------------------------------



----------------------------------------------- Task (2) ----------------------------------------

-- 🔍 Retrieve employee's First Name, Last Name, Salary, and Department Number
SELECT 
    FNAME AS First_Name,   -- Employee's first name
    LNAME AS Last_Name,    -- Employee's last name
    SALARY,                -- Employee's salary
    DNO AS Department_Number -- Department to which the employee belongs (FK to DEPARTMENT)
FROM 
    EMPLOYEE;

GO
----------------------------------------------- End (2) -----------------------------------------



----------------------------------------------- Task (3) ----------------------------------------

-- 🔍 Retrieve Project Name, Location, and Responsible Department Number
SELECT 
    PNAME AS Project_Name,     -- Name of the project
    PLOCATION AS Project_Location, -- Location of the project
    DNUM AS Department_Number  -- Department responsible for the project (FK to DEPARTMENT)
FROM 
    PROJECT;

GO
----------------------------------------------- End (3) -----------------------------------------



----------------------------------------------- Task (4) ----------------------------------------

-- 🔍 Retrieve Employee's Full Name and Annual Commission
SELECT 
    FNAME + ' ' + LNAME AS Full_Name, -- Concatenate first and last name as Full Name
    (SALARY * 12 * 0.10) AS ANNUAL_COMM -- Calculate annual commission (10% of annual salary)
FROM 
    EMPLOYEE;

GO
----------------------------------------------- End (4) -----------------------------------------



----------------------------------------------- Task (5) ----------------------------------------

-- 🔍 Retrieve Employee ID and Full Name for those earning more than 1000 LE per month
SELECT 
    SSN AS Employee_ID,         -- Employee's unique identification number
    FNAME + ' ' + LNAME AS Full_Name, -- Concatenated First and Last Name
    SALARY                      -- Employee's monthly salary
FROM 
    EMPLOYEE
WHERE 
    SALARY > 1000;              -- Filter employees earning more than 1000 LE per month

GO
----------------------------------------------- End (5) -----------------------------------------



----------------------------------------------- Task (6) ----------------------------------------

-- 🔍 Retrieve Employee ID and Full Name for those earning more than 10,000 LE annually
SELECT 
    SSN AS Employee_ID,         -- Employee's unique identification number
    FNAME + ' ' + LNAME AS Full_Name, -- Concatenated First and Last Name
    (SALARY * 12) AS Annual_Salary -- Convert monthly salary to annual salary
FROM 
    EMPLOYEE
WHERE 
    (SALARY * 12) > 10000; -- Filter employees earning more than 10,000 LE annually

GO
----------------------------------------------- End (6) -----------------------------------------



----------------------------------------------- Task (7) ----------------------------------------

-- 🔍 Retrieve Full Name and Salary of Female Employees
SELECT 
    FNAME + ' ' + LNAME AS Full_Name, -- Concatenated First and Last Name
    SALARY                            -- Employee's monthly salary
FROM 
    EMPLOYEE
WHERE 
    SEX = 'F';  -- Filter only female employees

GO
----------------------------------------------- End (7) -----------------------------------------


----------------------------------------------- Task (8) ----------------------------------------

-- 🔍 Retrieve Department ID and Name where the Manager's ID is 968574
SELECT 
    DNUM AS Department_ID,  -- Department Unique Identifier
    DNAME AS Department_Name   -- Department Name
FROM 
    DEPARTMENTS
WHERE 
    MGRSSN = 968574;  -- Filter departments managed by manager with SSN = 968574

GO
----------------------------------------------- End (8) -----------------------------------------



----------------------------------------------- Task (9) ----------------------------------------

-- 🔍 Retrieve Project ID, Name, and Location for projects controlled by Department 10
SELECT 
    PNUMBER AS Project_ID,     -- Project Unique Identifier
    PNAME AS Project_Name,     -- Project Name
    PLOCATION AS Project_Location -- Project Location
FROM 
    PROJECT
WHERE 
    DNUM = 10;  -- Filter projects controlled by Department 10

GO
----------------------------------------------- End (9) -----------------------------------------

------------------------------------------------- End Question (2) -------------------------------------------------------------------------
