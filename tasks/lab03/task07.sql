SELECT
 last_name as "Фамилия"
 , COALESCE(commission_pct::text, 'отсутствует') as "Комиссия"
FROM employees;