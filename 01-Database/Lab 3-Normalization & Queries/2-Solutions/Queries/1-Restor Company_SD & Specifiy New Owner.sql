USE master;
GO

-- Restore the database from a backup file
RESTORE DATABASE Company_SD
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\Company_SD_Full.bak'  -- Change to your actual backup file path
WITH 
    MOVE 'Company_SD' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Company_SD.mdf',  -- Update file path
    MOVE 'Company_SD_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Company_SD_Log.ldf',  -- Update file path
    REPLACE,  -- Overwrite if database exists
    RECOVERY;  -- Bring the database online
GO

-- Set database back to multi-user mode
ALTER DATABASE Company_SD SET MULTI_USER;
GO

SELECT name, SUSER_SNAME(owner_sid) AS Owner
FROM sys.databases
WHERE name = 'Company_SD'; -- Replace 'Company_SD' with your actual database name
GO

USE [Company_SD]; -- Replace with your actual database name
GO

ALTER AUTHORIZATION ON DATABASE::[Company_SD] TO [sa];
GO

