SELECT
    employee_id
FROM Employees e
JOIN
(
    SELECT DISTINCT manager_id FROM Employees
    EXCEPT
    SELECT DISTINCT employee_id FROM Employees
    EXCEPT
    SELECT NULL
) m
ON m.manager_id = e.manager_id
WHERE e.salary < 30000
ORDER BY employee_id ASC;