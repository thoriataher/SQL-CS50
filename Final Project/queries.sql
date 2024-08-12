--INSERTION Queries
INSERT INTO
    users (username, email, password)
VALUES
    ('John Doe', 'Johndoe@gmail.com', 'password123'),
    ('Jane Smith', 'janesmith@gmail.com', 'pass2468'),
    ('Blake wild', 'blakewid@gmail.com', '0103013bb');

INSERT INTO
    artists (name)
VALUES
    ('Gracie Abrams'),
    ('Saint Levant'),
    ('Frank Ocean');

INSERT INTO
    albums (name, artists_id)
VALUES
    ('minor', 1),
    ('DEIRA', 2),
    ('Blonde', 3);

INSERT INTO
    songs (name, duration, artist_id, album_id)
VALUES
    ('I miss you, I am sorry', 251, 1, 1),
    ('Deira', 315, 2, 2),
    ('Pink + White', 304, 3, 3);

INSERT INTO
    playlists (name, user_id)
VALUES
    ('Favorites', 1),
    ('Home', 2),
    ('memories', 3);

INSERT INTO
    playlist_songs (playlist_id, song_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    followers (user_id, artist_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2);

INSERT INTO
    liked_songs (user_id, song_id)
VALUES
    (1, 2),
    (2, 3),
    (3, 1);

--Selection
SELECT
    *
FROM
    `songs`;

SELECT
    `name`
FROM
    `songs`
WHERE
    `id` = 1;

SELECT
    *
FROM
    `songs`
WHERE
    `name` = 'I am miss you, I am sorry';

SELECT
    `name`
FROM
    `songs`
WHERE
    `artist_id` = (
        SELECT
            `id`
        FROM
            `artists`
        WHERE
            `name` = 'Gracie Abrams'
    );

SELECT
    `song_name`
FROM
    `likes`
WHERE
    `username` = 'John Doe';

SELECT
    `song_name`
FROM
    `likes`
WHERE
    `username` = 'Jane Smith';

SELECT
    *
FROM
    `playlists`;

SELECT
    `name`
FROM
    `playlists`
WHERE
    `user_id` = (
        SELECT
            `id`
        FROM
            `users`
        WHERE
            `username` = 'Jane smith'
    );

SELECT
    `songs`.`name`
FROM
    `playlist_songs`
    JOIN `songs` ON `playlist_songs`.`song_id` = `songs`.`id`
WHERE
    `playlist_songs`.`playlist_id` = 1;

SELECT
    *
FROM
    `artists`;

SELECT
    `name`
FROM
    `artists`
WHERE
    `id` = 1;

SELECT
    `albums`.`name`
FROM
    `albums`
    JOIN `artists` ON `albums`.`artist_id` = `artists`.`id`
WHERE
    `artists`.`name` = 'Frank Ocean';

SELECT
    COUNT(*)
FROM
    `songs`
WHERE
    `artist_id` = (
        SELECT
            `id`
        FROM
            `artists`
        WHERE
            `name` = 'Saint Levant'
    );

SELECT
    *
FROM
    `albums`;

SELECT
    `name`
FROM
    `albums`
WHERE
    `id` = 2;

SELECT
    `songs`.`name`
FROM
    `songs`
WHERE
    `album_id` = (
        SELECT
            `id`
        FROM
            `albums`
        WHERE
            `name` = 'minor'
    );

SELECT
    `artists`.`name`
FROM
    `albums`
    JOIN `artists` ON `albums`.`artist_id` = `artists`.`id`
WHERE
    `albums`.`name` = 'Blonde';

SELECT
    `username`
FROM
    `my_followers`
WHERE
    `artist_name` = 'Gracie Abrams';

SELECT
    *
FROM
    `albums`;

SELECT
    `name`
FROM
    `albums`
WHERE
    `id` = 3;

SELECT
    COUNT(song_id)
FROM
    `liked_songs`
WHERE
    `user_id` = (
        SELECT
            `id`
        FROM
            `users`
        WHERE
            `username` = 'John Doe'
    );

SELECT
    `songs`.`name` AS `song_name`,
    `artists`.`name` AS `artist_name`,
    `albums`.`name` AS `album_name`
FROM
    `playlist_songs`
    JOIN `songs` ON `plalist_songs`.`song_id` = `songs`.`id`
    JOIN `artists` ON `songs`.`artist_id` = `artists`.`id`
    JOIN `albums` ON `songs`.`album_id` = `albums`.`id`
WHERE
    `playlist_songs`.`playlist_id` = 1;

SELECT
    `songs`.`name`,
    COUNT(`liked_songs`.`id`) AS `most_liked`
FROM
    `liked_songs`
    JOIN `songs` ON `liked_songs`.`song_id` = `songs`.`id`
GROUP BY
    `songs`.`name`
ORDER BY
    `most_liked` DESC;

--UPDATES
UPDATE `songs`
SET
    `name` = "I miss you, I'm sorry"
WHERE
    `id` = 1;

UPDATE `users`
SET
    `email` = 'johndoe22@gmail.com'
WHERE
    'id' = 1;

UPDATE `playlists`
SET
    `name` = 'nostalgia'
WHERE
    `id` = 3;

UPDATE `artists`
SET
    `name` = 'SaintLevaint'
WHERE
    `id` = 2;

DELETE FROM `songs`
WHERE
    `name` = 'Pink + White';

DELETE FROM `users`
WHERE
    'id' = 3;

DELETE FROM `playlists`
WHERE
    'name' = 'nostalgia';

DELETE FROM `artists`
WHERE
    `name` = 'Frank Ocean';

DELETE FROM `albums`
WHERE
    `id` = 3;

DELETE FROM `followers`
WHERE
    `user_id` = 1
    AND `artist_id` = 1;

DELETE FROM `liked_songs`
WHERE
    `user_id` = 1
    AND `song_id` = 1;
