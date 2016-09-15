SELECT
 employee_id
 , job_id
FROM job_history
INTERSECT
SELECT
 employee_id
 , job_id
FROM employees