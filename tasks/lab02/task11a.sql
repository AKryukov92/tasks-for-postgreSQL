SELECT
 employee_id
 , last_name
 , salary
 , department_id
FROM employees
WHERE manager_id = 103
ORDER BY last_name;