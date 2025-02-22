-- Group by : The GROUP BY statement in SQL is used to group rows that have the same values in one or more columns. 
-- It is commonly used with aggregate functions 
-- (such as COUNT(), SUM(), AVG(), MAX(), MIN()) to perform calculations on each group.


SELECT *
FROM employee_demographics
;

SELECT gender , AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation , salary
;

-- ORDER BY :- Order by is used to short the result in either ascending or descending order.


SELECT *
FROM employee_demographics
ORDER BY first_name          -- by default it order by in ASCENDING order
;

SELECT *
FROM employee_demographics           
ORDER BY                          -- hum multiple table pe order by lga sakte  hain leking phle usi pe 
age DESC,                         -- lagega jo code me pahle likha hai jaise yha age likha hai to phle 
gender                            -- age order hoga descending me fir gender by default ascending me
;

