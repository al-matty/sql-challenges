SELECT
    ROUND(
        SUM(CASE WHEN a_tom.event_date IS NOT NULL THEN 1 ELSE 0 END)::numeric /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a_tod
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS min_date
    FROM Activity
    GROUP BY player_id
) f
ON f.player_id = a_tod.player_id
AND f.min_date = a_tod.event_date
LEFT JOIN Activity a_tom
ON a_tom.player_id = a_tod.player_id
AND a_tom.event_date = a_tod.event_date + INTERVAL '1 day'