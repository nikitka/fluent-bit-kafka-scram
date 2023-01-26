# Sample configuration for kafka with enabled SASL and fluent-bit
    
run.sh is manage to build fresh fluent-bit debian package and runs the docker-compose which  
creates zookeeper and kafka instances with enabled SASL. 

## Usage:
```
# Checkout fluent-bit
git submodule update --init

# Build fluent-bit debian package
./build.sh

# run docker compose
docker compose -p fbit-kafka-scram up 

# remove containers
docker compose -p fbit-kafka-scram rm  -f
```