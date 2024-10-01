WITH temp AS(
	SELECT po.person_id,
		   m.pizzeria_id,
		   CASE 
			   WHEN (COUNT(m.pizzeria_id) = 1) 
					THEN 10.5
			   WHEN (COUNT(m.pizzeria_id) = 2) 
					THEN 22
			   ELSE 30
		   END AS discount
  	  FROM person_order po
	  	   JOIN menu m ON m.id = po.menu_id
	  GROUP BY po.person_id, m.pizzeria_id
		ORDER BY 1)
	
  
INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
	SELECT ROW_NUMBER() OVER () AS id,
			temp.person_id,
			temp.pizzeria_id,
			temp.discount
			FROM temp