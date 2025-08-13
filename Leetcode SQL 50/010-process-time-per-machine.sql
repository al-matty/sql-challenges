WITH duration_per_process AS (
    SELECT
        machine_id,
        process_id,
        SUM(
            CASE
                WHEN activity_type = 'start' THEN -1 * timestamp
                ELSE timestamp
            END
        ) AS duration
    FROM Activity
    GROUP BY machine_id,process_id
)
SELECT
    machine_id,
    ROUND(AVG(duration), 3) AS processing_time
FROM duration_per_process
GROUP BY machine_id
ORDER BY machine_id ASC;