-- Triggers and Events
 -- (Both Triggers and Events are used for automating tasks in SQL, but they serve different purposes.)


SELECT*
FROM employee_demographics
;
                                -- jaise employee_salary table me ronswaron hai lekin demograohics me nahi hai to ham chahte hain uska detail 
SELECT*                         -- demograhics me bhi rahe to ham iske liye trigger or event ka use kar sakte hain
FROM employee_salary
;



DELIMITER $$
CREATE TRIGGER employee_insert
      AFTER INSERT ON employee_salary     -- DATA INSERT KARNE K LIYE NAYA
      FOR EACH ROW
BEGIN
     INSERT INTO empllayoffslayoffsoyee_demographics (employee_id,first_name,last_name)
     VALUES(NEW.employee_id, NEW.first_name , NEW.last_name);
END $$
DELIMITER 


INSERT INTO employee_salary (employee_id, first_name, last_name , occupation , salary , dept_id)
VALUES(13,'ankit','vatsa','software enginner','1000000',NULL);



-- EVENTS  (CHECK for some special case that happens over a time)
-- Use an Event when you need to schedule tasks periodically for maintenance.



DELIMITER $$
CREATE EVENT delete_retirees1
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
    WHERE age >= 60;
 END $$
 DELIMITER ;
;


SELECT*
FROM employee_demographics
;

SHOW VARIABLES LIKE 'event%';        -- to check whether the event is on or not

