# Task 7 - Import ‘movies.json’ into mongodb server into a database named ‘entertainment’ and a collection named ‘movies’
mongoimport -u root -p 1234 --authenticationDatabase admin --db entertainment --collection movies --file movies.json

# Task 8 - Write a mongodb query to find the year in which most number of movies were released
mongo -u root -p 1234 --authenticationDatabase admin local
db.movies.aggregate([
{
    "$group":{
        "_id":"$year",
        "cnt":{"$sum":1}
        }
},
{
    "$sort":{"cnt":-1}
},
{
    "$limit":1
}
])
# Task 9 - Write a mongodb query to find the count of movies released after the year 1999
db.movies.find({year: {$gt: 1999}}).count()

# Task 10. Write a query to find out the average votes for movies released in 2007
db.movies.aggregate([
  { $match: { year: 2007 } },
  { $group: { _id: null, avgVotes: { $avg: "$Votes" } } }
])

# Task 11 - Export the fields _id, “title”, “year”, “rating” and “director” from the ‘movies’ collection into a file named
mongoexport -u root -p 1234 --authenticationDatabase admin \
 --db entertainment --collection movies --out partial_data.csv --type=csv --fields _id,title,year,rating,director