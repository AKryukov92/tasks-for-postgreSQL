SELECT
  e.last_name "Фамилия"
  , e.job_id "Код должности"
  , d.department_name "Отдел"
  , e.salary "Зарплата"
  , j.grade_level "Категория"
FROM employees e
JOIN departments d
  ON e.department_id = d.department_id
JOIN job_grades j
  ON e.salary > j.lowest_sal
 AND e.salary < j.highest_sal;