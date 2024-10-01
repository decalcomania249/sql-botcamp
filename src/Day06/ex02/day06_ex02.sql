SELECT p.name,
       m.pizza_name,
       m.price,
       (m.price - m.price * (pd.discount) / 100)::REAL AS discount_price,
       piz.name AS pizzeria_name
FROM menu m
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
JOIN pizzeria piz ON m.pizzeria_id = piz.id
JOIN person_discounts pd ON (pd.person_id = po.person_id AND piz.id = pd.pizzeria_id)
ORDER BY p.name ASC, m.pizza_name ASC;
