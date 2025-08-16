WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary'
    UNION
    SELECT 'High Salary'
)
SELECT
    c.category,
    COALESCE(COUNT(t.category), 0) AS accounts_count
FROM (
    SELECT
        account_id,
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income > 50000 THEN 'High Salary'
            ELSE 'Average Salary'
        END AS category
    FROM Accounts
    ) t
RIGHT JOIN categories c
ON t.category = c.category
GROUP BY c.category;