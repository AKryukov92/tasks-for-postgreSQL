SELECT
 last_name as "Фамилия"
 , lpad(salary::text, 15, '*') as "Зарплата"
FROM employees;