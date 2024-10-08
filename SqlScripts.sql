EXEC sp_help 'dbo.students';

EXEC sp_help 'dbo.employees';

EXEC sp_help 'dbo.Cust_details';

SELECT ID, NAME, SALARY, SALARY + 5000 AS "SALARY_BONUS" FROM employee;

SELECT MAX(salary), MIN(salary), MAX(salary)-MIN(salary) AS salary_difference FROM employee;

SELECT NAME, AGE, ADDRESS, SALARY * 1.10 AS new_salary_with_bonus FROM employee;

SELECT AVG(SALARY) AS average_salary FROM employee;

SELECT * FROM employee WHERE ID % 2 = 0;

select * from CUSTOMERS where SALARY <> ALL (select SALARY from CUSTOMERS where AGE = 5);

select * from customers WHERE SALARY > ANY (select SALARY from CUSTOMERS where AGE = 45);

SELECT * FROM CUSTOMERS WHERE EXISTS (SELECT PRICE FROM CARS WHERE CARS.ID = CUSTOMERS.ID AND PRICE > 2000000);

SELECT CURRENT_TIMESTAMP;

SELECT * FROM ORDERS WHERE DATE < '2008/06/01';

ALTER DATABASE OldDatabaseName MODIFY NAME = NewDatabaseName;
select * from sys.databases

EXEC sp_databases;

BACKUP DATABASE database_name TO medium = 'filepath'
GO
--Updated data
BACKUP DATABASE my_db TO medium = 'filepath' WITH DIFFERENTIAL;
GO

RESTORE DATABASE database_name FROM DISK = 'filepath';
GO

SQL> RESTORE DATABASE testDB FROM DISK = 'D:\testDB.bak' WITH REPLACE
GO

select * from sys.tables

SELECT * FROM BUYERS;
SELECT * FROM NEW_CUSTOMERS;
