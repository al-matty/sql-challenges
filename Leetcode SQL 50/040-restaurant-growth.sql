WITH daily as (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT
    visited_on,
        SUM(amount) OVER (
            ORDER BY  visited_on ASC
            RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW
            --ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(
            AVG(amount) OVER (
                ORDER BY visited_on ASC
                RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW
                --ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ),
            2) AS average_amount
FROM daily
OFFSET 6;