CREATE KEYSPACE training WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
use training;

CREATE TABLE movies(
movie_id int PRIMARY KEY,
movie_name text,
year_of_release int
);

INSERT into movies(movie_id, movie_name, year_of_release) VALUES (1,'Toy Story',1995);
INSERT into movies(movie_id, movie_name, year_of_release) VALUES (2,'Jumanji',1995);
INSERT into movies(movie_id, movie_name, year_of_release) VALUES (3,'Heat',1995);
INSERT into movies(movie_id, movie_name, year_of_release) VALUES (4,'Scream',1995);
INSERT into movies(movie_id, movie_name, year_of_release) VALUES (5,'Fargo',1996);
INSERT into movies(movie_id, movie_name, year_of_release) VALUES (6,'Twister',1997);

--ok
select * from movies;
select movie_name from movies where movie_id = 1;
UPDATE movies SET year_of_release = 1996 WHERE movie_id = 4;
DELETE from movies WHERE movie_id = 5;
UPDATE movies SET year_of_release = 1996 WHERE movie_id = 6;
DELETE from movies WHERE movie_id = 6;

--error
select movie_name from movies where year = 1;