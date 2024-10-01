SELECT m.pizza_name AS pizza 
	FROM menu m
	
UNION
		
SELECT m.pizza_name AS pizza 
	FROM menu m

ORDER BY pizza DESC;