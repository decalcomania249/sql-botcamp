(SELECT piz.name AS pizzeria_name
	FROM pizzeria piz
	JOIN person_visits pv ON piz.id = pv.pizzeria_id 
	JOIN person p ON p.id = pv.person_id AND p.name = 'Andrey')

EXCEPT

(SELECT piz.name AS pizzeria_name
	FROM pizzeria piz
	JOIN menu m ON m.pizzeria_id = piz.id
	JOIN person_order po ON po.menu_id = m.id 
	JOIN person p ON p.id = po.person_id AND p.name = 'Andrey')
ORDER BY pizzeria_name;