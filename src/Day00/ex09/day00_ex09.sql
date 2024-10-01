SELECT (SELECT p.name FROM person p WHERE p.id = pv.person_id) AS person_name ,  -- this is an internal query in a main SELECT clause
        (SELECT piz.name FROM pizzeria piz WHERE piz.id = pv.pizzeria_id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT * FROM person_visits pv WHERE (pv.visit_date BETWEEN '2022-01-07' AND '2022-01-09')) AS pv -- this is an internal query in a main FROM clause
ORDER BY person_name ASC, pizzeria_name DESC