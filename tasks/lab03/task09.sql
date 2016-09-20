SELECT 
 job_id as "Должность"
, CASE job_id
    WHEN 'AD_PRES' THEN 'A'
	WHEN 'ST_MAN' THEN 'B'
	WHEN 'IT_PROG' THEN 'C'
	WHEN 'SA_REP' THEN 'D'
	WHEN 'ST_CLERK' THEN 'E'
	ELSE '0'
  END AS "Категория"
FROM employees
ORDER BY job_id;