INSERT INTO my_employees
VALUES (3, 'Biri','Ben', lower(substring('Ben',1,1) || 'Biri'), 1100);

INSERT INTO my_employees
VALUES (4, 'Newman','Chad', lower(substring('Chad',1,1) || 'Newman'), 750);

SELECT * FROM my_employees;