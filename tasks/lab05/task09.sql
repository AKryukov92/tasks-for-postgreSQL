SELECT
 e.last_name "Фамилия сотрудника"
 , e.hire_date "Дата найма сотрудника"
 , m.last_name "Фамилия начальника"
 , m.hire_date "Дата найма сотрудника"
FROM employees e
JOIN employees m
  ON e.hire_date < m.hire_date
 AND e.manager_id = m.employee_id
ORDER BY e.hire_date