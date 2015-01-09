#!/bin/sh

##
## Deauthenticates every client after a NDS mode change
##

for mac in $(ndsctl status | grep MAC: | awk '{ print $4 }'); do
  ndsctl deauth "$mac"
done
