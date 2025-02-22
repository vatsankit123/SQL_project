-- Having vs Where

SELECT gender , AVG(age)
FROM employee_demographics       -- this query is incorrect because The issue with this query is that we cannot use an aggregate function 
WHERE AVG(age) > 40
GROUP BY gender                  -- (AVG(age)) in the WHERE clause. The WHERE clause filters individual rows before aggregation happens,
;								 -- whereas AVG(age) is computed after grouping. So correction is below

-- Using Having clause

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) >40
;

SELECT occupation,  AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'      -- by WHERE clause filteration is done over row level matlab where clause ROW level pe hi filter krta hai
GROUP BY occupation
HAVING AVG(salary)>75000               -- by HAVING clause filteration is done over aggrigate level matlab having clasue ko use krne se ham overall 
;									   -- table ko filter krte hain 