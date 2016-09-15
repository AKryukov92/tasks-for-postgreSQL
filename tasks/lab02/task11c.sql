SELECT
 employee_id
 , last_name
 , salary
 , department_id
FROM employees
WHERE manager_id = 124
ORDER BY employee_id;