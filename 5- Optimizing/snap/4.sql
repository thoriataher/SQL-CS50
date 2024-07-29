EXPLAIN QUERY PLAN
SELECT
    "u"."username"
FROM
    "users" "u"
    JOIN "messages" "m" ON "u"."id" = "m"."to_user_id"
GROUP BY
    "u"."id",
    "u"."username"
ORDER BY
    COUNT("m"."id") DESC
LIMIT
    1;
