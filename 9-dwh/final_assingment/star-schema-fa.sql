-- drop table MyDimDate;
CREATE TABLE MyDimDate(
  DATE_ID integer NOT NULL PRIMARY KEY,
  YEAR smallint NOT NULL,
  QUARTER smallint NOT NULL,
  QUARTER_NAME varchar(2) NOT NULL,
  MONTH smallint NOT NULL,
  MONTH_NAME varchar(10) NOT NULL,
  DAY smallint NOT NULL,
  DAY_OF_WEEK varchar(10) NOT NULL
);

-- drop table MyDimWaste;
CREATE TABLE MyDimWaste(
  WASTE_ID integer NOT NULL PRIMARY KEY,
  WASTE_TYPE varchar(50) NOT NULL
);

-- drop table MyDimZone;
CREATE TABLE MyDimZone(
  ZONE_ID integer NOT NULL PRIMARY KEY,
  ZONE_NAME varchar(20) NOT NULL,
  ZONE_CITY varchar(50) NOT NULL
);

-- drop table MyFactTrips;
CREATE TABLE MyFactTrips(
  TRIP_ID integer not null primary key,
  WASTE_TONS double NOT NULL,
  DATE_ID integer NOT NULL,
  WASTE_ID integer NOT NULL,
  ZONE_ID integer NOT NULL
);

ALTER TABLE MyFactTrips ADD FOREIGN KEY (DATE_ID) REFERENCES MyDimDate (DATE_ID);
ALTER TABLE MyFactTrips ADD FOREIGN KEY (WASTE_ID) REFERENCES MyDimWaste (WASTE_ID);
ALTER TABLE MyFactTrips ADD FOREIGN KEY (ZONE_ID) REFERENCES MyDimZone (ZONE_ID);
