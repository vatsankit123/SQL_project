-- joins

-- inner join

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

SELECT *
FROM employee_demographics          -- if we write only join than it will perform inner join by default
JOIN employee_salary
;

SELECT *
FROM employee_demographics         -- this query will show an error that column employee_id in field list is ambiguous
JOIN employee_salary               -- this mean that the system doent know which table employee id youre talking about matlb ki ye
  ON employee_id = employee_id     -- kis table ki employee id ki bt ki jaa rhi hai salary table  ki ya employee demographic table ki (niche correct query hai)
  ;
  
  
SELECT *
FROM employee_demographics AS dem
JOIN employee_salary  AS sal                -- yha ham aliasing ka bhi use kr rhe AS keyword se taki query short ho sake
  ON dem.employee_id = sal.employee_id
  ;
  
  -- selecting the actual columns in inner join
  
  SELECT dem.employee_id , age , occupation
  FROM employee_demographics AS dem           -- so if we write SELECT employee_id it will give same error as before so we have to specify which
  INNER JOIN employee_salary AS sal           -- employee_id we are talking about thats why i have written dem.employee_id
    ON dem.employee_id = sal.employee_id
    ;
    
    -- outer joins (left join and right join)
    
    
SELECT * 
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal                   
	 ON dem.employee_id = sal.employee_id        
 ;            
 
SELECT * 
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal                   
	 ON dem.employee_id = sal.employee_id        
 ;                           
 
    
SELECT dem.employee_id , dem.first_name , dem.last_name , age , gender, birth_date , occupation , salary , dept_id
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal                   -- yha age , gender, birthdate, occupation , salry , dept id ek hi table me exist krta hai to yha dem.age ya sal. age nahi karna pdega
	 ON dem.employee_id = sal.employee_id          -- hum jo ON keyword use karte hain kosish karenge ki UNIQUE ID pe match karwaye jo dono table me
 ;                                                 -- unique ho jaise yha employee_id unique hai...
 
 
 -- self join
 
SELECT * 
FROM employee_salary  emp1
JOIN employee_salary  emp2                         -- SAME table ko join kiya hai isme as nahi bhi likhenge to chalega
	 ON emp1.employee_id + 1 = emp2.employee_id        
 ; 
 
 SELECT emp1.employee_id AS emp_santa,
 emp1.first_name AS first_name_santa,
 emp1.last_name AS last_name_santa,
 emp2.employee_id AS emp_emp,
 emp2.first_name AS first_name_emp,
 emp2.last_name AS last_name_emp
 FROM employee_salary emp1
 JOIN employee_salary emp2
   ON emp1.employee_id + 1 = emp2.employee_id 
   ;
 
-- joining multiple tables

SELECT*
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id           -- although dept_id and department_id having diffrent name but having same value isliye ham isko 
INNER JOIN parks_departments AS pd                -- jod sakte hain lekin parks_department ko demographics table ke sath nahi jod sakte kyunki
   ON sal.dept_id = pd.department_id              -- dono me kuch bhi common nahi hai.. is tarah se multiple table join hota hai
;                                             


SELECT*
FROM parks_departments
;
 
 
 