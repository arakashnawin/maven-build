#!/bin/bash

echo "Step 1: Update Server --"
apt update

echo "******************************"
echo "Step 2: Set up Wildfly User --"
echo "******************************"
groupadd -r wildfly
useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly

echo "***************************************"
echo "Step 3: Download and Install Wildfly --"
echo "***************************************"

wget https://github.com/wildfly/wildfly/releases/download/25.0.1.Final/wildfly-25.0.1.Final.tar.gz
tar xvf wildfly-25.0.1.Final.tar.gz

mv wildfly-25.0.1.Final /opt/wildfly

chown -RH wildfly: /opt/wildfly

rm wildfly-25.0.1.Final.tar.gz

echo "*******************************************
echo "Step 4: Create Wildfly Application user --"
echo "*******************************************

/opt/wildfly/bin/add-user.sh admin admin

echo "Run the following as root when you want to start wildlfy --"
echo "sudo /opt/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0"


