BEGIN;

INSERT INTO my_employees
VALUES (5, 'Ropeburn','Audrey', lower(substring('Audrey',1,1) || 'Ropeburn'), 1550);

SELECT * FROM my_employees;

SAVEPOINT before_delete;

DELETE FROM my_employees;

SELECT * FROM my_employees;

ROLLBACK TO SAVEPOINT before_delete;

SELECT * FROM my_employees;

COMMIT;