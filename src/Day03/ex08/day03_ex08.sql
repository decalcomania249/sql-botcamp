INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
	(SELECT MAX(m.id)+ 1
		FROM menu m), 
	(SELECT piz.id 
		FROM pizzeria piz
		WHERE piz.name = 'Dominos'), 
	'Sicilian pizza', 
	900);	

-- SELECT * FROM menu