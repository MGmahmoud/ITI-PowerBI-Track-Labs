-- Use the created database
USE Company;
GO

-- Insert data into DEPARTMENT first (so DNUMBER exists before being referenced)
INSERT INTO DEPARTMENT (DNAME, DNUMBER, MGRSSN, MGRSTARTDATE)
VALUES ('HR', 1, NULL, '2020-01-15'),  -- MGRSSN will be updated later
       ('IT', 2, NULL, '2019-07-10');  -- MGRSSN will be updated later
GO

-- Insert data into EMPLOYEE (Managers first, so they can be referenced)
INSERT INTO EMPLOYEE (FNAME, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO)
VALUES ('John', 'Doe', '123456789', '1985-05-12', '123 Main St', 'M', 60000, NULL, 1), -- Manager of HR
       ('Jane', 'Smith', '987654321', '1990-08-22', '456 Oak St', 'F', 75000, '123456789', 2); -- Manager of IT
GO

-- Now update DEPARTMENT with correct MGRSSN
UPDATE DEPARTMENT SET MGRSSN = '123456789' WHERE DNUMBER = 1;
UPDATE DEPARTMENT SET MGRSSN = '987654321' WHERE DNUMBER = 2;
GO

-- Insert data into DEPT_LOCATIONS
INSERT INTO DEPT_LOCATIONS (DNUMBER, DLOCATION)
VALUES (1, 'New York'),
       (2, 'San Francisco');
GO

-- Insert data into PROJECT
INSERT INTO PROJECT (PNAME, PNUMBER, PLOCATION, DNUM)
VALUES ('Project Alpha', 101, 'New York', 1),
       ('Project Beta', 102, 'San Francisco', 2);
GO

-- Insert data into WORKS_ON
INSERT INTO WORKS_ON (ESSN, PNO, HOURS)
VALUES ('123456789', 101, 35.5),
       ('987654321', 102, 40.0);
GO

-- Insert data into DEPENDENT
INSERT INTO DEPENDENT (ESSN, DEPENDENT_NAME, SEX, BDATE, RELATIONSHIP)
VALUES ('123456789', 'Emily Doe', 'F', '2010-06-15', 'Daughter'),
       ('987654321', 'Michael Smith', 'M', '2015-09-20', 'Son');
GO
