-- 1. Подсчет количества исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM genre g
LEFT JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

-- 2. Подсчет количества треков из альбомов 2019-2020 годов
SELECT COUNT(t.track_id) AS tracks_count
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Вычисление средней продолжительности треков по альбомам
SELECT a.title AS album_title,
       AVG(t.duration) AS avg_duration
FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.title
ORDER BY avg_duration DESC;

-- 4. Поиск исполнителей без альбомов 2020 года
SELECT DISTINCT art.name
FROM artist art
WHERE art.artist_id NOT IN (
    -- Подзапрос для получения ID исполнителей, выпустивших альбомы в 2020
    SELECT DISTINCT aa.artist_id
    FROM artist_album aa
    JOIN album a ON aa.album_id = a.album_id
    WHERE a.release_year = 2020
);

-- 5. Поиск сборников с треками конкретного исполнителя (Queen)
SELECT DISTINCT c.title
FROM collection c
JOIN collection_track ct ON c.collection_id = ct.collection_id
JOIN track t ON ct.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN artist_album aa ON a.album_id = aa.album_id
JOIN artist art ON aa.artist_id = art.artist_id
WHERE art.name = 'Queen';
