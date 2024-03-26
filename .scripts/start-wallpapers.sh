#!/bin/bash

WALLPAPERS_PATH=~/Pictures/wallpapers
WALLPAPER_TARGET=~/Pictures/active-wallpaper
WALLPAPER_MONITOR=eDP-1

RANDOM_WALLPAPER=$(ls ~/Pictures/wallpapers/ -1 | sort -R | tail -n 1)

rm $WALLPAPER_TARGET
ln $WALLPAPERS_PATH/$RANDOM_WALLPAPER $WALLPAPER_TARGET

hyprpaper &

