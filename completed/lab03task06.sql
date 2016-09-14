SELECT
 last_name as "Фамилия"
 , (current_date - hire_date) / 30 as "Стаж"
FROM employees
order by "Стаж";