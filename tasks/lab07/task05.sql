SELECT
 last_name
 , department_id
 , '' "department_name"
FROM employees
UNION ALL
SELECT
 ''
 , department_id
 , department_name
FROM departments
ORDER BY department_name, last_name