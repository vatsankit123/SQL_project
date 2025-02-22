-- WHERE Clause

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT *
FROM employee_salary
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE  birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical Operator in WHERE Clause

SELECT *
FROM employee_demographics
WHERE  birth_date > '1985-01-01'
AND gender='male'   #in AND Operator both the condition has to be true
;

SELECT *
FROM employee_demographics
WHERE  birth_date > '1985-01-01'
OR gender='male'      #in OR Operator either of the condition has to be true 
;

SELECT *
FROM employee_demographics
WHERE  birth_date > '1985-01-01'
OR NOT gender ='male'      #in NOT Operator negation of or operator is there
;

SELECT *
FROM employee_demographics
WHERE (first_name ='leslie' AND age= 44)  OR age>55
;

-- LIKE Statement #this statement is used to find the almost match or a specific sequence in a table
-- LIKE statment uses two special character i.e % sign and _ sign
-- % sign matches anything or more than one charcter
-- _ sign matches exactly one character or a specific values
-- below is the use cases of the both


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'  # return every name starts with letter a and if we add one more percent sign before letter a than it will return every name starts before with letter a and after letter a
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%' # explanation in copy
;

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'      
;


