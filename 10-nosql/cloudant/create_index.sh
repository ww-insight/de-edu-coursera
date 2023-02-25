curl -X POST $CLOUDANTURL/diamonds/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["price"]
    }
}'

curl -X POST $CLOUDANTURL/diamonds/_find \
-H"Content-Type: application/json" \
-w "%{time_total}"
-d'{ "selector":
        {
            "price":
                {
                    "$gt":345
                }
        }
    }'