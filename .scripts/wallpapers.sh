#!/bin/sh

WALLPAPERS_DIRECTORY="$HOME/Pictures/wallpapers"
SWWW_TRANSITIONS="-t fade
-t wipe --transition-angle 45
-t wipe --transition-angle 135
-t any
-t outer"
HYPRPAPER_MONITOR="eDP-1"

get_random_wallpaper() {
  find $WALLPAPERS_DIRECTORY -type f | sort -R | tail -n 1 -
}

wallpaper_start() {
  case $(yadm config --get local.class) in
    ( desktop ) swww_start;;
    ( laptop ) hyprpaper_start;;
  esac
}

wallpaper_change() {
  case $(yadm config --get local.class) in
    ( desktop ) swww_wallpaper_change $1;;
    ( laptop ) hyprpaper_wallpaper_change $1;;
  esac
}

swww_get_random_transition() {
  echo "$SWWW_TRANSITIONS" | sort -R | tail -n 1 -
}

swww_start() {
  swww-daemon
}

swww_wallpaper_change() {
  WALLPAPER_PATH="$([[ -z $1 ]] && get_random_wallpaper || echo $1)"
  swww img $WALLPAPER_PATH $(swww_get_random_transition) --transition-fps=60 --transition-step 60 -f Mitchell
}

hyprpaper_wallpaper_change() {
  WALLPAPER_PATH="$([[ -z $1 ]] && get_random_wallpaper || echo $1)"
  hyprctl hyprpaper preload $WALLPAPER_PATH
  hyprctl hyprpaper wallpaper "$HYPRPAPER_MONITOR,$WALLPAPER_PATH"
  sleep 0.1
  hyprctl hyprpaper unload all
}

hyprpaper_start() {
  hyprctl dispatch exec hyprpaper
  wallpaper_change
}

case $1 in
  ( start ) wallpaper_start;;
  ( change ) wallpaper_change $2;;
  ( * ) echo Unknown command;;
esac

