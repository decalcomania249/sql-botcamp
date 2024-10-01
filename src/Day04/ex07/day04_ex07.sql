INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(pv.id)+ 1
		FROM person_visits pv),
	(SELECT p.id 
		FROM person p
		WHERE p.name = 'Dmitriy'),
	(SELECT piz.id
		FROM pizzeria piz
		WHERE piz.name = 'DoDo Pizza'), 
	'2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats