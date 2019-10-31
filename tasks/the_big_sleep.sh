#!/bin/sh
if [[ -z "${PT_length}" ]]; then
  $PT_length = 1800
fi
echo "Sleeping for ${PT_length} seconds"
sleep $PT_length
echo "Done sleeping, task complete."