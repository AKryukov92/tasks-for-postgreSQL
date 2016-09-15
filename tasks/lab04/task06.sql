SELECT
 manager_id,
 min(salary) 
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING min(salary) > 6000
ORDER BY min(salary) DESC;