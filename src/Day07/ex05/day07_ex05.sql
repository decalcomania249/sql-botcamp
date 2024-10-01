SELECT p.name
  FROM person p
  JOIN person_order po ON po.person_id = p.id
  GROUP BY p.name
  ORDER BY p.name ASC;
