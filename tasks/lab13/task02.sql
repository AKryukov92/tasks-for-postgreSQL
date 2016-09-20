SELECT
 last_name as "Фамилия"
 , hire_date as "Дата найма"
 , to_char(hire_date, 'Day') as "День недели"
FROM employees
ORDER BY "День недели";