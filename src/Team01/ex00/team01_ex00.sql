SELECT COALESCE(us.name, 'not defined') AS name,
	   COALESCE(us.lastname, 'not defined') AS lastname,
	   type,
	   volume,
	   COALESCE(cur.name, 'not defined') AS currency_name,
	   COALESCE((SELECT rate_to_usd
				FROM currency cu
				WHERE cu.id = cur.id AND cu.updated = cur.last_upd), 1) AS last_rate_to_usd,
	   CAST(volume * COALESCE((SELECT rate_to_usd
				FROM currency cu
				WHERE cu.id = cur.id AND cu.updated = cur.last_upd), 1) AS real) AS total_volume_in_usd
FROM "user" us
FULL JOIN (SELECT user_id, SUM(money) AS volume, type, currency_id
		  FROM balance
		  GROUP BY user_id, type, currency_id) AS bal ON user_id = us.id
FULL JOIN (SELECT id, name, MAX(updated) AS last_upd
		  FROM currency
		  GROUP BY id, name) AS cur ON cur.id = currency_id
ORDER BY name DESC, lastname, type;