-- String Functions (built in functions that helps us to use strings and work with string diffrently)

SELECT length('skyfall')         -- return the length of the string inside the colon
;

-- length

SELECT first_name, length(first_name)
FROM employee_demographics                -- In SQL, the statement ORDER BY 2; is used to sort query results based on the second column in the SELECT statement.
ORDER BY 2
;

-- upper ( changes the small case to upper case)

SELECT upper('sky');

SELECT lower('SKY');


SELECT first_name , upper(first_name)
FROM employee_demographics
;


-- Trim (used to tream the sentence or the spaces)

SELECT RTRIM('           sky         ');       -- RTRIM: right trim

SELECT LTRIM('         sky        ');           -- LTRIM: left trim


SELECT first_name , LEFT(first_name, 4)          -- this only take 4 letter of first_name from left
FROM employee_demographics
;

SELECT first_name , RIGHT(first_name, 4)          -- this only take 4 letter of first_name from right
FROM employee_demographics
;

SELECT first_name,
LEFT(first_name, 4),                              -- combining both
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2),
birth_date ,
SUBSTRING(birth_date ,3,2) AS birth_year          -- substring() select the position of first name from letter 3 and take 2 letter
FROM employee_demographics                        -- run at the time of revision youll get to know what is happening
;


-- we can also pull out month by use of substring


SELECT first_name,
LEFT(first_name, 4),                              
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2),
birth_date ,
SUBSTRING(birth_date ,6,2) AS birth_month         
FROM employee_demographics                       
;

-- seperating birth year , month , and date in diffrent column

SELECT first_name,last_name, employee_id, age,gender,
SUBSTRING(birth_date,1,4) AS birth_year,
SUBSTRING(birth_date,6,2) AS birth_month,
SUBSTRING(birth_date,9,2) AS birth_date
FROM employee_demographics
;


-- REPLACE

SELECT  first_name, REPLACE(first_name , 'a' , 'z')           -- first_name me jaha jaha small 'a' hoga wha wha z se replace ho jayega
FROM employee_demographics;


-- LOCATE

SELECT LOCATE('n' , 'Ankit')                                -- n khojna hai ankit me to locate iska position bata dega jo ki 2 hai.
;

SELECT first_name,
LOCATE('A', first_name)                                    -- isme upper or lower case ka locha nahi hai locate me 
FROM employee_demographics
;


-- CONCAT

SELECT first_name , last_name,
CONCAT (first_name, ' ' ,last_name) AS full_name       -- to provide space between first and last name i have given colon
FROM employee_demographics
;



