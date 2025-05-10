-- 1. Сначала создаем таблицы без внешних ключей
CREATE TABLE IF NOT EXISTS genre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collection (
    collection_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

-- 2. Создаем таблицу track
CREATE TABLE IF NOT EXISTS track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER REFERENCES album(album_id)
);

-- 3. Создаем связующие таблицы
CREATE TABLE IF NOT EXISTS artist_genre (
    artist_id INTEGER REFERENCES artist(artist_id),
    genre_id INTEGER REFERENCES genre(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS artist_album (
    artist_id INTEGER REFERENCES artist(artist_id),
    album_id INTEGER REFERENCES album(album_id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS collection_track (
    collection_id INTEGER REFERENCES collection(collection_id),
    track_id INTEGER REFERENCES track(track_id),
    PRIMARY KEY (collection_id, track_id)
);
