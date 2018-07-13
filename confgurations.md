elastic
    config/elasticsearch.yml
        log4j.properties
        jvm.options

logs
logs role policy
size of the lofs
time based role policy

#at runtime we can set some values to take effect
PUT /_cluster/settings
{
  "transient": {
    "logger.org.elasticsearch.transport": "trace"
  }
}

#path.data 
data path
#path.logs
log path
#cluster.name 
node can join when cluster name is mentioned
#node.name
node name by default UUID generated
#network.host
<loopback or hostname>
#discovery.zen.ping.unicast.hosts: 
likely nodes which will be eventually searchable or contactable
Zen discovery
#discovery.zen.minimum_master_nodes
for data loss, minimum master nodes should be mentioned
master eligble nodes along with master forms the cluster
#Quorum - (master_eleigible / 2) + 1

jvm heap dump path
/var/lib/elasticsearch

#System settings
When you change network.host then es knows that we are moving form development to production

#set resource limits
sudo su
ulimit -u 65536

#set maximum open files
/etc/security/limits.conf
elasticsearch - nofile 65536

#set max virtual memory
sysctl -w vm.max_map_count=262144

#Disble all swap files
sudo swapoff -a

#max threads
ulimit -u 4096
/etc/security/limits.conf
- - noproc 4096

Bootstrap check
Heap size check
file descriptor check
#bootstrap.memory_lock
    mlockall
    memlock unlimted
#max number of threads check
    /etc/security/limits.conf nproc 4096
max vm size check
    /etc/security/limits.conf unlimited
#max file size check
    /etc/security/limits.conf fsize unlimited
#max map count check
    sysctl vm.max_map_count=262144
client jvm check
#serial collector check
    -XX:+UseSerialGC
#system call filter check
    bootstrap.system_call_filter-false
#out of memory check
    OnError 
    OnOutOfMemoryError 
Early access check
#G1 GC check
    JDK 8u40
#All permission check
    java.security.AllPermission
