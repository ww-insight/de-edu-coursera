--Create an MQT named max_waste_stats using the columns city, stationid, trucktype, and max waste collected.
CREATE TABLE max_waste_stats (CITY, STATIONID, TRUCKTYPE, MAX_WASTECOLLECTED) AS
  (	select CITY, FACTTRIPS.STATIONID, TRUCKTYPE, max(WASTECOLLECTED) as MAX_WASTECOLLECTED from FACTTRIPS
		left join DIMSTATION on FACTTRIPS.STATIONID=DIMSTATION.STATIONID
		left join DIMTRUCK on FACTTRIPS.TRUCKID=DIMTRUCK.TRUCKID
	group by CITY, FACTTRIPS.STATIONID, TRUCKTYPE
  )
DATA INITIALLY DEFERRED
REFRESH DEFERRED
MAINTAINED BY SYSTEM
;

refresh table max_waste_stats;
select * from max_waste_stats;