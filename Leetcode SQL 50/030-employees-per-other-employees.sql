SELECT
    e.employee_id,
    e.name,
    m.reports_count,
    m.average_age
FROM Employees e
JOIN (
    SELECT
        reports_to AS manager_id,
        ROUND(AVG(age)) AS average_age,
        COUNT(reports_to) AS reports_count
    FROM Employees
    GROUP BY reports_to
) m
ON e.employee_id = m.manager_id
ORDER BY employee_id ASC;