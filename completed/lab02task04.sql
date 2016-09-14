SELECT
 last_name
 , job_id
 , hire_date
FROM employees
WHERE last_name LIKE 'Matos' OR last_name LIKE 'Taylor'
ORDER BY hire_date asc;