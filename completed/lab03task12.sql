SELECT
 last_name || rpad(' ', round(salary/1000)::integer, '*')  as "Сотрудники и зарплаты" 
FROM employees;