WITH weight_sequence AS (
    SELECT
    person_name,
    SUM(weight) OVER (ORDER BY turn ASC) AS total_load
    FROM Queue
)
SELECT
    person_name
FROM weight_sequence w
WHERE w.total_load <= 1000
ORDER BY w.total_load DESC
LIMIT 1;