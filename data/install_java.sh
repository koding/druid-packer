#!/bin/bash

YUM="yum --assumeyes"

$YUM update

JAVA_VERSION=8u92
BUILD_VERSION=b13
JAVA_RPM=jre-$JAVA_VERSION-linux-x64.rpm

# Upgrading system
$YUM upgrade
$YUM install wget
$YUM install tar

# install java
wget --no-cookies --no-check-certificate \
--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/$JAVA_RPM"

yum localinstall -y $JAVA_RPM
rm -rf $JAVA_RPM
yum clean all

alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

echo "export JAVA_HOME=/usr/java/latest" > /etc/profile.d/java.sh
source /etc/profile
