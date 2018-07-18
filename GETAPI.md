GET twitter/_doc/1
{
  "_index": "twitter",
  "_type": "_doc",
  "_id": "1",
  "_version": 1,
  "found": true,
  "_source": {
    "user": "kimchy",
    "post_date": "2009-11-15T14:12:12",
    "message": "trying out Elasticsearch"
  }
}
GET twitter/_doc/0
{
  "_index": "twitter",
  "_type": "_doc",
  "_id": "0",
  "found": false
}

HEAD twitter/_doc/1
200 OK
HEAD twitter/_doc/0
404 Not found

#Realtime
realtime =false

#Source Filtering
GET twitter/_doc/1?_source=false

GET twitter/_doc/0?_source_include=*.id&_source_exclude=entities

GET twitter/_doc/0?_source=*.id,retweeted

GET twitter/_doc/1/_source

GET twitter/_doc/1/_source?_source_include=*.id&_source_exclude=entities

HEAD twitter/_doc/1/_source

#Stored Fields
PUT twitter
{
   "mappings": {
      "_doc": {
         "properties": {
            "counter": {
               "type": "integer",
               "store": false
            },
            "tags": {
               "type": "keyword",
               "store": true
            }
         }
      }
   }
}

PUT twitter/_doc/1
{
    "counter" : 1,
    "tags" : ["red"]
}