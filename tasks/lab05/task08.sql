SELECT
 r.last_name
 , r.hire_date
FROM employees l
JOIN employees r
  ON r.hire_date > l.hire_date
WHERE l.last_name = 'Davies'