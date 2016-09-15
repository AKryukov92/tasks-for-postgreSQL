SELECT
 last_name
 , hire_date
FROM employees
WHERE extract(year from hire_date) = 1994;