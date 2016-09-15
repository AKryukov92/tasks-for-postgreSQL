SELECT
 count(*) as "Всего"
 , sum(CASE WHEN (extract(year from hire_date) = '1995') THEN 1 END) as "1995"
 , sum(CASE WHEN (extract(year from hire_date) = '1996') THEN 1 END) as "1996"
 , sum(CASE WHEN (extract(year from hire_date) = '1997') THEN 1 END) as "1997"
 , sum(CASE WHEN (extract(year from hire_date) = '1998') THEN 1 END) as "1998"
FROM employees;