-- Limit and Aliasing

SELECT *
FROM employee_salary
ORDER BY salary DESC            --  is tarah se ham highest salary bhi nikal sakte hain table se LIMIT ka or order by ka use krke.
LIMIT 1
;

SELECT *
FROM employee_demographics
LIMIT 3
;

SELECT *
FROM employee_demographics       -- the LIMIT 2,1 means here SKIP the first 2 rows and return the next 1 row 
ORDER BY age DESC                -- matlab 3rd row return karega ..
LIMIT 2 , 1                      -- Yaha 3- OFFSET hai matlab 3 row ko skip kro
;                                -- or 1- LIMIT hai.



-- Aliasing    (Aliasing in SQL is the process of assigning a temporary name to a table or column to make queries more readable and manageable.)

SELECT gender , AVG(age) AS avg_age
FROM employee_demographics                -- this is called Aliasing , ham kisi bhi function ka name change kr sakte hain AS keyword ka use krke
GROUP BY gender                           -- jaise yha kiya gaya 
HAVING avg_age >40                        
;
