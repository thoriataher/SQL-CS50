SELECT COUNT(*) AS "No. of prints" FROM "views"
WHERE
        "artist" = 'Hokusai'
AND
        "english_title" LIKE '%Fuji%';
