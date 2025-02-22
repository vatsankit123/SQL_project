-- CTEs (A Common Table Expression (CTE) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
-- It improves readability and makes complex queries more manageable.)


WITH CTE_Example AS
(
SELECT gender , AVG(salary) AS avg_sal , MAX(salary) AS max_sal , MIN(salary)  AS min_sal , COUNT(salary)  AS count_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

-- TO FIND AVERAGE SALARY OF BOTH MALE AND FEMALE


WITH CTE_Example AS
(
SELECT gender , AVG(salary) AS avg_sal , MAX(salary) AS max_sal , MIN(salary)  AS min_sal , COUNT(salary)  AS count_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG( avg_sal )
FROM CTE_Example
;

-- CTEs is also used to enhance the redeability of the SQL query

SELECT AVG(avg_sal)
FROM (SELECT gender , AVG(salary) AS avg_sal , MAX(salary) AS max_sal , MIN(salary)  AS min_sal , COUNT(salary)  AS count_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;


WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
), 
CTE_Example2 AS                            -- we can use multiple select statement and join to crete new table with desired info by using CTE.
(
SELECT employee_id,salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
  ON CTE_Example.employee_id = CTE_Example2.employee_id
;


WITH CTE_Example (gender, AVG_sal, MAX_sal, MIN_sal,COUNT_sal) AS
(
SELECT gender , AVG(salary) AS avg_sal , MAX(salary) AS max_sal , MIN(salary)  AS min_sal , COUNT(salary)  AS count_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;


