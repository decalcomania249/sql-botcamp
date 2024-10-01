SELECT p.name AS person_name1,
	   new_p.name AS person_name2,
	   p.address AS common_address
  FROM person p
  JOIN person new_p ON p.address = new_p.address
  WHERE p.address = new_p.address AND p.id > new_p.id
 ORDER BY person_name1, person_name2, common_address;