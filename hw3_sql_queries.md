## Задание-3

1. Количество исполнителей в каждом жанре:
```sql
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM genre g
LEFT JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;
```

2. Количество треков, вошедших в альбомы 2019–2020 годов:
```sql
SELECT COUNT(t.track_id) AS tracks_count
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;
```

3. Средняя продолжительность треков по каждому альбому:
```sql
SELECT a.title AS album_title, 
       AVG(t.duration) AS avg_duration
FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.title
ORDER BY avg_duration DESC;
```

4. Все исполнители, которые не выпустили альбомы в 2020 году:
```sql
SELECT DISTINCT art.name
FROM artist art
WHERE art.artist_id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM artist_album aa
    JOIN album a ON aa.album_id = a.album_id
    WHERE a.release_year = 2020
);
```

5. Названия сборников, в которых присутствует конкретный исполнитель (например, 'Queen'):
```sql
SELECT DISTINCT c.title
FROM collection c
JOIN collection_track ct ON c.collection_id = ct.collection_id
JOIN track t ON ct.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN artist_album aa ON a.album_id = aa.album_id
JOIN artist art ON aa.artist_id = art.artist_id
WHERE art.name = 'Queen';
```
