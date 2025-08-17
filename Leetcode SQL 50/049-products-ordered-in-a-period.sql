WITH feb_sales as (
    SELECT
        product_id,
        SUM(unit) AS unit
    FROM Orders
    WHERE order_date >= DATE '02-01-2020'
    AND order_date < DATE '03-01-2020'
    GROUP BY product_id
)
SELECT
    p.product_name,
    f.unit
    FROM feb_sales f
JOIN Products p
ON f.product_id = p.product_id
WHERE unit >= 100;