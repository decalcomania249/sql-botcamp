SELECT * 
FROM f
WHERE f.total_cost = (SELECT MIN(f.total_cost) FROM f) 
	    OR f.total_cost = (SELECT MAX(f.total_cost) FROM f)
ORDER BY total_cost ASC, tour ASC;