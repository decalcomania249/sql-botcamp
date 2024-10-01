WITH piz_price AS(
	SELECT m.pizza_name,
		   piz.name as name,
	       m.price
	FROM menu m
	JOIN pizzeria piz ON m.pizzeria_id = piz.id
)

SELECT pp1.pizza_name AS pizza_name,
 	   pp1.name AS pizzeria_name_1,
	   pp2.name AS pizzeria_name_2,
 	   pp1.price AS price
  FROM piz_price pp1
  JOIN piz_price pp2 ON pp1.pizza_name = pp2.pizza_name
  					AND pp1.price = pp2.price
					AND pp1.name < pp2.name
ORDER BY pizza_name;