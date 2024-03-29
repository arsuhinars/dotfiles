#!/bin/sh

TRANSITIONS="-t fade
-t left
-t right
-t top
-t wipe
-t any
-t outer"

RANDOM_WALLPAPER_PATH=$(find ~/Pictures/wallpapers/ -type f | sort -R | tail -n 1 -)
RANDOM_TRANSITION=$(echo "$TRANSITIONS" | sort -R | tail -n 1 -)

swww img $RANDOM_WALLPAPER_PATH $RANDOM_TRANSITION --transition-fps=75

