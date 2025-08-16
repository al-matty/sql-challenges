WITH ranked as (
    SELECT
        employee_id,
        department_id,
        primary_flag,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY primary_flag DESC) AS rn
    FROM Employee
)
SELECT employee_id, department_id
FROM ranked
WHERE rn = 1;