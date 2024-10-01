SELECT m.pizza_name AS pizza_name,
	m.price AS price,
	piz.name AS pizzeria_name
	FROM menu m
	LEFT JOIN person_order po ON m.id = po.menu_id
	JOIN pizzeria piz ON piz.id = m.pizzeria_id
WHERE po.menu_id IS NULL
ORDER BY m.pizza_name, m.price;