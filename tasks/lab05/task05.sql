SELECT
 e.last_name "Фамилия сотрудника"
 , e.employee_id "Код сотрудника"
 , m.last_name "Фамилия начальника"
 , m.employee_id "Код начальника"
FROM employees e
LEFT JOIN employees m
  ON e.manager_id = m.employee_id;