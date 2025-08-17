WITH ranked AS (
    SELECT
        *,
        DENSE_RANK() OVER (ORDER BY salary DESC) r
    FROM Employee
    ORDER BY salary DESC    
)
SELECT
    CASE
        WHEN EXISTS (SELECT 1 FROM ranked WHERE r=2)
        THEN (SELECT salary FROM ranked WHERE r=2 LIMIT 1)
        ELSE NULL
    END AS SecondHighestSalary;