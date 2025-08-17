SELECT
    s0.id,
    CASE
    WHEN s0.id = (SELECT MAX(id) FROM Seat) AND s0.id % 2 = 1 THEN s0.student
    WHEN s0.id % 2 = 1 THEN s_next.student
    WHEN s0.id % 2 = 0 THEN s_prior.student
    ELSE 'UNHANDLED'
    END AS student
FROM Seat s0
LEFT JOIN Seat s_next
ON s0.id + 1 = s_next.id
LEFT JOIN Seat s_prior
ON s0.id - 1 = s_prior.id
ORDER BY id ASC;