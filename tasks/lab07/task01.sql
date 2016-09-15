SELECT
 department_id
FROM departments
EXCEPT
SELECT
 department_id
FROM employees
WHERE job_id = 'ST_CLERK'
ORDER BY department_id