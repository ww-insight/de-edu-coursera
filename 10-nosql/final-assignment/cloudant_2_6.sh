# init cloudant db
curl -X PUT $CLOUDANTURL/movies
curl -X POST $CLOUDANTURL/movies/_bulk_docs -H content-type:application/json -d @movie.json

# Task 2 - Create an index for the “director” key, on the ‘movies’ database using the HTTP API
curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["Director"]
    }
}'

# Task 3 - Write a query to find all movies directed by ‘Richard Gage’ using the HTTP API
curl -X POST $CLOUDANTURL/movies/_find \
-H"Content-Type: application/json" \
-w "%{time_total}" \
-d'{ "selector":
        {
            "Director": "Richard Gage"
        }
    }'

# Task 4 - Create an index for the “title” key, on the ‘movies’ database using the HTTP API
curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["title"]
    }
}'

# Task 5 - Write a query to list only the “year” and “director” keys for the ‘Top Dog’ movies using the HTTP API
curl -X POST $CLOUDANTURL/movies/_find \
-H"Content-Type: application/json" \
-w "%{time_total}" \
-d'{ "selector":
        {
            "title": "Top Dog"
        },
    "fields": [
          "year",
          "Director"
        ]
    }'
# Task 6 - Export the data from the ‘movies’ database into a file named ‘movies.json’
couchexport --url $CLOUDANTURL --db movies --type jsonl > movies.json