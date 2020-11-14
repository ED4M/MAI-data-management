db.tags.find().count()
db.tags.find({"tag_name": "Adventure"}).count()
db.tags.aggregate([{$group: {"_id":"$tag_name", "count": {$sum: 1}}}, {$sort: {count: -1}}, {$limit: 3}])
