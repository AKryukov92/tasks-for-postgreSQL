SELECT
 last_name as "Фамилия"
 , salary as "Зарплата за месяц"
 , commission_pct as "Комиссия"
FROM employees
WHERE commission_pct = 0.2;