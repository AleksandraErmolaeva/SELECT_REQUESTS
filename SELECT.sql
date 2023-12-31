
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
 WHERE name ILIKE 'my'
    OR name ILIKE '% my'
    OR name ILIKE 'my %'
    OR name ILIKE '% my %'
    OR name ILIKE 'мой'
    OR name ILIKE '% мой'
    OR name ILIKE 'мой %'
    OR name ILIKE '% мой %';

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

SELECT p.name FROM Performer p
 WHERE p.name NOT IN (SELECT p.name FROM Performer performer_id
                             JOIN Album_Performer ap 
                             ON p.id = ap.performer_id
                             JOIN Album a 
                             ON a.id = ap.album_id
                       WHERE release_year = 2020
                       );


SELECT d.name FROM Digest d
       JOIN Digest_Track dt 
       ON d.id = dt.digest_id
       JOIN Track t 
       ON dt.track_id = t.id
       JOIN Album_Performer ap 
       ON t.album_id = ap.album_id
       JOIN Performer p 
       ON ap.performer_id = p.id
 WHERE p.name = 'Кино';

-- 4 ЗАДАНИЕ

SELECT DISTINCT a.name FROM Album a
       LEFT JOIN Album_Performer ap 
       ON a.id = ap.album_id
       LEFT JOIN Performer p 
       ON p.id = ap.performer_id
       LEFT JOIN Genre_Performer gp 
       ON p.id = gp.performer_id
 GROUP BY a.name, ap.performer_id
 HAVING COUNT (gp.genre_id) > 1;

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
