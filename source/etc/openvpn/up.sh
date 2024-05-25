#!/bin/sh
##
## Set up the routing table on establishing VPN connection
##

## Prepare/Initialize routing table lan 100 (remove any prior entries)
if [ "$( ip route show table 100 | wc -l )" -gt 0 ]; then
        ip route flush table 100;
fi

## Copy main routing table to lan table for source subnet based routing while
## vpn routes are still in its initial state
## Attention: no quotes around $ROUTE
ip route show | grep -Ev ^default | while read ROUTE 
do
  ip route add table 100 $ROUTE
done

## Fix the gateway for lan routing table
ip route add default via "$route_net_gateway" dev "$(uci get safesignal.@device[0].wan_interface)" table 100

## Assign the private subnet to lookup/use the lan table
ip rule del from "$(uci get safesignal.@device[0].subnet_admin)/24" table 100
ip rule add from "$(uci get safesignal.@device[0].subnet_admin)/24" table 100

## Route certain requests with mark 0x100 through WAN interface 
## (see configuration in firewall.user)
ip rule del fwmark 0x100 table 100
ip rule add fwmark 0x100 table 100

## Statically route connection to admin servers through WAN interface
route add -net "$(uci get safesignal.@server[0].ip_1)" netmask 255.255.255.255 gw $route_net_gateway dev "$(uci get safesignal.@device[0].wan_interface)"
route add -net "$(uci get safesignal.@server[0].ip_2)" netmask 255.255.255.255 gw $route_net_gateway dev "$(uci get safesignal.@device[0].wan_interface)"

## Last step: flush the route cache
ip route flush cache

## Set NDS mode to online to allow guest users using the internet
/etc/scripts/nds-mode.sh online
