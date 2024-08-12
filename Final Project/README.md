# Design Document

By [Thoria Taher](https://github.com/thoriataher)

## Scope

The database for music player that mimic (Spotify, or Apple Music) that makes people enjoy listening to their favorite songs, follow their favorite artists and keep updating with the most popular songs. As such, included in the database's scope is:

* Users, including basic identifying information
* Songs, including basic identifying information
* Artists, including basic identifying information
* Playlists, including create playlists with specific names and favorite songs
* Playlist_songs, which represent the many-to-many relationship between playlists and songs.
* Albums, including basic identifying information about album created by specific artist.
* Followers, which represent the many-to-many relationship between users and artists they follow.
* Liked_songs, which represent the relationship between users and the songs they liked.
Out of scope are elements like views and indexes attributes.

## Functional Requirements

This database will support:

* insert, select, update and delete users, songs, playlists, albums, artists, followers and liked_songs
* search for a specific song by various criteria such as name, album, and artist, etc.
* Retrieve songs in a playlist, liked_songs by a user, and users following an artist.
* Update user, artist, album, playlists, followers and liked_songs or upated a specific field.
* Delete user, artist, album, playlists, followers and liker_songs or delete a specific field.



## Representation

### Entities

The database includes the following entities:

1. #### Users

The `Users` table includes:

* `id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `username`, which specifies the user's username as `VARCHAR`. A `UNIQUE` constraint ensures no two users have the same username.
* `email`, which specifies the user's email. `VARCHAR` . A `UNIQUE` constraint ensures no two users have the same email.
* `password`, which specifies the user's password. `VARCHAR`. A `UNIQUE` constraint ensures that user is authenticated.

2. #### Songs

The `songs` table includes:

* `id`, which specifies the unique ID for the songs as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the song's  name as `VARCHAR`.
* `duration`, which specifies the song's duration as `INT`.
* `artist_id`, `album_id` , are `FOREIGN KEY` referencing `artists` table on `artist_id`, and `albums` table on `album_id`


3. #### Playlists

The `playlists` table includes:

* `id`, which specifies the unique ID for the playlists as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the playlist's  name as `VARCHAR`.
* `user_id`, is `FOREIGN KEY` referencing `users` table on `user_id` who creates this playlist.

4. #### Artists

The `artists` table includes:

* `id`, which specifies the unique ID for the artists as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the artist's  name as `VARCHAR`.

5. #### Albums

The `Albums` table includes:

* `id`, which specifies the unique ID for the Albums as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the album's  name as `VARCHAR`.
* `artist_id`, is `FOREIGN KEY` referencing `artists` table on `artist_id` who creates the album.

6. #### Playlist_songs

The `playlist_songs` Represents the association between playlists and songs.

The `playlist_songs` table includes:
* `playlist_id`, `song_id` are `PRIMARY KEYS` and also `FOREIGN KEYS` referencing the `playists` table on `playlist_id`and the `songs` table on `song_id`.

7. ### Followers
The `followers` table includes:
* `id`, which specifies the unique ID for the followers as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* ``users_id` , `artist_id`, are `FOREIGN KEY` referencing `users` table on `user_id`, and `artists` table on `artist_id`.

8. ### Liked_Songs
The `liked_songs` table includes:
* `id`, which specifies the unique ID for the liked song as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `user_id` , `song_id`, are `FOREIGN KEY` referencing `users` table on `user_id`, and `songs` table on `song_id`.




### Relationships

![ER Diagram](sample-project/diagram.png)

## Optimizations

* Views: Simplify complex queries, enhance security, and provide a level of abstraction that can make your life much easier such as `likes` view, `my_playlist `view and `album_view`, etc.

* Indexes: Indexes have been created on frequently queried columns such as `username`, `song name`, `artist name`, and `album name` to improve search performance.


