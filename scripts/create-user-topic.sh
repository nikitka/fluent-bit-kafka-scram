#!/bin/bash
set -ex

cub kafka-ready -b kafka-broker:9091 1 90

kafka-topics --create --partitions 1 --replication-factor 1 --topic fb-sink --bootstrap-server kafka-broker:9091 || echo "already created or other error?"

kafka-configs --bootstrap-server kafka-broker:9091 \
  --alter --add-config 'SCRAM-SHA-512=[password=fluent-bit]' \
  --entity-type users --entity-name fb

nc -l -p 5000

