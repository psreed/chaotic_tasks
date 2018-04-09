#!/bin/sh
if [ "$PT_iamsure" == "YES" ]; then
  if [ "$PT_iamreallysure" == "YES" ]; then
    rm -rf /opt/IBM
    rm -rf /var/ibm
    rm -rf /home/wsadmin
    userdel wsadmin
    groupdel wsadmins
  fi
fi
