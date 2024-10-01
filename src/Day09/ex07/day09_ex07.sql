CREATE OR REPLACE FUNCTION func_minimum
	(VARIADIC arr NUMERIC[] DEFAULT '{0}')
RETURNS NUMERIC AS $$
SELECT MIN(val) AS min_value
FROM unnest(arr) val;
$$ LANGUAGE sql;

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
 