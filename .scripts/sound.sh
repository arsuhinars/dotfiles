#!/bin/sh

get_mute_state() {
  [[ $(pactl get-sink-mute @DEFAULT_SINK@) == "Mute: yes" ]] && echo true || echo false
}

set_mute_state() {
  if [[ $1 == true ]]; then
    mute
  else
    unmute
  fi
}

mute() {
  pactl set-sink-mute @DEFAULT_SINK@ 1
}

unmute() {
  pactl set-sink-mute @DEFAULT_SINK@ 0
}

case $1 in
  ( get_mute_state ) get_mute_state;;
  ( set_mute_state ) set_mute_state $2;;
  ( mute ) mute;;
  ( unmute ) unmute;;
  ( * ) echo Unknown command;;
esac

