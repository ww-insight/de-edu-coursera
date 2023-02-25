wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu1804-x86_64-100.3.1.tgz
tar -xf mongodb-database-tools-ubuntu1804-x86_64-100.3.1.tgz
export PATH=$PATH:/home/project/mongodb-database-tools-ubuntu1804-x86_64-100.3.1/bin
mongoimport -u root -p 1234 --authenticationDatabase admin --db training --collection diamonds --file diamonds.json
mongoexport -u root -p 1234 --authenticationDatabase admin --db training --collection diamonds --out mongodb_exported_data.json
mongoexport -u root -p 1245 --authenticationDatabase admin --db training --collection diamonds --out mongodb_exported_data.csv --type=csv --fields _id,clarity,cut,price
