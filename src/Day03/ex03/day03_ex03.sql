SELECT piz.name AS pizzeria_name
	FROM pizzeria piz
	JOIN person_visits pv ON piz.id = pv.pizzeria_id
	JOIN person p ON pv.person_id = p.id
	GROUP BY piz.name
	HAVING COUNT(CASE WHEN p.gender = 'female' THEN 1 END) 
			!= COUNT(CASE WHEN p.gender = 'male' THEN 1 END)
ORDER BY piz.name;