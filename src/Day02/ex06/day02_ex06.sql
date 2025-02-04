SELECT m.pizza_name AS pizza_name,
	   piz.name AS pizzeria_name 
	FROM person_order po
	JOIN person p ON po.person_id = p.id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria piz ON m.pizzeria_id = piz.id
	WHERE p.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name 