#!/bin/sh

WALLPAPERS_DIRECTORY="$HOME/Pictures/wallpapers"
SWWW_TRANSITIONS="-t fade
-t wipe --transition-angle 45
-t wipe --transition-angle 135
-t any
-t outer"

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
    ( desktop ) swww_wallpaper_change;;
    ( laptop ) ;;
  esac
}

swww_get_random_transition() {
  echo "$TRANSITIONS" | sort -R | tail -n 1 -
}

swww_start() {
  swww-daemon
}

swww_wallpaper_change() {
  swww img $(get_random_wallpaper) $(swww_get_random_transition) --transition-fps=60 -f Mitchell
}

hyprpaper_start() {
  hyprpaper
}

case $1 in
  ( start ) wallpaper_start;;
  ( change ) wallpaper_change;;
  ( * ) echo Unknown command;;
esac

