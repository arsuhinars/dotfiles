#!/bin/sh

MAIN_MONITOR_NAME="HDMI-A-2"
HEADLESS_MONITOR_PROPERTIES="1920x1080,0x0,1.25"
STREAMING_STATE_PATH="/tmp/streaming_state"

find_headless_monitor_name() {
  hyprctl monitors -j --instance 0 | jq '.[] | .name | select(test("^HEADLESS-"))' -r
}

streaming_get_state() {
  [[ -e $STREAMING_STATE_PATH ]] && cat $STREAMING_STATE_PATH || echo false
}

streaming_start() {
  if [[ $(streaming_get_state) == true ]]; then
    echo Streaming is already enabled!
    return 0
  fi

  hyprctl output create headless --instance 0 > /dev/null
  hyprctl keyword monitor $MAIN_MONITOR_NAME,disable --instance 0 > /dev/null
  hyprctl --batch "\
    keyword monitor $(find_headless_monitor_name),$HEADLESS_MONITOR_PROPERTIES;\
    keyword workspace r[1-5],monitor:$(find_headless_monitor_name),default:true,persistent:true;\
    dispatch exec sunshine;\
    dispatch dpms on" --instance 0 > /dev/null
  hyprctl --instance 0 seterror disable > /dev/null
  echo true > $STREAMING_STATE_PATH
}

streaming_stop() {
  killall sunshine || echo Unable to kill sunshine
  hyprctl output remove $(find_headless_monitor_name) --instance 0 > /dev/null
  hyprctl reload --instance 0 > /dev/null
  echo false > $STREAMING_STATE_PATH
}

case $1 in
  ( start ) streaming_start;;
  ( stop ) streaming_stop;;
  ( get_state ) streaming_get_state;;
  ( * ) echo Unknown command;;
esac

