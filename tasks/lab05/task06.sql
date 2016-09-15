SELECT
 e.department_id "Отдел"
 , e.last_name "Сотрудник"
 , c.last_name "Коллеги"
FROM employees e
JOIN employees c
  ON e.department_id = c.department_id
 AND e.employee_id != c.employee_id
ORDER BY e.department_id