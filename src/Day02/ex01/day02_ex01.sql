WITH gs AS (
	SELECT generate_series(
	   '2022-01-01 00:00', 
	   '2022-01-10 12:00',
	   interval '1 day')::date AS missing_date)

SELECT DISTINCT missing_date
FROM gs
LEFT JOIN (SELECT visit_date 
		     FROM person_visits 
		    WHERE person_id < 3) pv 
		ON pv.visit_date = gs.missing_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date;