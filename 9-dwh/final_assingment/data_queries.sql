--Create a grouping sets query using the columns stationid, trucktype, total waste collected.
select STATIONID, TRUCKTYPE, sum(WASTECOLLECTED) as TOTAL_WASTECOLLECTED from FACTTRIPS
	left join DIMTRUCK on FACTTRIPS.TRUCKID=DIMTRUCK.TRUCKID
group by grouping sets(STATIONID, TRUCKTYPE)
order by STATIONID, TRUCKTYPE
;

--Create a rollup query using the columns year, city, stationid, and total waste collected.
select YEAR, CITY, FACTTRIPS.STATIONID, sum(WASTECOLLECTED) as TOTAL_WASTECOLLECTED from FACTTRIPS
	left join DIMSTATION on FACTTRIPS.STATIONID=DIMSTATION.STATIONID
	left join DIMDATE on FACTTRIPS.DATEID=DIMDATE.DATEID
group by rollup(YEAR, CITY, FACTTRIPS.STATIONID)
order by YEAR, CITY, FACTTRIPS.STATIONID
;

--Create a cube query using the columns year, city, stationid, and average waste collected.
select YEAR, CITY, FACTTRIPS.STATIONID, avg(WASTECOLLECTED) as AVG_WASTECOLLECTED from FACTTRIPS
	left join DIMSTATION on FACTTRIPS.STATIONID=DIMSTATION.STATIONID
	left join DIMDATE on FACTTRIPS.DATEID=DIMDATE.DATEID
group by cube(YEAR, CITY, FACTTRIPS.STATIONID)
order by YEAR, CITY, FACTTRIPS.STATIONID
;
