-- case statements

SELECT first_name,
last_name,
age,
CASE                                                 -- we have used multiple case statement
   WHEN age <=30 THEN 'young'
   WHEN age BETWEEN 31 and 50 THEN 'old'
   WHEN age > 50 THEN 'senior citigen'
END  AS age_label                                    -- below we will use AS statement with end to reduce the column name niche ka query dekh k smjh lena
FROM employee_demographics
;

SELECT employee_id,  
       CASE  
           WHEN Salary > 100000 THEN 'High'  
           WHEN Salary BETWEEN 50000 AND 100000 THEN 'Medium'  
           ELSE 'Low'  
       END AS SalaryLevel  
FROM employee_salary;


SELECT first_name,
last_name,
age,
CASE                                        
   WHEN age <=30 THEN 'young'
   WHEN age BETWEEN 31 and 50 THEN 'old'
   WHEN age > 50 THEN 'senior citigen'
END AS age_brackets
FROM employee_demographics
;


-- pay increase and bonus
-- <50000 = 5 increase
-- >50000 = 7% increase
-- Finance = 10 %

SELECT first_name, last_name, salary,
CASE
WHEN salary < 50000 THEN salary + (salary*0.05)
WHEN salary > 50000 THEN salary + (salary*0.07)
END AS new_salary,
CASE
  WHEN dept_id = 6 THEN salary *0.10
END AS bonus
FROM employee_salary
;



