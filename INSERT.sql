INSERT INTO Genre (name)  
VALUES ('rock'),
       ('alternative'),
       ('raggue');

INSERT INTO Performer (name)
VALUES ('Linkin Park'),
       ('Bob Marley'),
       ('Кино'),
       ('The Killers');

INSERT INTO Genre_Performer
VALUES (1,3),
       (2,1),
       (2,4),
       (3,2);

INSERT INTO Album (name, release_year)
VALUES ('Meteora', 2003),
       ('Ночь', 1986),
       ('Imploding the Mirage', 2020),
       ('Catch a Fire',1973),
       ('Hybrid Theory',2000);

INSERT INTO Album_Performer 
VALUES (1,1),
       (2,3),
       (3,4),
       (4,2),
       (5,1);

INSERT INTO Track (name, duration, album_id)
VALUES ('Numb', 188, 1),
       ('Easier to run', 214, 1),
       ('Faint', 162, 1),
       ('Ночь', 331, 2 ),
       ('Мы хотим танцевать', 241, 2),
       ('Последний герой', 137, 2),
       ('My God', 219, 3),
       ('Blowback', 240, 3),
       ('Coution', 270, 3),
       ('400 years', 165, 4),
       ('Stop that train', 235, 4),
       ('No more trouble', 236, 4),
       ('One step closer', 184, 5),
       ('With you', 155, 5),
       ('Crawling', 200, 5),
       ('my own', 170, 1),
       ('own my', 177, 2),
       ('my' 160, 5),
       ('oh my god' 174, 4),
       ('myself', 154, 3)
       ('by myself', 178, 2),
       ('bemy self', 190, 4),
       ('myself by', 145,2),
       ('by myself by', 150, 1),
       ('beemy', 300, 2),
       ('premyne', 275,3);


INSERT INTO Digest (name, release_year)
VALUES ('The best of alternative', 2019),
       ('Positive vibes', 2018),
       ('Legends', 2002),
       ('All you love', 2020),
       ('Лучшее Кино', 2005);


INSERT INTO Digest_Track
VALUES (1,1),
       (2,1),
       (14,1),
       (15,1),
       (5,2),
       (12,2),
       (3,3),
       (4,3),
       (7,3),
       (15,4),
       (13,4),
       (6,4),
       (8,4),
       (4,5),
       (5,5);