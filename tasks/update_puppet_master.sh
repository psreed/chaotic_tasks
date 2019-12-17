#!/bin/sh
if [[ -z "${PT_version}" ]]; then
  $PT_version = "latest"
fi

if [[ -z "${PT_url}" ]]; then
  $PT_url = "https://pm.puppetlabs.com/cgi-bin/download.cgi?dist=el&rel=7&arch=x86_64&ver=${PT_version}"
fi

echo "URL: ${PT_url}"