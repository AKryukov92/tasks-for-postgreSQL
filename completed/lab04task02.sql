SELECT
 job_id "Должность"
 , max(salary) "Максимум"
 , min(salary) "Минимум"
 , sum(salary) "Сумма"
 , round(avg(salary)) "Среднее арифметическое"
FROM employees
GROUP BY job_id
ORDER BY "Должность";