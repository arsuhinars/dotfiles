#!/bin/sh

TRANSITIONS="-t fade
-t wipe --transition-angle 45
-t wipe --transition-angle 135
-t any
-t outer"

RANDOM_WALLPAPER_PATH=$(find /home/arsuhinars/Pictures/wallpapers/ -type f | sort -R | tail -n 1 -)
RANDOM_TRANSITION=$(echo "$TRANSITIONS" | sort -R | tail -n 1 -)

swww img $RANDOM_WALLPAPER_PATH $RANDOM_TRANSITION --transition-fps=75

