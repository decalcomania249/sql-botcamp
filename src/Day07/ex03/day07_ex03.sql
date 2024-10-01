WITH temp AS(
	(SELECT piz.name,
	   COUNT (pv.person_id) AS count,
	   'visit' AS action_type
  FROM pizzeria piz
  JOIN person_visits pv ON piz.id = pv.pizzeria_id
  GROUP BY piz.name)
  
UNION ALL 

	(SELECT piz.name,
	   COUNT (po.person_id) AS count,
	   'order' AS action_type
  FROM person_order po
  JOIN menu m ON po.menu_id = m.id
  JOIN pizzeria piz ON piz.id = m.pizzeria_id
  GROUP BY piz.name))
		 
SELECT temp.name,
		SUM(temp.count) AS total_count
  FROM temp
  GROUP BY temp.name
  ORDER BY total_count DESC,
  		   name ASC;