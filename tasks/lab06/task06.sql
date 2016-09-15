SELECT
 department_id
 , last_name
 , job_id
FROM employees
WHERE department_id = (
  SELECT
   department_id
  FROM departments
  WHERE department_name = 'Executive'
)