SELECT p.name AS name
  FROM person p
  JOIN person_order po ON p.id = po.person_id
  JOIN menu m ON m.id = po.menu_id AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
 WHERE (p.gender = 'male' AND p.address IN ('Moscow', 'Samara'))
ORDER BY name DESC;