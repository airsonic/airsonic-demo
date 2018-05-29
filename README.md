# Airsonic demo site deployment project

This project aims to deploy an Airsonic demo site any [OpenShift](https://www.openshift.org/) platform.

## Deployment instructions

### login to OpenShift

log in to your OpenShift platform using the `oc login` command. 

### Create a new project

Create a new project on OpenShift called (for instance) airsonic-demo

`oc create project aisonic-demo`

### Create project objects

Simply run the `init-project.sh` script. 


