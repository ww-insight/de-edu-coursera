CREATE TABLE countrystats (country, year, totalbilledamount) AS
  (select country, year, sum(billedamount) from factbilling
    left join dimcustomer on factbilling.customerid = dimcustomer.customerid
    left join dimmonth on factbilling.monthid=dimmonth.monthid
    group by country,year
    )
DATA INITIALLY DEFERRED
REFRESH DEFERRED
MAINTAINED BY SYSTEM
;