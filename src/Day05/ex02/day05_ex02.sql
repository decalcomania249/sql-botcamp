CREATE INDEX idx_person_name ON person(name);

set enable_seqscan to off;
EXPLAIN ANALYZE 
SELECT *
FROM person
WHERE name = 'Andrey'
