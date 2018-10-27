#!/usr/bin/env bash

oc new-project airsonic-demo \
    --display-name='Airsonic demo' \
    --description='This project aims to depoy an Airsonic demo application on OpenShift'

oc create imagestream airsonic

oc create -f oc/airsonic-build.json
oc start-build airsonic-build --from-dir .

oc apply -f oc/airsonic-deployment.json
oc apply -f oc/airsonic-service.json
oc apply -f oc/airsonic-route.json

