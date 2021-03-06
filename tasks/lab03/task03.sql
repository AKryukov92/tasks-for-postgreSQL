SELECT
 last_name as "Фамилия"
 , char_length(last_name) as "Длина фамилии"
FROM employees
WHERE substring(last_name from 1 for 1) IN ('J','A','M')
ORDER BY last_name;