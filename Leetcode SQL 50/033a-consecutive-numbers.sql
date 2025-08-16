WITH n as (
    SELECT
        id,
        num::numeric
    FROM Logs
)
SELECT DISTINCT
    n1.num AS ConsecutiveNums
FROM n n1
LEFT JOIN n n2
ON n1.id + 1 = n2.id
LEFT JOIN n n3
ON n1.id + 2 = n3.id
WHERE n1.num = n2.num
AND n2.num = n3.num;