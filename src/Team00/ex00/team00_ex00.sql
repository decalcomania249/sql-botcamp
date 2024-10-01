CREATE TABLE nodes
( point1 varchar default 'o' not null ,
  point2 varchar default 'o' not null ,
  cost integer not null default 0,
  PRIMARY KEY (point1, point2)
  );


INSERT INTO nodes VALUES ('a', 'b', 10);
INSERT INTO nodes VALUES ('a', 'c', 15);
INSERT INTO nodes VALUES ('a', 'd', 20);
INSERT INTO nodes VALUES ('b', 'a', 10);
INSERT INTO nodes VALUES ('b', 'c', 35);
INSERT INTO nodes VALUES ('b', 'd', 25);
INSERT INTO nodes VALUES ('c', 'a', 15);
INSERT INTO nodes VALUES ('c', 'b', 35);
INSERT INTO nodes VALUES ('c', 'd', 30);
INSERT INTO nodes VALUES ('d', 'a', 20);
INSERT INTO nodes VALUES ('d', 'b', 25);
INSERT INTO nodes VALUES ('d', 'c', 30);


CREATE VIEW f AS (
  WITH RECURSIVE res(total_cost, tour) AS (
  	SELECT 0 AS total_cost,
           ARRAY[point1] AS tour
      FROM   nodes
     WHERE point1 = 'a'
	
    UNION

	  SELECT res.total_cost + n.cost AS total_cost,
           (res.tour || n.point2)::char(1)[]
      FROM nodes n
      JOIN res ON n.point1 = res.tour[array_upper(res.tour, 1)]
     WHERE array_length(res.tour, 1) < 5
	   AND NOT (n.point2 = ANY(res.tour[2:4]))
  )
  SELECT total_cost, tour 
  FROM res
  WHERE array_length(res.tour, 1) = 5 AND res.tour[1] = res.tour[5]);

SELECT * 
FROM f
WHERE f.total_cost = (SELECT MIN(f.total_cost) FROM f)
ORDER BY total_cost ASC, tour ASC;