SELECT
 last_name as "Фамилия"
 , hire_date as "Дата найма"
 , trim(to_char((hire_date + '6 months'::interval)::date + 8 - extract(dow from hire_date + '6 months'::interval)::integer , 'Day'))
 || trim(to_char((hire_date + '6 months'::interval)::date + 8 - extract(dow from hire_date + '6 months'::interval)::integer, ', the DD of Month'))
 || to_char((hire_date + '6 months'::interval)::date + 8 - extract(dow from hire_date + '6 months'::interval)::integer, ', YYYY') as "Дата аттестации"
FROM employees;