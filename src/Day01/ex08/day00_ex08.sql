SELECT po.order_date AS order_date, 
 	   CONCAT(p.name, ' (age:', p.age, ')') AS person_information
   FROM person_order po
		NATURAL JOIN (select id as person_id, name, age from person) as p
ORDER BY order_date ASC, person_information ASC;