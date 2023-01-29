//Find the total marks for each student across all subjects.
db.marks.aggregate([{"$group":{"_id":"$name","total":{"$sum":"$marks"}}}])

///Find the maximum marks scored in each subject.
db.marks.aggregate([{"$group":{"_id":"$name","max":{"$max":"$marks"}}}])

//Find the minimum marks scored by each student.
db.marks.aggregate([{"$group":{"_id":"$name","min":{"$min":"$marks"}}}])

//Find the top two subjects based on average marks.
db.marks.aggregate([
{
    "$group":{
        "_id":"$subject",
        "average":{"$avg":"$marks"}
        }
},
{
    "$sort":{"average":-1}
},
{
    "$limit":2
}
])