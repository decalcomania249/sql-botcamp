INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(pv.id)+ 1
		FROM person_visits pv),
	(SELECT p.id 
		FROM person p
		WHERE p.name = 'Denis'),
	(SELECT piz.id 
		FROM pizzeria piz
		WHERE piz.name = 'Dominos'), 
	'2022-02-24');
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(pv.id)+ 1
		FROM person_visits pv),
	(SELECT p.id 
		FROM person p
		WHERE p.name = 'Irina'),
	(SELECT piz.id 
		FROM pizzeria piz
		WHERE piz.name = 'Dominos'), 
	'2022-02-24');	
	
-- SELECT * FROM person_visits