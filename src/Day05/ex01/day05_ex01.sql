set enable_seqscan to off;
EXPLAIN ANALYZE 
SELECT m.pizza_name, piz.name
	FROM menu m
	JOIN pizzeria piz ON piz.id = m.pizzeria_id
	
