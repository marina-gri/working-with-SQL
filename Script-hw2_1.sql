CREATE TABLE IF NOT EXISTS music_genres (
	id_genre SERIAL PRIMARY KEY,
	genre_name VARCHAR
);

CREATE TABLE IF NOT EXISTS musicians (
	id_musician SERIAL PRIMARY KEY,
	musician_name VARCHAR
);

CREATE TABLE IF NOT EXISTS albums (
	id_album SERIAL PRIMARY KEY,
	album_title VARCHAR,
	year_of_release INT
);

CREATE TABLE IF NOT EXISTS tracks (
	id_track SERIAL PRIMARY KEY,
	id_album INT NOT NULL,
	track_title VARCHAR,
	track_duration TIME,
	FOREIGN KEY (id_album) REFERENCES albums(id_album)
);

CREATE TABLE IF NOT EXISTS collections (
	id_collection SERIAL PRIMARY KEY,
	collection_name VARCHAR,
	year_of_release INT
);

CREATE TABLE IF NOT EXISTS musicians_genres (
	id_musician_genre SERIAL PRIMARY KEY,
	id_musician INT NOT NULL,
	id_genre INT NOT NULL,
	FOREIGN KEY (id_musician) REFERENCES musicians(id_musician),
	FOREIGN KEY (id_genre) REFERENCES music_genres(id_genre)
);

CREATE TABLE IF NOT EXISTS albums_musicians (
	id_album_musician SERIAL PRIMARY KEY,
	id_musician INT NOT NULL,
	id_album INT NOT NULL,
	FOREIGN KEY (id_musician) REFERENCES musicians(id_musician),
	FOREIGN KEY (id_album) REFERENCES albums(id_album)
);

CREATE TABLE IF NOT EXISTS tracks_in_collections (
	id_tr_in_collect SERIAL PRIMARY KEY,
	id_track INT NOT NULL,
	id_collection INT NOT NULL,
	FOREIGN KEY (id_track) REFERENCES tracks(id_track),
	FOREIGN KEY (id_collection) REFERENCES collections(id_collection)
);