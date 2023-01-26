#!/bin/bash
set -ex

# install fluent-bit dependencies
apt-get update && apt-get install -y --no-install-recommends netcat-traditional libldap-2.4-2 libldap-common libpq5 libsasl2-2 libsasl2-modules libsasl2-modules-db libyaml-0-2

dpkg -i /tmp/packages/*.deb

# wait for user creating finish
while ! nc -z create-topic-user 5000; do
  sleep 0.3
done

/opt/fluent-bit/bin/fluent-bit -c /conf/fluent-bit.conf

