#!/bin/sh

if [ $1 = true ]; then
  hyprctl --batch "\
    keyword decoration:drop_shadow 0;\
    keyword decoration:blur:enabled 0"
else
  hyprctl reload
fi

