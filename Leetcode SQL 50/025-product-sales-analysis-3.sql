SELECT
    s.product_id,
    t.first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN
(
    SELECT
        product_id,
        MIN(year) AS first_year
        From Sales
        GROUP BY product_id
) t
ON s.product_id = t.product_id
AND s.year = t.first_year