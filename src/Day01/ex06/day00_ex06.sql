SELECT DISTINCT po.order_date AS action_date, 
 				 p.name AS person_name
   FROM person_order po
 		JOIN person_visits pv 
 			ON po.order_date = pv.visit_date
		JOIN person p
 			ON po.person_id = p.id
ORDER BY action_date ASC, person_name DESC;