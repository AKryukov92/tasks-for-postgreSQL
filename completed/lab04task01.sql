SELECT
 max(salary) "Максимум"
 , min(salary) "Минимум"
 , sum(salary) "Сумма"
 , round(avg(salary)) "Среднее арифметическое"
FROM employees;