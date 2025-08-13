SELECT
    e.name,
    b.bonus
FROM Employee AS e
LEFT JOIN bonus AS b
ON e.empId = b.empId
WHERE COALESCE(b.bonus, 0) < 1000;