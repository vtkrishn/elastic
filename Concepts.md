SERVER PART
---------------
Cluster
    Group of nodes - one or more servers
    should have cluster name so that nodes can join the cluster
    default cluster : elasticsearch
    get _cat/master?v

Node
    Single server, part of the cluser to store data
    UUID - name
    get _cat/nodes?v

Shards
    index may take more space which will eventually slow down performance and response time
    so single index is subdvided into shards
    can be configured during index creation
    default - 5 shards per index
    Primary Shards, with one master and others master eligible
    cannot change shards after index creation
    
    get _cat/shards?v
    get _cat/allocation?v
    get _cat/segments?v

Replicas
    is used for fault tolerance and high availabilty
    1 Replica shards

if u create 1 index with 1 node
1 shard with id 0 - 1 primary Shard, 1 replica
1 shard with id 1 - 1 primary Shard, 1 replica
1 shard with id 2 - 1 primary Shard, 1 replica
1 shard with id 3 - 1 primary Shard, 1 replica
1 shard with id 4 - 1 primary Shard, 1 replica

node1
        5 shards, 5 primary,  5 replicas

if u create 1 index with 2 node
node 1
        3 shards, 3 primary,  2 replicas
node 2
        2 shards, 2 primary , 3 replicas

if u create 1 index with 3 node
node 1
        2 shards, 2 primary,  1 replicas
node 2
        2 shards, 2 primary , 1 replicas
node 3
        1 shards, 1 primary , 2 replicas

DATA part
---------------
Index
    Collection of documents
    idetified by a name
    eg. like a table, user index, customer index etc
    get _cat/indices?v

    status yellow: fully functional but no replicas added

Type-deprecated
    Mapping types

Document
    basic unit of data/information
    eg. Row in a table , Single Customer record, Single user record
    get bank/_search


