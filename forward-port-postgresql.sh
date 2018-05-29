#!/usr/bin/env bash

POD=`oc get pod | grep postgresql | cut -d' ' -f1`
echo "postgresql pod is ${POD}"

oc port-forward  ${POD}  5432:5432