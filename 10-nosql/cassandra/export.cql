CREATE KEYSPACE training WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
use training;

CREATE TABLE diamonds(
id int PRIMARY KEY,
clarity text,
cut text,
price int
);

COPY training.diamonds(id,clarity,cut,price) FROM 'mongodb_exported_data.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY diamonds TO 'cassandra-diamonds.csv';

create index price_index on diamonds(price);