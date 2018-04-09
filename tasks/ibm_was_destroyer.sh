#!/bin/sh
if [ "x$PT_iamsure" == "xYES" ]; then
  if [ "x$PT_iamreallysure" == "xYES" ]; then
    rm -rf /opt/IBM
    rm -rf /var/ibm
    rm -rf /home/wsadmin
    userdel wsadmin
    groupdel wsadmins
  fi
fi
