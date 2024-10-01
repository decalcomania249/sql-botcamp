SELECT p.address,
	   piz.name,
	   COUNT(po.person_id) AS count_of_orders
  FROM person_order po
  JOIN person p ON p.id = po.person_id
  JOIN menu m ON m.id = po.menu_id
  JOIN pizzeria piz ON piz.id = m.pizzeria_id
 GROUP BY p.address, piz.name
 ORDER BY p.address, piz.name;