-- 1. Находим самый длинный трек (название и продолжительность)
SELECT title, duration 
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

-- 2. Выбираем треки длительностью от 3.5 минут (210 секунд)
SELECT title, duration
FROM track 
WHERE duration >= 210;

-- 3. Получаем сборники, выпущенные с 2018 по 2020 год включительно
SELECT title
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

-- 4. Находим исполнителей, чье имя состоит из одного слова (не содержит пробелов)
SELECT name
FROM artist
WHERE name NOT LIKE '% %';

-- 5. Ищем треки со словами "мой" или "my" в названии (без учета регистра)
SELECT title
FROM track
WHERE LOWER(title) LIKE '%мой%'
   OR LOWER(title) LIKE '%my%';
