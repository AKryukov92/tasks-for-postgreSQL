SELECT
 job_id "Должность"
 , count(*) "Количество"
FROM employees
GROUP BY job_id
ORDER BY "Должность";