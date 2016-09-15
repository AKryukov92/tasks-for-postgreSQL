SELECT
 employee_id
 , last_name
FROM employees
WHERE department_id IN (
  SELECT
    department_id
  FROM employees
  WHERE last_name LIKE '%u%'
) AND salary > (
  SELECT
   avg(salary)
  FROM employees
)