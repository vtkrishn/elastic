Date math

GET /%3Clogstash-%7Bnow%2Fd%7D%3E/_search
{
  "query" : {
    "match": {
      "test": "data"
    }
  }
}

#formats
<logstash-{now/d}>
<logstash-{now/M}>
<logstash-{now/M{YYYY.MM}}>

#options
?pretty=true
?v
?human=false

#filter_path
GET /_cluster/state?filter_path=routing_table.indices.**.state

GET /_count?filter_path=_shards
{
  "_shards": {
    "total": 10,
    "successful": 10,
    "skipped": 0,
    "failed": 0
  }
}

GET /_count?filter_path=- _shards (to exclude _shard)
{
  "count": 99145
}

GET /_cluster/state?filter_path=metadata.indices.bank.state
{
  "metadata": {
    "indices": {
      "bank": {
        "state": "open"
      }
    }
  }
}


#filter_path
# *  - wildcard
# ** - file path
# - - negation

#Response filtering
POST /library/book?refresh
{"title": "Book #1", "rating": 200.1}
POST /library/book?refresh
{"title": "Book #2", "rating": 1.7}
POST /library/book?refresh
{"title": "Book #3", "rating": 0.1}
GET /_search?filter_path=hits.hits._source&_source=title&sort=rating:desc

get _search?q=bank&filter_path=took,hits.hits._index,hits.hits._id
{
  "took": 52,
  "hits": {
    "hits": [
      {
        "_index": "bank",
        "_id": "50"
      },
      {
        "_index": ".monitoring-es-6-2018.07.13",
        "_id": "XezxkGQBDHQ_mMs7PmON"
      }

#flat_settings
GET bank/_settings?flat_settings=true
{
  "bank": {
    "settings": {
      "index.creation_date": "1531456400621",
      "index.number_of_replicas": "1",
      "index.number_of_shards": "5",
      "index.provided_name": "bank",
      "index.uuid": "y3GKx8SdQ9CawkU_eKW0QA",
      "index.version.created": "6030199"
    }
  }
}

#url based access contol
elasticsearch.yml
rest.action.multi.allow_explicit_index: false