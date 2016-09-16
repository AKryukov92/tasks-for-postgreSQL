DROP VIEW IF EXISTS dept50;
CREATE VIEW dept50
AS
SELECT
 employee_id "КодСотр"
 , trim(last_name) "Сотр"
 , department_id "Отдел"
FROM employees
WHERE department_id = 50;