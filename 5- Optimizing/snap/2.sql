EXPLAIN QUERY PLAN
SELECT
    "expires_timestamp"
FROM
    "messages"
WHERE
    "to_user_id" = (
        SELECT
            "username"
        FROM
            "users"
        WHERE
            "id" = 151
    );
