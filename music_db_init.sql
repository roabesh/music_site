-- Заполняем жанры
INSERT INTO genre (name) VALUES
('Rock'),
('Pop'),
('Jazz'),
('Classical');

-- Заполняем исполнителей
INSERT INTO artist (name) VALUES
('Queen'),
('Michael Jackson'),
('Louis Armstrong'),
('Mozart'),
('Beatles');

-- Заполняем альбомы
INSERT INTO album (title, release_year) VALUES
('A Night at the Opera', 1975),
('Thriller', 1982),
('What a Wonderful World', 1967),
('Symphony No. 40', 1788);

-- Заполняем треки
INSERT INTO track (title, duration, album_id) VALUES
('Bohemian Rhapsody', 354, 1),
('Love of My Life', 219, 1),
('Thriller', 357, 2),
('Billie Jean', 294, 2),
('What a Wonderful World', 140, 3),
('Symphony No. 40 in G minor', 1800, 4),
('Beat It', 258, 2);

-- Заполняем сборники
INSERT INTO collection (title, release_year) VALUES
('Greatest Hits 70s', 1979),
('Best of Pop', 1985),
('Jazz Classics', 1990),
('Classical Masterpieces', 1995);

-- Заполняем связь исполнителей и жанров
INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 1), -- Queen - Rock
(2, 2), -- Michael Jackson - Pop
(3, 3), -- Louis Armstrong - Jazz
(4, 4), -- Mozart - Classical
(5, 1); -- Beatles - Rock

-- Заполняем связь исполнителей и альбомов
INSERT INTO artist_album (artist_id, album_id) VALUES
(1, 1), -- Queen - A Night at the Opera
(2, 2), -- Michael Jackson - Thriller
(3, 3), -- Louis Armstrong - What a Wonderful World
(4, 4); -- Mozart - Symphony No. 40

-- Заполняем связь сборников и треков
INSERT INTO collection_track (collection_id, track_id) VALUES
(1, 1), -- Greatest Hits 70s - Bohemian Rhapsody
(1, 2), -- Greatest Hits 70s - Love of My Life
(2, 3), -- Best of Pop - Thriller
(2, 4), -- Best of Pop - Billie Jean
(3, 5), -- Jazz Classics - What a Wonderful World
(4, 6); -- Classical Masterpieces - Symphony No. 40

-- Корректировка на отсутствие пустых ответов
-- Добавляем новые сборники 2018-2020 годов
INSERT INTO collection (title, release_year) VALUES
('Modern Hits', 2018),
('Best of 2019', 2019),
('Quarantine Songs', 2020);

-- Добавляем новые альбомы 2019-2020 годов
INSERT INTO album (title, release_year) VALUES
('New Album 2019', 2019),
('Pandemic Songs', 2020);

-- Добавляем новые треки для альбомов 2019-2020
INSERT INTO track (title, duration, album_id) VALUES
('New Song 2019', 240, 5), -- для альбома New Album 2019
('Quarantine Blues', 180, 6), -- для альбома Pandemic Songs
('My Isolation', 200, 6); -- дополнительный трек с "my" для запроса

-- Добавляем связи исполнителей с новыми альбомами
INSERT INTO artist_album (artist_id, album_id) VALUES
(2, 5), -- Michael Jackson - New Album 2019
(1, 6); -- Queen - Pandemic Songs

-- Добавляем связи новых треков со сборниками
INSERT INTO collection_track (collection_id, track_id) VALUES
(5, 8), -- Modern Hits - New Song 2019
(6, 9), -- Best of 2019 - Quarantine Blues
(7, 8), -- Quarantine Songs - New Song 2019
(7, 9); -- Quarantine Songs - Quarantine Blues

-- Добавляем дополнительные жанры для исполнителей (для запроса с несколькими жанрами)
INSERT INTO artist_genre (artist_id, genre_id) VALUES
(2, 1), -- Michael Jackson также в жанре Rock
(1, 2); -- Queen также в жанре Pop

-- Добавляем трек не входящий в сборники (для соответствующего запроса)
INSERT INTO track (title, duration, album_id) VALUES
('Lonely Track', 185, 1); -- трек не будет добавлен в collection_track
