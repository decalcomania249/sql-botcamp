(SELECT po.order_date as action_date, 
 		po.person_id AS person_id
   FROM person_order po)

INTERSECT

(SELECT pv.visit_date as action_date, 
 		pv.person_id AS person_id
   FROM person_visits pv)
ORDER BY action_date ASC, person_id DESC;