with ranked_orders AS
    (SELECT
        CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END AS is_immediate,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) rn
    FROM Delivery
    )
SELECT
    ROUND(
        100.0 * AVG(CASE WHEN rn = 1 THEN is_immediate END),
        2
    ) AS immediate_percentage
FROM ranked_orders;

