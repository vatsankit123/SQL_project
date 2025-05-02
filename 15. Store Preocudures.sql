-- Store Procedures(A Stored Procedure is a precompiled set of SQL statements that can be stored and executed on a database server.)

CREATE PROCEDURE large_salary()
SELECT*
FROM employee_salary
WHERE salary>=50000;
;

CALL large_salary();


DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT*
	FROM employee_salary
	WHERE salary>=50000;              -- DELIMITER is used to execute multiple select statement in one query it end with END $$ NO semicolon required
	SELECT*
	FROM employee_salary
	WHERE salary>=10000;               -- we will get two result below
END $$
DELIMITER ;

CALL large_salaries2();



DELIMITER $$
CREATE PROCEDURE large_salaries3(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary                    -- we can call any salary with this code based on employee_id get explanantion from chat gpt
    WHERE employee_id = p_employee_id
    ;	                                  
END $$
DELIMITER ;

CALL large_salaries3(1);
CALL large_salaries3(2);




