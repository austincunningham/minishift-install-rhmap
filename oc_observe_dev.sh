#!/bin/bash
oc secrets new docker-pull-secret .dockerconfigjson=/home/austin/.docker/config.json --namespace=$1 2>/dev/null
if [ $? -eq 0 ]; then
    echo "Created secret in namespace $1" && sleep 3
    oc secrets link default docker-pull-secret --for=pull --namespace=$1
fi
