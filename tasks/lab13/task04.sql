SELECT
 last_name
 , CASE extract(year from hire_date) WHEN 1998 THEN 'Нужна аттестация' ELSE 'Не в этом году' END
FROM employees
ORDER BY hire_date