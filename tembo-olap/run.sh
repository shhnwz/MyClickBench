#!/bin/bash

TRIES=3

cat queries.sql | while read query; do
    echo "$query";
    for i in $(seq 1 $TRIES); do
	    psql postgres://postgres:$PGPASSWORD@org-tembo-test-inst-benchmark4.data-1.use1.tembo.io:5432 -t -c '\timing' -c "$query" | grep 'Time'
    done;
done;
