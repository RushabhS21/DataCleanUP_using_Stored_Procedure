// employee.sql
CREATE DATABASE employee;
// I have imported the data from a csv.
SHOW databases;
USE employee;

SELECT * FROM emp_data;

// Stored_procedure.sql
USE employee;

DELIMITER $$
CREATE PROCEDURE clean_elogin()
BEGIN
	DELETE FROM emp_data
    	WHERE `Status`= 'In-Active';

   	 DELETE FROM emp_data
   	 WHERE `Dcode` = 'Marketing' OR `Dcode` = 'Finance';
    
    	ALTER TABLE emp_data
    	ADD COLUMN Login_status VARCHAR(20);
    	
UPDATE emp_data
    SET Login_status = CASE
		WHEN `TNOL` = 0 AND `DSLL` = 'NA' THEN 'Yet to login'
		ELSE 'Logged in'
        END;
SELECT "Procedure executed";
END $$

CALL employee.clean_elogin();

