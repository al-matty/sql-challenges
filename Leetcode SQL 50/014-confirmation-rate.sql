SELECT
	s.user_id,
	COALESCE(c.confirmation_rate, 0) AS confirmation_rate
FROM
	(
WITH t AS (
    SELECT
    user_id,
    SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS n_timeouts,
    COUNT(*) AS n_requests
    FROM Confirmations
    GROUP BY user_id
)
SELECT
    user_id,
    n_timeouts,
    n_requests,
    ROUND(n_timeouts::decimal / n_requests, 2) AS confirmation_rate
FROM t
    ) c

RIGHT JOIN
    Signups AS s
ON s.user_id = c.user_id
ORDER BY confirmation_rate ASC;