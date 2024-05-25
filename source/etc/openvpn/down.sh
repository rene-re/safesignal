#!/bin/sh
##
## Replace splash page of captive portal with one, which does not allow internet access,
## deauthenticate existing users AND start nodogsplash (here to disable internet access)
##
/etc/scripts/nds-mode.sh offline

## Remove routing from 192.168.10.0 subnet
ip rule del from "$(uci get safesignal.@device[0].subnet_admin)/24" table 100

## Empty lan routing table
if [ "$( ip route show table 100 | wc -l )" -gt 0 ]; then
  ip route flush table 100;
fi

## Delete rule that every traffic with a certain mark has
## to lookup the usual (non VPN) routing table
ip rule del fwmark 0x100 table 100

## Last step: flush the route cache
ip route flush cache
