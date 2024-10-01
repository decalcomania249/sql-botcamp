SELECT * 
	FROM person p
   		 CROSS JOIN pizzeria piz
ORDER BY p.id, piz.id;