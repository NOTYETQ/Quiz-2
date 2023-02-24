DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS trackss;

CREATE TABLE albums(
album_id serial PRIMARY KEY,
title text NOT NULL
);

CREATE TABLE tracks(
track_id serial PRIMARY KEY,    
album_id integer REFERENCES albums(album_id),
title text NOT NULL,
length int NOT NULL
);

INSERT INTO albums(title)
VALUES ('Album 1'),
('Album 2'),
('Album 3'),
('Album 4'),
('Album 5'),
('Album 6'),
('Album 7'),
('Album 8'),
('Album 9'),
('Album 10');

INSERT INTO tracks(album_id, title, length)
VALUES (1, 'track 1', 3),
(2, 'track 2', 3),
(3, 'track 3', 3),
(4, 'track 4', 4),
(5, 'track 5', 1),
(6, 'track 6', 3),
(7, 'track 7', 5),
(8, 'track 8', 3),
(9, 'track 9', 2),
(10, 'track 10', 3);

SELECT A.title, T.title, T.length
FROM albums AS A
INNER JOIN tracks AS T
ON A.album_id = T.album_id;

SELECT T.title, A.title
FROM tracks AS T
INNER JOIN albums AS A
ON T.album_id = A.album_id;

SELECT A.title, COUNT(T.track_id)
FROM albums AS A
LEFT JOIN tracks AS T
ON A.album_id = T.album_id
GROUP BY A.album_id;

SELECT T.title, COUNT(A.album_id)
FROM tracks AS T
LEFT JOIN albums AS A
ON A.album_id = T.album_id
WHERE T.title = 'track 4'
GROUP BY T.track_id;




















