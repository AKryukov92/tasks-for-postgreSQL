DROP TABLE IF EXISTS emp;
CREATE TABLE emp (
 id INTEGER PRIMARY KEY,
 last_name CHARACTER VARYING,
 first_name CHARACTER VARYING,
 dept_id INTEGER REFERENCES dept(id)
 );