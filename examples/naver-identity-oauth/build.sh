#!/bin/bash

/usr/bin/gradle build

cp /mnt/d/subji/msa/dataplus/keycloak/identity-oauth/build/libs/keycloak-social-naver-0.1.0-ALPHA.jar /mnt/d/subji/msa/dataplus/keycloak/keycloak-10.0.2/standalone/deployments/keycloak-social-naver.jar