CREATE TABLE my_employee(
id  INTEGER CONSTRAINT my_employee_id_nn NOT NULL,
last_name CHARACTER VARYING(25),
first_name CHARACTER VARYING(25),
userid  CHARACTER VARYING(8),
salary  NUMERIC(9,2)
);