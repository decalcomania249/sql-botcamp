SELECT piz.name,
 COUNT (po.menu_id) AS count_of_orders,
 ROUND(AVG(price)) AS average_price,
 MAX(price) AS max_price,
 MIN(price) AS min_price
  FROM pizzeria piz
  JOIN menu m ON m.pizzeria_id = piz.id
  JOIN person_order po ON po.menu_id = m.id
  GROUP BY piz.name
  ORDER BY piz.name ASC;