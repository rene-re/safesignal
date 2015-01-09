#!/bin/sh
##
## Changes the current working mode (e. g. its splash page) of NoDogSplash by 
## setting a specific splash.html (currently offline.html or online.html). 
## NoDogSplash is restarted after the symlink operation to apply the change.
##

## Remove current symlink to splash.html
if [ ! "$1" ]; then
  echo "Error: NDS mode change needs to be called with mode parameter"
  echo "offline or online"
  exit 1
fi

## Do we really change the mode from the current one? If not, exit in peace
if [ "$(uci get safesignal.@splash[0].mode)" = "$1" ]; then
  exit 0
else
  rm -f /etc/nodogsplash/htdocs/splash.html
fi

## Check the parameter and set NDS mode/splash page accordingly
case "$1" in
  
  online)
  ## VPN is online, NDS should serve regular splash page (e. g. called by OpenVPN up-script)
    /etc/scripts/nds-deauth.sh
    ln -s /etc/nodogsplash/online.html /etc/nodogsplash/htdocs/splash.html
    uci set safesignal.@splash[0].mode=online
    logger -t safesignal "NDS: online mode set"
    ;;

  offline)
  ## VPN is offline, no connection to the internet should be possible
    /etc/scripts/nds-deauth.sh
    ln -s /etc/nodogsplash/offline.html /etc/nodogsplash/htdocs/splash.html
    uci set safesignal.@splash[0].mode=offline
    logger -t safesignal "NDS: offline mode set"
    ;;

  *) 
  ## Something is wrong, go offline
    /etc/scripts/nds-deauth.sh
    ln -s /etc/nodogsplash/offline.html /etc/nodogsplash/htdocs/splash.html
    logger -t safesignal "NDS: mode set called with wrong parameter, going offline"
    ;;

esac