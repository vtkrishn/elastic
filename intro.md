# Installations;

tar -xvf elastic_<**version**>.tar.gz
tar -xvf kibana_<**version**>.tar.gz

edit hostname and port for elastic and kibana in config folders

set ulimit -u accordingly

access end point links
[http://192.168.1.14:9200]()
[http://192.168.1.14:5601/app/kibana]()


curl "http://192.168.1.14:9200"

curl -i -X POST -H "Content-Type:application/json"  -d "{ \"id\" : \"3\", \"name\" : \"vyga\" }" "http://192.168.1.14:9200/bank/account/3"

get /
gives the elastic details

## Basic query
-------------
get _cat will give all management related information

for index information - 
    get _cat/indices?v

cluster information and helth - 
    get _cat/health?v

Node information
    get _cat/nodes?v

All information
get _search

Alias information for the indexes
    get _alias

shards count
    get _count

get _validate/query
---------
Basic index creation

put bank

Response:
{
  "acknowledged": true,
  "shards_acknowledged": true,
  "index": "bank"
}

get bank

Response:
{
  "bank": {
    "aliases": {},
    "mappings": {},
    "settings": {
      "index": {
        "creation_date": "1531379000687",
        "number_of_shards": "5",
        "number_of_replicas": "1",
        "uuid": "1GnVnE2pTgSs9516t1MEhQ",
        "version": {
          "created": "6030199"
        },
        "provided_name": "bank"
      }
    }
  }
}

post bank/account/1
{
  "id" : "1",
  "name" : "vinod"
}

Creates , 1 document

Reponse:
{
  "_index": "bank",
  "_type": "account",
  "_id": "1",
  "_version": 1,
  "result": "created",
  "_shards": {
    "total": 2,
    "successful": 1,
    "failed": 0
  },
  "_seq_no": 0,
  "_primary_term": 1
}

delete bank

Response:
{
  "acknowledged": true
}

get bank/account/_search

Analysis of the words

get bank/_analyze
{
  "tokenizer" : "letter",
  "text" : "vinod"
}

Respoonse
{
  "tokens": [
    {
      "token": "vinod",
      "start_offset": 0,
      "end_offset": 5,
      "type": "word",
      "position": 0
    }
  ]
}

POST /customer/_doc?pretty
{
  "name": "Jane Doe"
}

Response:
{
  "_index": "customer",
  "_type": "_doc",
  "_id": "1uuXjWQBDHQ_mMs7zocU",
  "_version": 1,
  "result": "created",
  "_shards": {
    "total": 2,
    "successful": 1,
    "failed": 0
  },
  "_seq_no": 0,
  "_primary_term": 1
}