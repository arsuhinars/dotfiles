#!/bin/sh

MAIN_MONITOR_NAME="HDMI-A-2"
HEADLESS_MONITOR_PROPERTIES="1920x1080,0x0,1.25"

find_headless_monitor_name() {
  hyprctl monitors -j --instance 0 | jq '.[] | .name | select(test("^HEADLESS-"))' -r
}

streaming_start() {
  return

  hyprctl output create headless --instance 0 > /dev/null
  streaming_reconfigure
}

streaming_reconfigure() {
  return

  if [[ -z $(find_headless_monitor_name) ]]; then
    return
  fi

  hyprctl keyword monitor $MAIN_MONITOR_NAME,disable --instance 0 > /dev/null
  hyprctl --batch "\
    keyword monitor $(find_headless_monitor_name),$HEADLESS_MONITOR_PROPERTIES;\
    keyword workspace r[1-5],monitor:$(find_headless_monitor_name),default:true,persistent:true;\
    dispatch dpms on" --instance 0 > /dev/null
  hyprctl --instance 0 seterror disable > /dev/null
}

streaming_stop() {
  return

  hyprctl output remove $(find_headless_monitor_name) --instance 0 > /dev/null
  hyprctl reload --instance 0 > /dev/null
}

case $1 in
  ( start ) streaming_start;;
  ( stop ) streaming_stop;;
  ( update ) streaming_reconfigure;;
  ( * ) echo Unknown command;;
esac

