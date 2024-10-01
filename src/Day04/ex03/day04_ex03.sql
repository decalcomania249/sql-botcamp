SELECT * FROM v_generated_dates
    AS missing_date
 WHERE generated_date NOT IN (
 		SELECT visit_date FROM person_visits)
ORDER BY missing_date