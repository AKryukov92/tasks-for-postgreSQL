DROP TABLE IF EXISTS doors;
CREATE TABLE doors (
 door_id INTEGER PRIMARY KEY,
 location VARCHAR
);
INSERT INTO doors VALUES (1, 'Building hall');
INSERT INTO doors VALUES (2, 'Office entrance');
INSERT INTO doors VALUES (3, 'Wicket');
INSERT INTO doors VALUES (4, 'Service entrance');

DROP TABLE IF EXISTS passes;
CREATE TABLE passes (
 pass_id SERIAL PRIMARY KEY,
 employee_id INTEGER NULL,
 name VARCHAR,
 CONSTRAINT pass_employee_id FOREIGN KEY (employee_id)
  REFERENCES employees(employee_id)
  ON DELETE NO ACTION ON UPDATE CASCADE
);
INSERT INTO passes(employee_id, name) VALUES (NULL, 'GUEST1');
INSERT INTO passes(employee_id, name) VALUES (NULL, 'GUEST2');
INSERT INTO passes(employee_id, name) VALUES (NULL, 'GUEST3');
INSERT INTO passes(employee_id, name) VALUES (NULL, 'GUEST4');
INSERT INTO passes(employee_id, name) VALUES (NULL, 'GUEST5');
INSERT INTO passes(employee_id, name) VALUES (NULL, 'GUEST6');
INSERT INTO passes(employee_id, name) VALUES (103, 'AHUNOLD');--7
INSERT INTO passes(employee_id, name) VALUES (104, 'BERNST');--8
INSERT INTO passes(employee_id, name) VALUES (107, 'DLORENTZ');--9

DROP TABLE IF EXISTS movement;
CREATE TABLE movement (
 pass_id INTEGER,
 door_id INTEGER,
 date TIMESTAMP
);
SELECT current_date::timestamp;
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');
INSERT INTO movement VALUES (7, 1, '2016-09-21 00:00:00');