Pattern : <REST Verb> /<Index>/<Type>/<ID>
----------------------------------------------
PUT /customer/_doc/1?pretty
{
  "name": "John Doe"
}
curl -X PUT "localhost:9200/customer/_doc/1?pretty" -H 'Content-Type: application/json' -d'
{
  "name": "John Doe"
}
'

GET /customer/_doc/1?pretty
curl -X GET "localhost:9200/customer/_doc/1?pretty"

DELETE /customer?pretty
curl -X DELETE "localhost:9200/customer?pretty"

POST /customer/_doc?pretty
{
  "name": "Jane Doe"
}

updating the name 
POST /customer/_doc/1/_update?pretty
{
  "doc": { "name": "Jane Doe" }
}

updating the name and add a new field as age
POST /customer/_doc/1/_update?pretty
{
  "doc": { "name": "Jane Doe", "age": 20 }
}

using script
POST /customer/_doc/1/_update?pretty
{
  "script" : "ctx._source.age += 5"
}


Batch processing
------------------
POST /customer/_doc/_bulk?pretty
{"index":{"_id":"1"}}
{"name": "John Doe" }
{"index":{"_id":"2"}}
{"name": "Jane Doe" }

curl -X POST "localhost:9200/customer/_doc/_bulk?pretty" -H 'Content-Type: application/json' -d'
{"index":{"_id":"1"}}
{"name": "John Doe" }
{"index":{"_id":"2"}}
{"name": "Jane Doe" }
'

POST /customer/_doc/_bulk?pretty
{"update":{"_id":"1"}}
{"doc": { "name": "John Doe becomes Jane Doe" } }
{"delete":{"_id":"2"}}

download from
https://github.com/elastic/elasticsearch/blob/master/docs/src/test/resources/accounts.json?raw=true
curl -H "Content-Type: application/json" -XPOST "localhost:9200/bank/_doc/_bulk?pretty&refresh" --data-binary "@accounts.json"

get _cat/indices?v

GET /bank/_search?q=*&sort=account_number:asc&pretty

GET /bank/_search
{
  "query": { "match_all": {} },
  "sort": [
    { "account_number": "asc" }
  ]
}
