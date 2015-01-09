#!/bin/sh
##
## Keep NDS running => Restart if necessary
##

## Check if NDS is not running
if [ "$(pidof nodogsplash | wc -w)" = "0" ]; then

  ## Avoid race condition by waiting 2 seconds
  sleep 2

  ## Restart NDS (and check one more time)
  if [ "$(pidof nodogsplash | wc -w)" = "0" ]; then
      /etc/init.d/nodogsplash start
  fi

fi
