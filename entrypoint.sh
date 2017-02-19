#!/bin/bash

set -e

if [ "$1" = "start-service" ]; then
    echo "
verbose=${DDCLIENT_CONF_VERBOSE:-yes}
foreground=yes
daemon=${DDCLIENT_CONF_DAEMON:-1800}
ssl=${DDCLIENT_CONF_SSL:-yes}

use=${DDCLIENT_CONF_USE:-web}
web=${DDCLIENT_CONF_WEB:-https://dynamicdns.park-your-domain.com/getip}

protocol=${DDCLIENT_CONF_PROTOCOL:?'DDCLIENT_CONF_PROTOCOL is required'}
server=${DDCLIENT_CONF_SERVER:?'DDCLIENT_CONF_SERVER is required'}
login=${DDCLIENT_CONF_LOGIN:?'DDCLIENT_CONF_LOGIN is required'}
password=${DDCLIENT_CONF_PASSWORD:?'DDCLIENT_CONF_PASSWORD is required'}
${DDCLIENT_CONF_HOST:-@}" > /etc/ddclient.conf

    # Additional configurations can be specified
    for n in {1..100}; do
      if [[ -n $(eval echo \$\{DDCLIENT_CONF_CONF_${n}\}) ]]; then
        sh -c "echo $(eval echo \$\{DDCLIENT_CONF_CONF_${n}\}) >> /etc/ddclient.conf" 
      else
        # We do not want to iterate all, if one in the sequence is not set
        break
      fi
    done

    /usr/sbin/ddclient
else
    "$@"
fi