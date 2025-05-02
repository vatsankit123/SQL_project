-- UNIONS (Unions used to combine the rows data from seperate table in a single result set)

SELECT age, gender
FROM employee_demographics          -- if we run this table to data mix ho jayega age or gender or first name or last name .
UNION                               -- isliye ham same data rakhenge do table ka taki column name same rahe or data bhi same rahe.
SELECT first_name , last_name       -- jo likha hai na samajh aaye to run krke dekho run krne ke time
FROM employee_salary
;

SELECT first_name, last_name
FROM employee_demographics         
UNION  DISTINCT                     -- BY default it is DISTINCT agar nahi bhi likhenge union ke aage distinct to sahi hai , Distinct me bas unique                           
SELECT first_name , last_name       -- value ayega
FROM employee_salary
;

SELECT first_name, last_name
FROM employee_demographics         
UNION  ALL                         -- union all karne par dono table ka sara value aa jayega                                
SELECT first_name , last_name       
FROM employee_salary
;


SELECT first_name, last_name , 'Old Man' AS label   
FROM employee_demographics                        
WHERE age>40 AND gender = 'male' 
UNION
SELECT first_name, last_name , 'Old Lady' AS label              -- this is how we use unions and multiple select statement
FROM employee_demographics                        
WHERE age>40 AND gender = 'female'
UNION
SELECT first_name, last_name , 'highly paid employee' AS label   
FROM employee_salary                      
WHERE salary > 70000
ORDER BY first_name, last_name
;
