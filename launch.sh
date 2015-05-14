#!/bin/bash

MONITORIX_CONF="/etc/monitorix/monitorix.conf"

if [ ! -z "$MONITORIX_HOST" ]; then
  sed -i -e "s/hostname = /hostname = $MONITORIX_HOST/g" $MONITORIX_CONF
fi

if [ ! -z "$MONITORIX_PORT" ]; then
  sed -i -e "s/port = 8080/port = $MONITORIX_PORT/g" $MONITORIX_CONF
  sed -i -e "s/:8080/:$MONITORIX_PORT/g" $MONITORIX_CONF
fi
 
/usr/bin/monitorix -c /etc/monitorix/monitorix.conf -n
