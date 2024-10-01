WITH max_min AS (
	SELECT bal.user_id, 
		   bal.money, 
		   bal.currency_id,
  		   CASE
    			WHEN (SELECT MAX(cur.updated) FROM currency cur 
					  		 WHERE bal.currency_id=cur.id 
					  			AND cur.updated<=bal.updated) IS NOT NULL
    			THEN (SELECT MAX(cur.updated) FROM currency cur
					  		 WHERE bal.currency_id=cur.id 
					  			AND cur.updated<=bal.updated)
    			ELSE (SELECT MIN(cur.updated) FROM currency cur 
					  		 WHERE bal.currency_id=cur.id 
					  			AND cur.updated>bal.updated)
  		   END AS real_updated
	FROM balance bal
)

SELECT COALESCE(us.name, 'not defined') AS name,
       COALESCE(us.lastname, 'not defined') AS lastname,
       cur.name AS currency_name,
       mm.money * cur.rate_to_usd AS currency_in_usd
FROM max_min mm
JOIN currency cur ON mm.real_updated=cur.updated AND mm.currency_id=cur.id
LEFT JOIN "user" us ON mm.user_id=us.id
ORDER BY name DESC, lastname, currency_name;