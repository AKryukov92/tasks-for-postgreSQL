CREATE TABLE jobs_copy
AS
SELECT * FROM jobs;

ALTER TABLE jobs_copy
OWNER TO usera;