SELECT
 last_name as "Фамилия"
 , to_char(age(current_date,hire_date), 'YY лет MM месяцев') as "Стаж"
FROM employees
order by "Стаж";