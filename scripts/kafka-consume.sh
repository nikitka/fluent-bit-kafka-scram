#!/bin/bash
set -ex

cub kafka-ready -b kafka-broker:9091 1 90

kafka-console-consumer --topic fb-sink --bootstrap-server "kafka-broker:9091"

