#!/bin/sh
##
## Keep NDS (captive portal) running => Restart if necessary
##

## Check if NDS is not running
if [ "$(pidof nodogsplash | wc -w)" = "0" ]; then

  ## Avoid race condition by waiting 2 seconds
  sleep 2

  ## Check again if NDS is still not running, then restart
  if [ "$(pidof nodogsplash | wc -w)" = "0" ]; then
      /etc/init.d/nodogsplash start
  fi

fi
