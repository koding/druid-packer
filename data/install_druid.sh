#!/bin/bash
set -o errexit

DRUID_VERSION=0.9.1.1

wget -q http://static.druid.io/artifacts/releases/druid-$DRUID_VERSION-bin.tar.gz -O /tmp/druid.tar.gz
tar xfz /tmp/druid.tar.gz -C /opt
mv /opt/druid-* /opt/druid

groupadd -r druid
useradd -g druid -M -r druid

mkdir -p /var/{lib,log}/druid
chown -R druid:druid /var/{lib,log}/druid
chown -R druid:druid /opt/druid
