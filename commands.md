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

