#!/bin/sh
if [[ $PT_iamreallysure == "YES" ]]; then
  if [[ $PT_iamreallyreallysure == "YES" ]]; then
    echo "Killing Java Processes (and not in a nice way... -9)"
    ps ax | grep java | grep -v grep | cut -d" " -f 1 | xargs kill -9 >/dev/null 2>&1 
    echo "Removing everything in /opt/IBM"
    rm -rf /opt/IBM
    echo "Removing wsadmin user (including home directory)"
    rm -rf /home/wsadmin
    userdel wsadmin
    groupdel wsadmins
  else
    echo "You weren't really sure, so we did nothing..."
  fi
else
  echo "You weren't sure, so we weren't sure, so we didn't do anything..."
fi
