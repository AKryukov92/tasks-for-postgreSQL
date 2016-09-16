DROP TABLE IF EXISTS my_employees;
CREATE TABLE my_employees(
id  INTEGER CONSTRAINT my_employee_id_nn NOT NULL,
last_name CHARACTER VARYING,
first_name CHARACTER VARYING,
userid  CHARACTER VARYING,
salary  NUMERIC(9,2)
);