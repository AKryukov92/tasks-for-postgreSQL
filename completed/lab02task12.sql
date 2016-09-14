SELECT
 last_name
FROM employees
WHERE substring(last_name from 3 for 1) = 'a';