SELECT
 last_name
 , hire_date
 , CASE 
   WHEN extract(year from age(current_date, hire_date)) > 25 THEN '25 лет службы'
   WHEN extract(year from age(current_date, hire_date)) > 20 THEN '20 лет службы'
   WHEN extract(year from age(current_date, hire_date)) > 15 THEN '15 лет службы'
   ELSE 'все только начинается'
   END
FROM employees;