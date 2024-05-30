SELECT
    "first_name" AS 'Firstname',
    "last_name" AS 'Lastname'
FROM
    "players"
WHERE
    "final_game" BETWEEN '2000-01-01' AND '2000-12-31'
ORDER BY
    "final_game" DESC;
