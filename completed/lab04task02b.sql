SELECT
 job_id "Должность"
 , max(salary) "Максимум"
 , min(salary) "Минимум"
 , sum(salary) "Сумма"
 , round(avg(salary)) "Среднее арифметическое"
FROM employees
WHERE job_id = 'ST_CLERK'
GROUP BY job_id
ORDER BY "Должность";