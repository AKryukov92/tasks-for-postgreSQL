CREATE USER education PASSWORD 'knowledge' CONNECTION LIMIT 1;

DROP TABLE IF EXISTS regions CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS jobs CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS job_history CASCADE;
DROP TABLE IF EXISTS job_grades CASCADE;

CREATE TABLE regions (
	region_id integer PRIMARY KEY NOT NULL,
	region_name varchar
);
COMMENT ON TABLE regions
  IS 'Contains rows representing a region (such as Americas, Asia, and so on)';

CREATE TABLE countries (
	country_id character(2) PRIMARY KEY NOT NULL,
	country_name varchar,
	region_id integer
);
COMMENT ON TABLE countries IS 'Contains rows for countries, each of which are associated with a region';

CREATE TABLE locations (
	location_id integer PRIMARY KEY NOT NULL,
	street_address varchar,
	postal_code varchar,
	city varchar NOT NULL,
	state_province varchar,
	country_id character(2)
);
COMMENT ON TABLE locations IS 'Contains the addresses of specific offices, warehouses, and/or production sites of a company in a particular country';

CREATE TABLE departments (
	department_id integer PRIMARY KEY NOT NULL,
	department_name varchar NOT NULL,
	manager_id integer,
	location_id integer
);
COMMENT ON TABLE departments IS 'Shows details of the deprtments in which employees work. Each department can have a relationship representing the department manager in the EMPLOYEES table.';

CREATE TABLE employees (
	employee_id integer PRIMARY KEY NOT NULL,
	manager_id integer,
	department_id integer,
	first_name varchar,
	last_name varchar NOT NULL,
	email varchar NOT NULL,
	phone_number varchar,
	hire_date date NOT NULL,
	job_id character(10) NOT NULL,
	salary decimal,
	commission_pct decimal
);
COMMENT ON TABLE employees IS 'Contains details about each employee who works for a department. Some employees may not be assigned to any department.
JOBS contains the job types that can be held by each employee.';

CREATE TABLE jobs (
	job_id character(10) PRIMARY KEY NOT NULL,
	job_title varchar NOT NULL,
	min_salary integer,
	max_salary integer
);
COMMENT ON TABLE jobs IS 'Contains the job types that can be held by each employee';

CREATE TABLE job_history (
	employee_id integer NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	job_id character(10) NOT NULL,
	department_id integer
);
COMMENT ON TABLE job_history IS 'Contains the job history of the employees. If an employee changes departments within the job or changes jobs within the department, a new row is inserted in this table with the old job information of the employee.';

CREATE TABLE job_grades (
	grade_level character(3),
	lowest_sal decimal,
	highest_sal decimal
);
COMMENT ON TABLE job_grades IS 'Identifies a salary range per job grade. The salary ranges do not overlap';

ALTER TABLE countries
	ADD CONSTRAINT "countries_region_id_fkey"
	FOREIGN KEY (region_id)
	REFERENCES regions(region_id)
	ON DELETE NO ACTION;
ALTER TABLE locations
	ADD CONSTRAINT "locations_country_id_fkey"
	FOREIGN KEY (country_id)
	REFERENCES countries(country_id)
	ON DELETE NO ACTION;
ALTER TABLE departments
	ADD CONSTRAINT "departments_manager_id_fkey"
	FOREIGN KEY (manager_id)
	REFERENCES employees(employee_id)
	ON DELETE NO ACTION;
ALTER TABLE departments
	ADD CONSTRAINT "departments_location_id_fkey"
	FOREIGN KEY (location_id)
	REFERENCES locations(location_id)
	ON DELETE NO ACTION;
ALTER TABLE employees
	ADD CONSTRAINT "employees_manager_id_fkey"
	FOREIGN KEY (manager_id)
	REFERENCES employees(employee_id)
	ON DELETE NO ACTION;
ALTER TABLE employees
	ADD CONSTRAINT "employees_department_id"
	FOREIGN KEY (department_id)
	REFERENCES departments(department_id)
	ON DELETE NO ACTION;
ALTER TABLE employees
	ADD CONSTRAINT "employees_job_id"
	FOREIGN KEY (job_id)
	REFERENCES jobs(job_id)
	ON DELETE NO ACTION;
ALTER TABLE job_history
	ADD CONSTRAINT "job_history_job_id"
	FOREIGN KEY (job_id)
	REFERENCES jobs(job_id)
	ON DELETE NO ACTION;
ALTER TABLE job_history
	ADD CONSTRAINT "job_history_department_id"
	FOREIGN KEY (department_id)
	REFERENCES departments(department_id)
	ON DELETE NO ACTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON regions TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON countries TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON locations TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON departments TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON employees TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON jobs TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON job_history TO education;
GRANT SELECT, INSERT, UPDATE, DELETE ON job_grades TO education;

INSERT INTO regions (region_id, region_name) VALUES (1,'Europe');
INSERT INTO regions (region_id, region_name) VALUES (2,'Americas');
INSERT INTO regions (region_id, region_name) VALUES (3,'Asia');
INSERT INTO regions (region_id, region_name) VALUES (4,'Middle East and Africa');

INSERT INTO countries (country_id, country_name, region_id) VALUES('CA','Canada',2);
INSERT INTO countries (country_id, country_name, region_id) VALUES('DE','Germany',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES('UK','United Kingdom',1);
INSERT INTO countries (country_id, country_name, region_id) VALUES('US','United States of America',2);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
	VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
	VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
	VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
	VALUES (1800, '460 Bloor St. W.', 'ON M5S 1XB', 'Toronto', 'Ontario', 'CA');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
	VALUES (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');

INSERT INTO job_grades(grade_level, lowest_sal, highest_sal) VALUES('A',1000,2999);
INSERT INTO job_grades(grade_level, lowest_sal, highest_sal) VALUES('B',3000,5999);
INSERT INTO job_grades(grade_level, lowest_sal, highest_sal) VALUES('C',6000,9999);
INSERT INTO job_grades(grade_level, lowest_sal, highest_sal) VALUES('D',10000,14999);
INSERT INTO job_grades(grade_level, lowest_sal, highest_sal) VALUES('E',15000,24999);
INSERT INTO job_grades(grade_level, lowest_sal, highest_sal) VALUES('F',25000,40000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_PRES','President',20000,40000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_VP','Administration Vice President',15000,30000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_MAN','Sales Manager',5500,8500);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_REP','Sales Representative',6000,12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('ST_MAN','Stock Manager',5500,8500);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('IT_PROG','Programmer',4000,10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('MK_REP','Marketing Representative',4000,9000);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (10,'Administration',NULL,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (20,'Marketing',NULL,1800);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (50,'Shipping',NULL,1500);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (60,'IT',NULL,1400);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (80,'Sales',NULL,2500);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (90,'Executive',NULL,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (110,'Accounting',NULL,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
	VALUES (190,'Contracting',NULL,1700);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (100,'Steven','King','SKING','515.123.4567','17-JUN-87','AD_PRES',24000,NULL,NULL,90);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (101,'Neena','Kochhar','NKOCHHAR','515.123.4568','21-SEP-89','AD_VP',17000,NULL,100,90);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (102,'Lex','De Haan','LDEHAAN','515.123.4569','13-JAN-93','AD_VP',17000,NULL,100,90);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (103,'Alexander','Hunold','AHUNOLD','590.423.4567','03-JAN-90','IT_PROG',9000,NULL,102,60);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (104,'Bruce','Ernst','BERNST','590.423.4568','21-MAY-91','IT_PROG',6000,NULL,103,60);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (107,'Diana','Lorentz','DLORENTZ','590.423.5567','07-FEB-99','IT_PROG',4200,NULL,103,60);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (124,'Kevin','Mourgos','KMOURGOS','650.123.5234','16-NOV-99','ST_MAN',5800,NULL,100,50);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (141,'Trenna','Rajs','TRAJS','650.121.8009','17-OCT-95','ST_CLERK',3500,NULL,124,50);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (142,'Curtis','Davies','CDAVIES','650.121.2994','29-JAN-97','ST_CLERK',3100,NULL,124,50);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (143,'Randall','Matos','RMATOS','650.121.2874','09-JUL-98','ST_CLERK',2600,NULL,124,50);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (144,'Peter','Vargas','PVARGAS','650.121.2004','09-JUL-98','ST_CLERK',2500,NULL,124,50);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','29-JAN-00','SA_MAN',10500,.2,100,80);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (174,'Ellen','Abel','EABEL','011.44.1644.429267','11-MAY-96','SA_REP',11000,.3,149,80);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','24-MAR-98','SA_REP',8600,.2,149,80);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (178,'Kimberely','Grant','KGRANT','011.44.1644.429264','24-MAY-99','SA_REP',7000,.15,149,NULL);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (200,'Jennifer','Whalen','JWHALEN','515.123.4444','17-SEP-87','AD_ASST',4400,NULL,101,10);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (201,'Michael','Hartstein','MHARTSTE','515.123.5555','17-FEB-96','MK_MAN',13000,NULL,100,20);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (202,'Pat','Fay','PFAY','603.123.6666','17-AUG-97','MK_REP',6000,NULL,201,20);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (205,'Shelley','Higgins','SHIGGINS','515.123.8080','07-JUN-94','AC_MGR',12000,NULL,101,110);
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	VALUES (206,'William','Gietz','WGIETZ','515.123.8181','07-JUN-94','AC_ACCOUNT',8300,NULL,205,110);

UPDATE departments SET manager_id = 200 WHERE department_id = 10;
UPDATE departments SET manager_id = 201 WHERE department_id = 20;
UPDATE departments SET manager_id = 124 WHERE department_id = 50;
UPDATE departments SET manager_id = 103 WHERE department_id = 60;
UPDATE departments SET manager_id = 149 WHERE department_id = 80;
UPDATE departments SET manager_id = 100 WHERE department_id = 90;
UPDATE departments SET manager_id = 205 WHERE department_id = 110;

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(102,'13-JAN-93','24-JUL-98','IT_PROG',60);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(101,'21-SEP-89','27-OCT-93','AC_ACCOUNT',110);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(101,'29-OCT-93','15-MAR-97','AC_MGR',110);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(201,'17-FEB-96','19-DEC-99','MK_REP',20);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(114,'24-MAR-98','31-DEC-99','ST_CLERK',50);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(122,'01-JAN-99','31-DEC-99','ST_CLERK',50);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(200,'17-SEP-87','17-JUN-93','AD_ASST',90);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(176,'24-MAR-98','31-DEC-98','SA_REP',80);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(176,'01-JAN-99','31-DEC-99','SA_MAN',80);
INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
	VALUES(200,'01-JUL-94','31-DEC-98','AC_ACCOUNT',80);