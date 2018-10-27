#!/bin/sh

#Test for docker service
DOCKER=`/usr/bin/which docker 2>/dev/null`
if [ -z $DOCKER ]; then echo "No docker on selected host."; exit 1; fi

#docker stop & remove image
IMG=`docker image list | awk '/puppet\/continuous-delivery-for-puppet-enterprise/ {print $3}'`
if [ -z $IMG ]; then echo "Could not get image ID."; echo $IMG; exit 1; fi

CON=`docker container list | awk '/puppet\/continuous-delivery-for-puppet-enterprise/ && /\/sbin\/init/ && /cd4pe/ {print $1}'`
if [ -z $CON ]; then echo "Could not get container ID."; echo $CON; exit 1; fi

C=`docker stop $CON 2>&1`
if [[ "$C" != "$CON" ]]; then 
  echo "Could not stop container for continuous delivery for puppet enterprise."
  echo $CON
  echo $C
  exit 1
fi
I=`docker rmi $IMG 2>&1`
if [[ "$I" != "$IMG" ]]; then 
  echo "Could not remove image for continuous delivery for puppet enterprise container."
  echo $IMG
  echo $I
  exit 1
fi

#pull latest
docker pull puppet/continuous-delivery-for-puppet-enterprise:latest

#run puppet to start the container
puppet agent -t