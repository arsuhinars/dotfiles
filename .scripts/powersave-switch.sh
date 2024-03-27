#!/bin/sh

POWERSAVE_STATE_PATH=~/.scripts/var/powersave_state
mkdir ~/.scripts/var

if [ $1 = true ]; then
  hyprctl --batch "\
    keyword decoration:drop_shadow 0;\
    keyword decoration:blur:enabled 0"
  echo true > $POWERSAVE_STATE_PATH
else
  hyprctl reload
  echo false > $POWERSAVE_STATE_PATH
fi

