CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Singers (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresSingers (
	genre_id INTEGER NOT NULL REFERENCES Genres(genre_id),
	singer_id INTEGER NOT NULL REFERENCES Singers(singer_id)
	CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(200) NOT null,
	release_date DATE
);

CREATE TABLE IF NOT EXISTS SingersAlbums (
	singer_id INTEGER REFERENCES Singers(singer_id),
	album_id INTEGER REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Songs (
	song_id SERIAL PRIMARY KEY,
	song_name VARCHAR(120) NOT null,
	album_id INTEGER REFERENCES Albums(album_id),
	lasting INTEGER
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(120) NOT null,
	release_date DATE,
	song_id INTEGER NOT NULL REFERENCES Songs(song_id),
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);