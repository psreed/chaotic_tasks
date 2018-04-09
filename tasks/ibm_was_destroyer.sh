#!/bin/sh
if [[ $PT_iamsure == "YES" ]]; then
  if [[ $PT_iamreallysure == "YES" ]]; then
    echo "Removing /opt/IBM"
    rm -rf /opt/IBM
    echo "Removing /var/ibm"
    rm -rf /var/ibm
    echo "Removing wsadmin user (including home directory)"
    rm -rf /home/wsadmin
    userdel wsadmin
    groupdel wsadmins
  else
    echo "You weren't really sure, so we did nothing..."
  fi
  echo "You weren't sure, so we weren't sure, so we didn't do anything..."
fi
