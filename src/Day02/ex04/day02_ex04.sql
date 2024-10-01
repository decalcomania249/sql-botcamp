WITH np AS (
	SELECT *
	  FROM menu m
	 WHERE m.pizza_name 
	    IN ('mushroom pizza', 'pepperoni pizza')) 
  
SELECT np.pizza_name,
	   piz.name AS pizzeria_name,
	   np.price AS price
  FROM np

LEFT JOIN pizzeria piz
	   ON np.pizzeria_id = piz.id
	   
ORDER BY pizza_name, pizzeria_name;	   
