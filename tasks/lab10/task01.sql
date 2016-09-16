DROP VIEW IF EXISTS employees_vu;
CREATE VIEW employees_vu
AS
SELECT
 employee_id
 , last_name "employee"
 , department_id
FROM employees;
 