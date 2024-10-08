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

set_wallpaper_file() {
  ln -fs $1 ~/Pictures/active-wallpaper
  magick $1 -size 1280x720 -blur 50x16 ~/Pictures/active-wallpaper-blurred.png
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
    ( laptop ) hyprpaper_wallpaper_change;;
  esac
}

swww_get_random_transition() {
  echo "$SWWW_TRANSITIONS" | sort -R | tail -n 1 -
}

swww_start() {
  swww-daemon
}

swww_wallpaper_change() {
  WALLPAPER_PATH="$(get_random_wallpaper)"
  swww img $WALLPAPER_PATH $(swww_get_random_transition) --transition-fps=60 --transition-step 60 -f Mitchell
  set_wallpaper_file $WALLPAPER_PATH
}

hyprpaper_wallpaper_change() {
  WALLPAPER_PATH="$(get_random_wallpaper)"
  hyprctl hyprpaper preload $WALLPAPER_PATH
  hyprctl hyprpaper wallpaper "$HYPRPAPER_MONITOR,$WALLPAPER_PATH"
  sleep 0.1
  hyprctl hyprpaper unload all
  set_wallpaper_file $WALLPAPER_PATH
}

hyprpaper_start() {
  hyprctl dispatch exec hyprpaper
  wallpaper_change
}

case $1 in
  ( start ) wallpaper_start;;
  ( change ) wallpaper_change;;
  ( * ) echo Unknown command;;
esac

