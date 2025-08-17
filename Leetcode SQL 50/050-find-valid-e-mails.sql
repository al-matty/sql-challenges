WITH flags as (
    SELECT
        *,
        REGEXP_LIKE(mail, '^[a-zA-Z0-9_.-]+@leetcode\.com$') AS prefix_test,
        REGEXP_LIKE(mail, '^[a-zA-Z]') AS starting_letter_test
    FROM
        Users
)
SELECT
    user_id,
    name,
    mail
FROM flags
WHERE prefix_test AND starting_letter_test;