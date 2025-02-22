-- Windowa Functions  (Window functions perform calculations across a set of rows related to the current row without collapsing the result set (unlike GROUP BY).)

SELECT gender , AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary  AS sal               -- for calculating AVG salary of male and female 
     ON dem.employee_id = sal.employee_id
GROUP BY gender
;

SELECT gender , AVG(salary) OVER()
FROM employee_demographics AS dem
JOIN employee_salary  AS sal               -- for calculating AVG salary OVER everything (entire column)
     ON dem.employee_id = sal.employee_id
;

-- partition by


SELECT dem.first_name , dem.last_name, gender , AVG(salary) OVER( PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary  AS sal                            -- for calculating AVG salary of individual
     ON dem.employee_id = sal.employee_id
GROUP BY  dem.first_name , dem.last_name, gender
;


SELECT dem.first_name , dem.last_name, gender , AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary  AS sal                            -- grouping by first name, last name and gender will give the unique value from every table 
     ON dem.employee_id = sal.employee_id               -- where as using window function in upper query will give gender based average salary for each table
GROUP BY  dem.first_name , dem.last_name, gender
;


SELECT dem.first_name , dem.last_name, gender , salary,
SUM(salary) OVER( PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total   -- this function adds row wise salary for every male and female
FROM employee_demographics AS dem                               
JOIN employee_salary  AS sal                           
     ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name , dem.last_name,  gender , salary,
ROW_NUMBER() OVER() as serial_number                                      -- give numbering to the row
FROM employee_demographics AS dem                       
JOIN employee_salary  AS sal                           
     ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, dem.first_name , dem.last_name,  gender , salary,
ROW_NUMBER() OVER(PARTITION BY gender ) as serial_number                                     
FROM employee_demographics AS dem                                    -- through this query we can also see the number of male amd female
JOIN employee_salary  AS sal                           
     ON dem.employee_id = sal.employee_id
;

-- for writing highest salary first  we can add order by to the upper query

SELECT dem.employee_id, dem.first_name , dem.last_name,  gender , salary,
ROW_NUMBER() OVER( PARTITION BY gender ORDER BY salary DESC) as serial_number         -- HERE best can be partiotioned is gender so we are usign gender                                     
FROM employee_demographics AS dem                                                     -- in order to partition and also we can use partition by and                 
JOIN employee_salary  AS sal                                                          -- order by together                          
     ON dem.employee_id = sal.employee_id
;

-- RANK (It provides a ranking based on the ORDER BY clause, and it allows duplicate ranks when there are ties. When duplicate ranks occur, the next rank is skipped.)


SELECT dem.employee_id, dem.first_name , dem.last_name,  gender , salary,
ROW_NUMBER() OVER( PARTITION BY gender ORDER BY salary DESC) AS serial_number_ROW, 
RANK() OVER( PARTITION BY gender ORDER BY salary DESC) AS rank_num              -- RANK MATLAB rank dena jiska SAME hoga usko same rank mil jayega                      
FROM employee_demographics AS dem                                                -- or skip kr dega ek number jaise yha 6 ko skip kiya                   
JOIN employee_salary  AS sal                                                                                    
     ON dem.employee_id = sal.employee_id
;

-- DENSE_RANK (RANK me jaise 2 number same ho gaya tha to ek number skip ho gaya tha lekin DENSE_RANK me agr do - 5,5 rank rahega to agla rank 6 ho 
-- jayega whai RANK me agla number 7 ho jayega run krke dekho revision ke time pata chal jayega)


SELECT dem.employee_id, dem.first_name , dem.last_name,  gender , salary,
ROW_NUMBER() OVER( PARTITION BY gender ORDER BY salary DESC) AS serial_number_ROW, 
RANK() OVER( PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK () OVER( PARTITION BY gender ORDER BY salary DESC) AS DENSE_rank_num                                
FROM employee_demographics AS dem                                                           
JOIN employee_salary  AS sal                                                                                    
     ON dem.employee_id = sal.employee_id
;



