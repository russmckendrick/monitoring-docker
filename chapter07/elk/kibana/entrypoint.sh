#!/usr/bin/env bash

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Stalling for Elasticsearch"
while true; do
    nc -q 1 elasticsearch 9200 2>/dev/null && break
    echo "Elasticsearch not ready yeat, waiting."
    sleep 1
done

echo "Starting Kibana"
kibana
