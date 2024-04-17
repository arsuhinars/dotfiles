#!/bin/sh

BRIGHTNESS_VALUE_PATH="$HOME/.scripts/var/brightness_value"
SAVE_BRIGHTNESS_VALUE=10

save_brightness() {
  xbacklight -get > $BRIGHTNESS_VALUE_PATH
  xbacklight -set $SAVE_BRIGHTNESS_VALUE
}

restore_brightness() {
  if [[ -e $BRIGHTNESS_VALUE_PATH ]]; then
    xbacklight -set $(cat $BRIGHTNESS_VALUE_PATH)
    rm $BRIGHTNESS_VALUE_PATH
  fi
}

mkdir -p ~/.scripts/var/

case $1 in
  ( save ) save_brightness;;
  ( restore ) restore_brightness;;
  ( * ) echo Unknown command;;
esac

