cd tasks/lab11
psql -d human_resources -U postgres -f task01.sql

psql -d human_resources -U usera -c "SELECT * FROM departments ORDER BY department_id" -H -F "," > task02.html

psql -d human_resources -U postgres -f task03.sql
psql -d human_resources -U postgres -f task04.sql

psql -d human_resources -U usera -c "INSERT INTO departments (department_id, department_name) VALUES (500,'Education');"
psql -d human_resources -U userb -c "INSERT INTO departments (department_id, department_name) VALUES (510,'Human Resources');"
psql -d human_resources -U usera -c "SELECT * FROM departments ORDER BY department_id" -H -F "," > task05a.html
psql -d human_resources -U userb -c "SELECT * FROM departments ORDER BY department_id" -H -F "," > task05b.html

psql -d human_resources -U postgres -f task06.sql -H -F "," > task06.html
psql -d human_resources -U postgres -f task07.sql -H -F "," > task07.html

psql -d human_resources -U usera -c "CREATE TABLE depts_copy AS SELECT * FROM departments"

psql -d human_resources -U postgres -f task09.sql -H -F "," > task09.html
psql -d human_resources -U postgres -f task10.sql
psql -d human_resources -U postgres -f task11.sql
psql -d human_resources -U postgres -f task11a.sql -H -F "," > task11a.html

pause