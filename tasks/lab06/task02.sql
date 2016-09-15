SELECT
 employee_id
 , last_name
 , salary
FROM employees
WHERE salary > (
  SELECT
    avg(salary)
  FROM employees
)
ORDER BY salary ASC