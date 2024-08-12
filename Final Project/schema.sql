CREATE TABLE
    IF NOT EXISTS `users` (
        `id` INT AUTO_INCREMENT,
        `username` VARCHAR(32) NOT NULL,
        `email` VARCHAR(128) NOT NULL,
        `password` VARCHAR(128),
        PRIMARY KEY (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `songs` (
        `id` INT AUTO_INCREMENT,
        `name` VARCHAR(64) NOT NULL,
        `duration` INT NOT NULL,
        `artist_id` INT,
        `album_id` INT,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
        FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `playlists` (
        `id` INT AUTO_INCREMENT,
        `name` VARCHAR(32) NOT NULL,
        `user_id` INT,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `playlist_songs` (
        `playlist_id` INT,
        `song_id` INT,
        PRIMARY KEY (`playlist_id`, `song_id`),
        FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`),
        FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `artists` (
        `id` INT AUTO_INCREMENT,
        `name` VARCHAR(32) NOT NULL,
        PRIMARY KEY (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `albums` (
        `id` INT AUTO_INCREMENT,
        `name` VARCHAR(64) NOT NULL,
        `artist_id` INT,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `followers` (
        `id` INT AUTO_INCREMENT,
        `user_id` INT,
        `artist_id` INT,
        PRIMARY KEY (`user_id`, `artist_id`),
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
        FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
    )
CREATE TABLE
    IF NOT EXISTS `liked_songs` (
        `id` INT AUTO_INCREMENT,
        `user_id` INT,
        `song_id` INT,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
        FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
    )
    --create VIEWS
CREATE VIEW
    `likes` AS
SELECT
    users.usernameAS username,
    sGROUP_CONCAT (
        songs.name
        ORDER BY
            songs.name ASC SEPARATOR ', '
    ) AS song_name
FROM
    users
    JOIN `liked_songs` ON `songs`.`id` = `liked_songs`.`song_id`
    JOIN `users` ON `users`.`id` = `liked_songs`.`user_id`
GROUP BY
    users.username;

CREATE VIEW
    `my_playlists` AS
SELECT
    users.username AS username,
    playlists.name AS playlist_name
FROM
    playlists
    JOIN `users` ON `users`.`id` = `playlists`.`user_id`;

CREATE VIEW
    `my_followers` AS
SELECT
    users.username AS username,
    artists.name AS artist_name
FROM
    users
    JOIN `followers` ON `users`.`id` = `followers`.`user_id`
    JOIN `artists` ON `artists`.`id` = `followers`.`artist_id`;

CREATE VIEW
    `album_view` AS
SELECT
    albums.name AS album_name,
    GROUP_CONCAT (
        songs.name
        ORDER BY
            songs.name ASC SEPARATOR ', '
    )
FROM
    songs
    JOIN `albums` ON `songs`.`album_id` = `albums`.`id`
GROUP BY
    `albums`.`name`;

CREATE VIEW
    `songs_by` AS
SELECT
    artists.name AS artists_name,
    GROUP_CONCAT (
        songs.name
        ORDER BY
            songs.name ASC SEPARATOR ', '
    ) AS song_name
FROM
    songs
    JOIN `artists` ON `songs`.`artist_id` = `artists`.`id`
GROUP BY
    `artists`.`name`;

CREATE VIEW
    `liked_playlist` AS
SELECT
    playlists.name AS playlist_name,
    GROUP_CONCAT (
        songs.name
        ORDER BY
            songs.name ASC SEPARATOR ', '
    ) AS song_name
FROM
    playlists
    JOIN `playlist_songs` ON `playlists`.`id` = `playlist_songs`.`playlist_id`
    JOIN `songs` ON `songs`.`id` = `playlist_songs`.`song_id`
GROUP BY
    playlists.name;

CREATE VIEW
    `albums_by` AS
SELECT
    artists.name AS artist_name,
    GROUP_CONCAT (
        albums.name
        ORDER BY
            albums.name ASC SEPARATOR ', '
    ) AS album_name
FROM
    albums
    JOIN `artists` ON `artists`.`id` = `albums`.`artist_id`
GROUP BY
    artists.name;

-- Create indexes to speed common searches
CREATE INDEX `user_index` ON `users` (`username`);

CREATE INDEX `song_index` ON `songs` (`name`);

CREATE INDEX `artist_index` ON `artists` (`name`);

CREATE INDEX `playlist_index` ON `playlists` (`name`);

CREATE INDEX `album_index` ON `albums` (`name`);
