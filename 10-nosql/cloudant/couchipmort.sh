npm install -g couchimport@1.4.0
couchimport --version
couchexport --url $CLOUDANTURL --db diamonds --delimiter ","
couchexport --url $CLOUDANTURL --db diamonds --type jsonl
couchexport --url $CLOUDANTURL --db diamonds --type jsonl > diamonds.json
couchexport --url $CLOUDANTURL --db diamonds --delimiter "," > diamonds.csv