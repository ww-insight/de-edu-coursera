# Task 12 - Import ‘partial_data.csv’ into cassandra server into a keyspace named ‘entertainment’ and a table named ‘movies’
CREATE KEYSPACE entertainment WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
use entertainment;

CREATE TABLE movies(
id text PRIMARY KEY,
title text,
year text,
rating text,
director text
);

COPY entertainment.movies(id,title,year,rating,director) FROM 'partial_data.csv' WITH DELIMITER=',' AND HEADER=TRUE;

# Task 13 - Write a cql query to count the number of rows in the ‘movies’ table
select count(*) from movies;

# Task 14 - Create an index for the “rating” column in the ‘movies’ table using cql
create index rating_index on movies(rating);

# Task 15 - Write a cql query to count the number of movies that are rated ‘G’.
select count(*) from movies where rating = 'G' ;