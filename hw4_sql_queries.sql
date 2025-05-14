-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title
FROM album a
JOIN artist_album aa ON a.album_id = aa.album_id
JOIN artist art ON aa.artist_id = art.artist_id
JOIN artist_genre ag ON art.artist_id = ag.artist_id
GROUP BY a.title, art.artist_id
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- 2. Наименования треков, которые не входят в сборники
SELECT t.title
FROM track t
LEFT JOIN collection_track ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;

-- 3. Исполнители, написавшие самый короткий трек
SELECT DISTINCT art.name
FROM artist art
JOIN artist_album aa ON art.artist_id = aa.artist_id
JOIN album a ON aa.album_id = a.album_id
JOIN track t ON a.album_id = t.album_id
WHERE t.duration = (
    SELECT MIN(duration)
    FROM track
);

-- 4. Названия альбомов, содержащих наименьшее количество треков
WITH track_counts AS (
    -- Подсчитываем количество треков в каждом альбоме
    SELECT a.album_id, a.title, COUNT(t.track_id) as track_count
    FROM album a
    LEFT JOIN track t ON a.album_id = t.album_id
    GROUP BY a.album_id, a.title
)
-- Выбираем альбомы с минимальным количеством треков
SELECT title
FROM track_counts
WHERE track_count = (
    SELECT MIN(track_count)
    FROM track_counts
);
