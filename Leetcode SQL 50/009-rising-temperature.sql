SELECT
    w_tod.id
FROM
    Weather AS w_tod
JOIN
    Weather AS w_yest
ON
    DATEADD(day, -1, w_tod.recordDate) = w_yest.recordDate
WHERE
    w_tod.temperature > w_yest.temperature;