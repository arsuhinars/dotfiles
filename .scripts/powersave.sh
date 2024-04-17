#!/bin/sh

POWERSAVE_STATE_PATH="$HOME/.scripts/var/powersave_state"

powersave_get_state() {
  cat $POWERSAVE_STATE_PATH || echo false
}

powersave_set_state() {
  if [[ $1 == true ]]; then
    powersave_enable
  else
    powersave_disable
  fi
}

powersave_enable() {
  hyprctl --batch "\
    keyword decoration:drop_shadow 0;\
    keyword decoration:blur:enabled 0"
  echo true > $POWERSAVE_STATE_PATH
}

powersave_disable() {
  hyprctl reload
  echo false > $POWERSAVE_STATE_PATH
}

powersave_toggle() {
  if [[ $(powersave_get_state) == true ]]; then
    powersave_disable
  else
    powersave_enable
  fi
}

powersave_restore() {
  if [[ $(powersave_get_state) == true ]]; then
    powersave_enable
  fi
}

mkdir -p ~/.scripts/var

case $1 in
  ( get_state ) powersave_get_state;;
  ( set_state ) powersave_set_state $2;;
  ( enable ) powersave_enable;;
  ( disable ) powersave_disable;;
  ( toggle ) powersave_toggle;;
  ( restore ) powersave_restore;;
  ( * ) echo Unknown command;;
esac

