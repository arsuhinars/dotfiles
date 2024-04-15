#!/bin/sh

gamemode_enable() {
  hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword decoration:drop_shadow 0;\
    keyword decoration:blur:enabled 0;\
    keyword general:gaps_in 0;\
    keyword general:gaps_out 0;\
    keyword general:border_size 1;\
    keyword decoration:rounding 0"
  notify-send "Gamemode enabled" -i applications-games -a gamemode
}

gamemode_disable() {
  hyprctl reload
  notify-send "Gamemode disabled" -i applications-games -a gamemode
}

case $1 in
  ( enable ) gamemode_enable;;
  ( disable ) gamemode_disable;;
  ( * ) echo Unknown command;;
esac

