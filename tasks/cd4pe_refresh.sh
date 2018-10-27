#!/bin/sh

#Test for docker service
if [[ "`/usr/bin/which docker 2>&1 | grep "no docker in"`" =~ "docker" ]]; then 
  echo "No docker on selected host."
  exit 1
fi

#Test for cd4pe container
if [[ "`docker image list | grep puppet/continuous-delivery-for-puppet-enterprise`" =~ "continuous-delivery-for-puppet-enterprise" ]]; then 
  echo "Continuous Delivery for Puppet Enterprise container not found on selected host"
  exit 1
fi

#stop the container
docker stop puppet/continuous-delivery-for-puppet-enterprise

#docker remove image
docker rm puppet/continuous-delivery-for-puppet-enterprise
docker rmi puppet/continuous-delivery-for-puppet-enterprise

#pull latest
docker pull puppet/continuous-delivery-for-puppet-enterprise:latest

#run puppet to start the container
puppet agent -t