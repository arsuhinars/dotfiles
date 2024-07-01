#!/bin/sh

VPN_CONNECTION_NAME="cold_toad"

vpn_get_state() {
  nmcli connection show --active | grep $VPN_CONNECTION_NAME -q && echo true || echo false
}

vpn_set_state() {
  if [[ $1 == true ]]; then
    vpn_enable
  else
    vpn_disable
  fi
}

vpn_enable() {
  nmcli connection up $VPN_CONNECTION_NAME
}

vpn_disable() {
  nmcli connection down $VPN_CONNECTION_NAME
}

vpn_toggle() {
  if [[ $(vpn_get_state) == true ]]; then
    vpn_disable 
  else
    vpn_enable
  fi
}

case $1 in
  ( get_state ) vpn_get_state;;
  ( set_state ) vpn_set_state $2;;
  ( enable ) vpn_enable;;
  ( disable ) vpn_disable;;
  ( toggle ) vpn_toggle;;
  ( * ) echo Unknown command;;
esac

