SELECT
    "name"
FROM
    "districts"
    JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id";
