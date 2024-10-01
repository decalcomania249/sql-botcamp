SELECT piz.name AS pizzeria_name
	FROM pizzeria piz
	JOIN menu m ON m.pizzeria_id = piz.id
	JOIN person_order po ON po.menu_id = m.id
	JOIN person p ON p.id = po.person_id
GROUP BY piz.name
HAVING COUNT(CASE WHEN p.gender = 'female' THEN 1 END) > 0
AND COUNT(CASE WHEN p.gender = 'male' THEN 1 END) = 0

UNION

SELECT piz.name AS pizzeria_name
	FROM pizzeria piz
	JOIN menu m ON m.pizzeria_id = piz.id
	JOIN person_order po ON po.menu_id = m.id
	JOIN person p ON p.id = po.person_id
GROUP BY piz.name
HAVING COUNT(CASE WHEN p.gender = 'female' THEN 1 END) = 0
AND COUNT(CASE WHEN p.gender = 'male' THEN 1 END) > 0
ORDER BY pizzeria_name;