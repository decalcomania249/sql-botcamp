SELECT p.name AS name
  FROM person p
  JOIN person_order po ON p.id = po.person_id
  JOIN menu m ON m.id = po.menu_id AND m.pizza_name IN ('pepperoni pizza', 'cheese pizza')
 WHERE (p.gender = 'female')
 GROUP BY p.name
HAVING COUNT(DISTINCT m.pizza_name) = 2;