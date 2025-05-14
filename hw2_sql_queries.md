## Задание-2
## SQL-запросы для каждого пункта задания:

1. Название и продолжительность самого длительного трека:
```sql
SELECT title, duration 
FROM track 
WHERE duration = (SELECT MAX(duration) FROM track);
```

2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд):
```sql
SELECT title, duration 
FROM track 
WHERE duration >= 210;
```

3. Названия сборников, вышедших в период с 2018 по 2020 год включительно:
```sql
SELECT title 
FROM collection 
WHERE release_year BETWEEN 2018 AND 2020;
```

4. Исполнители, чьё имя состоит из одного слова:
```sql
SELECT name 
FROM artist 
WHERE name NOT LIKE '% %';
```

5. Название треков, которые содержат слово «мой» или «my»:
```sql
SELECT title 
FROM track 
WHERE LOWER(title) LIKE '%мой%' 
   OR LOWER(title) LIKE '%my%';
```
