#query
#select * from bank (where rownum=10) by default 10 records
GET /bank/_search
{
  "query": { "match_all": {} }
}

#size
#select * from bank where rownum = 1
GET /bank/_search
{
  "query": { "match_all": {} },
  "size": 1
}

#from
#select * from bank where rownum between 11 to 20 (size 10)
GET /bank/_search
{
  "query": { "match_all": {} },
  "from": 10,
  "size": 10
}

#sort
#select * from bank order by balance desc rownum = 2
GET /bank/_search
{
  "query": { "match_all": {} },
  "sort": { "balance": { "order" : "desc"} },
  "size" : "2"
}
GET /bank/_search
{
  "query": { "match_all": {} },
  "sort": { "balance": "desc" },
  "size" : "2"
}

#select account_number,balance from bank
GET /bank/_search
{
  "query": { "match_all": {} },
  "_source": ["account_number","balance"]
}

#select * from bank where account_number = 20
GET /bank/_search
{
  "query": { "match": { "account_number": 20 } }
}

#select * from bank where upper(address) like upper('%mill%')
#case insensitive search
GET /bank/_search
{
  "query": { "match": { "address": "mill" } }
}

#match
#select * from bank where 
#(upper(address) like upper('%mill%')) or
#(upper(address) like upper('%lane%'))
GET /bank/_search
{
  "query": { "match": { "address": "mill lane" } }
}

#match_phrase
#select * from bank where 
#(upper(address) like upper('%mill lane%'))
GET /bank/_search
{
  "query": { "match_phrase": { "address": "mill lane" } }
}


#bool
#must
#select * from bank where 
#(upper(address) like upper('%mill%')) and
#(upper(address) like upper('%lane%'))
GET /bank/_search
{
  "query": {
    "bool": {
      "must": [
        { "match": { "address": "mill" } },
        { "match": { "address": "lane" } }
      ]
    }
  }
}

#should
#select * from bank where 
#(upper(address) like upper('%mill%')) or
#(upper(address) like upper('%lane%'))
GET /bank/_search
{
  "query": {
    "bool": {
      "should": [
        { "match": { "address": "mill" } },
        { "match": { "address": "lane" } }
      ]
    }
  }
}

#must_not
#select * from bank where 
#(upper(address) not like upper('%mill%')) and
#(upper(address) not like upper('%lane%'))
GET /bank/_search
{
  "query": {
    "bool": {
      "must_not": [
        { "match": { "address": "mill" } },
        { "match": { "address": "lane" } }
      ]
    }
  }
}

#select * from bank where 
#(upper(address) like upper('%mill%')) and
#(upper(address) not like upper('%lane%'))
GET /bank/_search
{
  "query": {
    "bool": {
      "must": [
        { "match": { "age": "40" } }
      ],
      "must_not": [
        { "match": { "state": "ID" } }
      ]
    }
  }
}

Response gives _score for relevance and tells how well the document result matches the query

#filter
#range
#select * from bank where balance is between 20000 and 30000
GET /bank/_search
{
  "query": {
    "bool": {
      "must": { "match_all": {} },
      "filter": {
        "range": {
          "balance": {
            "gte": 20000,
            "lte": 30000
          }
        }
      }
    }
  }
}