#!/bin/sh

#Test for docker service
DOCKER=`/usr/bin/which docker 2>/dev/null`
if [ -z $DOCKER ]; then echo "No docker on selected host."; exit 1; fi

#docker stop & remove image
echo "#############################################"
echo "## Images "
echo "#############################################"
docker image list
echo
echo "#############################################"
echo "## Containers "
echo "#############################################"
docker container list
echo
