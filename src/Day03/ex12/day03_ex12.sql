INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    COALESCE((SELECT MAX(id) FROM person_order), 0) 
	+ generate_series(
		(SELECT MIN(p.id) FROM person p), 
		(SELECT MAX(p.id) FROM person p)
	) AS id,
    generate_series(
        (SELECT MIN(p.id) FROM person p),
        (SELECT MAX(p.id) FROM person p)
    ) AS person_id,
    (SELECT m.id
     FROM menu m
     WHERE m.pizza_name = 'Greek pizza') AS menu_id,
    '2024-02-25' AS order_date;
	
-- SELECT * FROM person_order