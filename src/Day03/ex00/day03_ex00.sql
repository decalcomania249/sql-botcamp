SELECT m.pizza_name AS pizza_name,
	m.price AS price,
	piz.name AS pizzeria_name,
	pv.visit_date AS visit_date
	FROM person_visits pv
	JOIN person p ON pv.person_id = p.id AND p.name = 'Kate'
	JOIN pizzeria piz ON piz.id = pv.pizzeria_id
	JOIN menu m ON m.pizzeria_id = piz.id AND (m.price BETWEEN 800 AND 1000)
	ORDER BY pizza_name, price, pizzeria_name;