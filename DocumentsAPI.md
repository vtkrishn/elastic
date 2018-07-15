#Reading and writing Documents
Index subdivided into multiple Shards
cannot store in one Node - so make chunks and store in different nodes
Index - >> Multiple Shards ->>  multiple copies
copies - replication
keeping the data in sync - Data replication model

Primary Shard - Master copy
Replica Shard - replicated data

#Write Model
first point of contact on the primary - primary does validation and if accepts then its duty is to replicate the data to others
#routing - 
    index first resolved to replication group( Primary and Replicas )
    operation forward to primary shards
    primary shards does validation and forward to replica, not all but 
        In Sync copies - primary maintains list of shards that should gets replicated data, replica may go offline, Master Node

#Failure Handling
    primary fails , network issue, disk getting corrupted , some configuration mistakes, 
    node hosting the primary will send message to master node - wait for 1 minute for master to promote one of the replica to Primary
    master monitors the health of the node and demotes and promotes when needed
    once the data is saved to primary properly - then its primary should take care of shards
        if shard fails then the failure shard will send message to primary, if in sync replica is having problm the primary says to master to remove that shard
            master will remove the shard also askes other nodes to create a new shard to make the system healthy
    Primary receives reject from replica, then primary contacts master and understands that the primary has be replaced and its no longer a primary
    operation will then be routed to new Primary
    in case of no replica, primary will have the single point of failure

#Read Model
    primary - have backup keeps all shards identical
    Coordinating node - collect , collate and respond to client
    Resolve the read request to - relevant shards 
    take active copy from replication group( Primary and Replicas )
    round robin between shards

#Failure Handline
    if shard fails then looks for different copy in the same replication group
    if multiple shard fails , _search will provide partial data, instead of waiting and delay

#efficient read
    only one read operation per replication group
    due to failure , multiple shards executes same search
    



