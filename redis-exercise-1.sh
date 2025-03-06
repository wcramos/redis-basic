#!/bin/bash

# Redis connection details
SOURCE_DB="redis-17494.re-cluster1.ps-redislabs.org"
SOURCE_PORT="17494"

REPLICA_DB="redis-11038.re-cluster1.ps-redislabs.org"
REPLICA_PORT="11038"

# Key to store values in Redis
LIST_KEY="numbers"

echo "Inserting numbers 1-100 into source Redis database ($SOURCE_DB:$SOURCE_PORT)..."

# Insert values 1-100 into source Redis database
for i in {1..100}; do
    redis-cli -h $SOURCE_DB -p $SOURCE_PORT LPUSH $LIST_KEY $i
done

echo "Retrieving and printing numbers in reverse order from replica Redis database ($REPLICA_DB:$REPLICA_PORT)..."

# Fetch and print values from the replica database
redis-cli -h $REPLICA_DB -p $REPLICA_PORT LRANGE $LIST_KEY 0 -1
