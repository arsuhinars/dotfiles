#!/bin/sh

MAIN_MONITOR_NAME="HDMI-A-2"
HEADLESS_MONITOR_PROPERTIES="1920x1080,0x0,1.25"
STREAMING_STATE_PATH="/tmp/streaming_state"

find_headless_monitor_name() {
  hyprctl monitors -j --instance 0 | jq '.[] | .name | select(test("^HEADLESS-"))' -r
}

streaming_get_state() {
  cat $STREAMING_STATE_PATH || echo false
}

streaming_begin() {
  hyprctl output create headless --instance 0
  hyprctl keyword monitor $MAIN_MONITOR_NAME,disable --instance 0
  hyprctl --batch "\
    keyword monitor $(find_headless_monitor_name),$HEADLESS_MONITOR_PROPERTIES;\
    keyword workspace r[1-5],monitor:$(find_headless_monitor_name),default:true,persistent:true;\
    dispatch exec sunshine" --instance 0
  hyprctl --instance 0 seterror disable 
}

streaming_end() {
  killall sunshine || echo Unable to kill sunshine
  hyprctl output remove $(find_headless_monitor_name) --instance 0
  hyprctl reload --instance 0
}

mkdir -p ~/.scripts/var

case $1 in
  ( begin ) streaming_begin;;
  ( end ) streaming_end;;
  ( * ) echo Unknown command;;
esac

