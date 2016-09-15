SELECT
 c.last_name
 , c.hire_date
FROM employees e
JOIN employees c
  ON e.department_id = c.department_id
 AND e.last_name = 'Zlotkey'
 AND c.last_name != e.last_name