-- subqueries

SELECT*
FROM employee_demographics                                         
WHERE employee_id IN                                
				(SELECT employee_id               -- bracket ke andar jo bhi hai vo subquery hai.
					 FROM employee_salary
					 WHERE dept_id = 1)
;

-- COMPARING whether the salary of employee is below average and above average .

SELECT first_name, salary,  AVG(salary)
FROM employee_salary
GROUP BY first_name , salary
;