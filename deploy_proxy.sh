#!/bin/bash

npm install -g apigeetool

apigeetool deletekvmmap \
    -u $USERNAME \
    -p $PASSWORD \
    -o $ORG \
    -e $1 \
    -n $NAME \
    --mapName "secrets"

apigeetool createkvmmap \
    -u $USERNAME \
    -p $PASSWORD \
    -o $ORG \
    -e $1 \
    -n $NAME \
    --encrypted \
    --mapName "secrets"

apigeetool addEntryToKVM \
    -u $USERNAME \
    -p $PASSWORD \
    -o $ORG \
    -e $1 \
    -n $NAME \
    --mapName "secrets" \
    --entryName "service-account" \
    --entryValue "${SERVICE_ACCOUNT}"

apigeetool deployproxy \
    -u $USERNAME \
    -p $PASSWORD \
    -o $ORG \
    -e $1 \
    -n $NAME \
    -d .