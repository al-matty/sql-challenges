(
    SELECT
        u.name AS results
    FROM MovieRating m
    JOIN Users u
    ON m.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(u.user_id) DESC, u.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT
        mdim.title AS results
    FROM MovieRating m
    JOIN Movies mdim
    ON m.movie_id = mdim.movie_id
    WHERE date_trunc('month', created_at)::date = '02-01-2020'::date
    GROUP BY mdim.title
    ORDER BY AVG(m.rating) DESC, mdim.title ASC
    LIMIT 1
);