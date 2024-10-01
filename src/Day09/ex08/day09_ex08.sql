CREATE OR REPLACE FUNCTION fnc_fibonacci 
	(pstop INTEGER DEFAULT 10)
RETURNS table(a INTEGER) AS $$
WITH RECURSIVE temp(a, b) AS
	(SELECT 0 AS a, 1 as b
 		UNION ALL
	 SELECT b, a + b FROM temp
 		WHERE b < pstop) 
SELECT a FROM temp;
$$ LANGUAGE sql;

-- select * from fnc_fibonacci();