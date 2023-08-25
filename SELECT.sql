
-- 2 ЗАДАНИЕ

SELECT name, duration FROM Track
 WHERE duration = (SELECT MAX(duration) FROM Track);

SELECT name FROM Track
 WHERE duration >= 210;

SELECT name FROM Digest
 WHERE release_year BETWEEN 2018 AND 2020;

SELECT name FROM Performer
 WHERE name NOT LIKE '% %';

SELECT name FROM Track
 WHERE LOWER(name) LIKE '%мой%' OR LOWER(name) LIKE '%my%';

-- 3 ЗАДАНИЕ

SELECT g.name, COUNT (performer_id) FROM Genre_Performer gp
       JOIN Genre g 
       ON gp.genre_id = g.id
 GROUP BY g.name;

SELECT Count(t.name) FROM Album a
       JOIN Track t 
       ON a.id = t.album_id
 WHERE release_year BETWEEN 2019 AND 2020;

SELECT a.name, AVG(duration) FROM Album a
       JOIN Track t 
       ON a.id = t.album_id
 GROUP BY a.name;

SELECT p.name FROM Album_Performer ap
       JOIN Album a
       ON ap.album_id = a.id
       JOIN Performer p
       ON ap.performer_id = p.id
 WHERE release_year != 2020
 GROUP BY p.name;

SELECT d.name FROM Digest d
       JOIN Digest_Track dt 
       ON d.id = dt.digest_id
       JOIN Track t 
       ON dt.track_id = t.id
       JOIN Album_Performer ap 
       ON t.album_id = ap.performer_id
       JOIN Performer p 
       ON ap.performer_id = p.id
 WHERE p.name = 'Кино';

-- 4 ЗАДАНИЕ

SELECT a.name FROM Album a
       LEFT JOIN Album_Performer ap 
       ON a.id = ap.album_id
       LEFT JOIN Performer p 
       ON p.id = ap.performer_id
       LEFT JOIN Genre_Performer gp 
       ON p.id = gp.performer_id
       LEFT JOIN Genre g 
       ON g.id = gp.genre_id
 GROUP BY a.name
 HAVING COUNT (DISTINCT g.name) > 1 
 ORDER BY a.name;

SELECT t.name FROM Track t
       LEFT JOIN Digest_Track dt 
       ON t.id = dt.track_id
 WHERE dt.digest_id IS NULL;

SELECT p.name, duration FROM Track t
       JOIN Album_Performer ap 
       ON t.album_id = ap.album_id
       JOIN Performer p 
       ON ap.performer_id = p.id
 WHERE duration IN (SELECT MIN(duration) FROM Track);

SELECT DISTINCT a.name FROM Album a
       LEFT JOIN Track t 
       ON t.album_id = a.id
 WHERE t.album_id IN 
       (SELECT album_id FROM TRACK 
	     GROUP BY album_id
		HAVING COUNT(id) = 
               (SELECT COUNT(id) FROM Track 
				 GROUP BY album_id
				 ORDER BY count
				 LIMIT 1)
		);
