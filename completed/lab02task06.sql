SELECT
 last_name as "Фамилия"
 , salary as "Зарплата за месяц"
FROM employees
WHERE (department_id = 20 OR department_id = 50) AND salary > 5000 AND salary < 12000
ORDER BY last_name ASC;