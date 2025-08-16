WITH offsets AS (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_val1,
        LAG(num, 2) OVER (ORDER BY id) AS prev_val2
        FROM Logs
)
SELECT DISTINCT
    num AS "ConsecutiveNums"
FROM offsets
WHERE num = prev_val1
AND num = prev_val2;