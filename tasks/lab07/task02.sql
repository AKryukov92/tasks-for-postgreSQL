SELECT
 country_id
 , country_name
FROM countries
EXCEPT
SELECT
 c.country_id
 , c.country_name
FROM countries c
JOIN locations l
  ON c.country_id = l.country_id;