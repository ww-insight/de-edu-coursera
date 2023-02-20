CREATE KEYSPACE training WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
use training;

CREATE TABLE movies(
movie_id int PRIMARY KEY,
movie_name text,
year_of_release int
);

describe tables;
describe movies;

ALTER TABLE movies ADD genre text;
describe movies;

drop table movies;
describe movies;


CREATE TABLE books(
book_id int PRIMARY KEY,
author text,
title text
);

ALTER TABLE books ADD date_of_publication date;
ALTER TABLE books ADD price decimal;
ALTER TABLE books DROP price;

drop table books ;
drop keyspace training;