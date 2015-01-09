#!/bin/sh
##
## Keep OpenVPN running => Restart if necessary
##

## Check if OpenVPN is not running and if offhours are enabled (and OpenVPN thereby turned of)
if [ "$(pidof openvpn | wc -w)" = "0" -a "$(uci get safesignal.@device[0].offhours)" = "false" ]; then

	  ## Avoid race condition by waiting 2 seconds
	  sleep 2

	  ## Restart OpenVPN (and check one more time)
	  if [ "$(pidof openvpn | wc -w)" = "0" -a "$(uci get safesignal.@device[0].offhours)" = "false" ]; then
	      /etc/init.d/openvpn start
	  fi
fi
