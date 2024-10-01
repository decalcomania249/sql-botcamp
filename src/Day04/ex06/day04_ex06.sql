CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT piz.name AS pizzeria_name 
	FROM person_visits pv
	JOIN person p 
	ON pv.person_id = p.id AND p.name = ('Dmitriy')
	JOIN menu m 
	ON m.pizzeria_id = pv.pizzeria_id AND price < 800
	JOIN pizzeria piz 
	ON piz.id = pv.pizzeria_id AND pv.visit_date = '2022-01-08';
