#!/bin/bash

cd /mnt/d/subji/msa/dataplus/keycloak/storage

/usr/bin/mvn clean install

cp /mnt/d/subji/msa/dataplus/keycloak/storage/target/storage-0.0.1-SNAPSHOT.jar /mnt/d/subji/msa/keycloak-10.0.2/standalone/deployments/custom-user-storage-jpa.jar
