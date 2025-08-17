WITH ranked_by_department as (
    SELECT
        e.salary AS Salary,
        d.name AS Department,
        e.name AS Employee,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) rank
    FROM Employee e
    LEFT JOIN Department d
    ON d.id = e.departmentId
)
SELECT
    Department,
    Employee,
    Salary
FROM ranked_by_department
WHERE rank < 4
ORDER BY Department ASC, Salary DESC;