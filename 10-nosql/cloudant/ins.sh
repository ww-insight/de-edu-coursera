curl -X DELETE $CLOUDANTURL/diamonds
curl -X PUT $CLOUDANTURL/diamonds
curl -X PUT $CLOUDANTURL/diamonds/1 -d '{
    "carat": 0.31,
    "cut": "Ideal",
    "color": "J",
    "clarity": "SI2",
    "depth": 62.2,
    "table": 54,
    "price": 339
  }'

curl -X PUT $CLOUDANTURL/diamonds/2 -d '{
    "carat": 0.2,
    "cut": "Premium",
    "color": "E",
    "clarity": "SI2",
    "depth": 60.2,
    "table": 62,
    "price": 351

  }'

curl -X PUT $CLOUDANTURL/diamonds/3 -d '{
    "carat": 0.32,
    "cut": "Premium",
    "color": "E",
    "clarity": "I1",
    "depth": 60.9,
    "table": 58,
    "price": 342
  }'


curl -X PUT $CLOUDANTURL/diamonds/4 -d '{
    "carat": 0.3,
    "cut": "Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 63.4,
    "table": 54,
    "price": 349
  }'

curl -X PUT $CLOUDANTURL/diamonds/5 -d '{
    "carat": 0.3,
    "cut": "Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 63.8,
    "table": 56,
    "price": 347
  }'

curl -X PUT $CLOUDANTURL/diamonds/6 -d '{
    "carat": 0.3,
    "cut": "Very Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 62.7,
    "table": 59,
    "price": 349
  }'

curl -X PUT $CLOUDANTURL/diamonds/7 -d '{
    "carat": 0.3,
    "cut": "Good",
    "color": "I",
    "clarity": "SI2",
    "depth": 63.3,
    "table": 56,
    "price": 343
  }'

curl -X PUT $CLOUDANTURL/diamonds/8 -d '{
    "carat": 0.23,
    "cut": "Very Good",
    "color": "E",
    "clarity": "VS2",
    "depth": 63.8,
    "table": 55,
    "price": 339
  }'

curl -X PUT $CLOUDANTURL/diamonds/9 -d '{
    "carat": 0.23,
    "cut": "Very Good",
    "color": "H",
    "clarity": "VS1",
    "depth": 61,
    "table": 57,
    "price": 323
  }'

curl -X PUT $CLOUDANTURL/diamonds/10 -d '{
    "carat": 0.31,
    "cut": "Very Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 59.4,
    "table": 62,
    "price": 346
  }'