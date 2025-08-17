WITH users AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted
)
SELECT
    id,
    COUNT(id) AS num
FROM users
GROUP BY id
ORDER BY COUNT(id) DESC
LIMIT 1;