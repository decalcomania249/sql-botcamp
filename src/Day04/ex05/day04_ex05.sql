CREATE VIEW v_price_with_discount AS
SELECT p.name AS name, m.pizza_name, m.price, 
	   ROUND(m.price - m.price * 0.1)::INTEGER AS discount_price
	FROM person p
	JOIN person_order po ON p.id = po.person_id
	JOIN menu m ON m.id = po.menu_id
ORDER BY p.name, m.pizza_name