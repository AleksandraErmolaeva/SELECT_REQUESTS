CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Performer(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Performer(
    genre_id INTEGER REFERENCES Genre(id),
    performer_id INTEGER REFERENCES Performer(id),
    CONSTRAINT pk1 PRIMARY KEY (genre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS Album(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 1800)
);

CREATE TABLE IF NOT EXISTS Album_Performer(
    album_id INTEGER REFERENCES Album(id),
    performer_id INTEGER REFERENCES Performer(id),
    CONSTRAINT pk2 PRIMARY KEY (album_id, performer_id)
);

CREATE TABLE IF NOT EXISTS Track(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration > 0),
    album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Digest(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 1800)
);

CREATE TABLE IF NOT EXISTS Digest_track(
    track_id INTEGER REFERENCES Track(id),
    digest_id INTEGER REFERENCES Digest(id),
    CONSTRAINT pk3 PRIMARY KEY (track_id, digest_id)
);