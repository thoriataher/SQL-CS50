SELECT "contrast" AS "color_contrast"
FROM
    "views"
WHERE
    "artist" = 'Hokusai'
ORDER BY
    "brightness" DESC
LIMIT
    10;
