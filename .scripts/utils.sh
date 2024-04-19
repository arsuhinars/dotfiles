#!/bin/sh

get_yadm_class() {
  yadm config --get local.class
}

get_keyboard_layout() {
  hyprctl devices -j | jq -r ".keyboards[] | select(.name == \"$KEYBOARD_DEVICE_NAME\") | .active_keymap"
}

case $(get_yadm_class) in
  ( desktop ) KEYBOARD_DEVICE_NAME="telink-wireless-gaming-keyboard";;
  ( laptop ) KEYBOARD_DEVICE_NAME="at-translated-set-2-keyboard";;
esac

case $1 in
  ( get_yadm_class ) get_yadm_class;;
  ( get_keyboard_layout ) get_keyboard_layout;;
  ( * ) echo Unknown command;;
esac

