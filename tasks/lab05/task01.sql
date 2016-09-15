SELECT
 l.location_id
 , l.street_address
 , l.city
 , l.state_province
 , c.country_name
FROM locations l
JOIN countries c
  ON l.country_id = c.country_id;