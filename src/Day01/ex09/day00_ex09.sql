SELECT piz.name AS pizzeria
  FROM pizzeria piz
   WHERE piz.id NOT IN 
		(SELECT pv.pizzeria_id 
		   FROM person_visits pv);
		   
SELECT piz.name AS pizzeria
  FROM pizzeria piz
   WHERE NOT EXISTS 
		(SELECT pv.pizzeria_id 
		   FROM person_visits pv
		  WHERE piz.id = pv.pizzeria_id);