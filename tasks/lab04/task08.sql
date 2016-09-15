SELECT
 job_id
 , sum(CASE department_id WHEN 20 THEN salary ELSE NULL END)
 , sum(CASE department_id WHEN 50 THEN salary ELSE NULL END)
 , sum(CASE department_id WHEN 80 THEN salary ELSE NULL END)
 , sum(CASE department_id WHEN 90 THEN salary ELSE NULL END)
 , sum(salary)
FROM employees
GROUP BY job_id
ORDER BY job_id;