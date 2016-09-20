SELECT
 employee_id as "Код сотрудника"
 , last_name as "Фамилия"
 , salary as "Зарплата"
 , round(salary * 1.155) as "Новая зарплата"
FROM employees;