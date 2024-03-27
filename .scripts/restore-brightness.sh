#!/bin/bash

BRIGHTNESS_VALUE_PATH=~/.scripts/var/prev_brightness_value
mkdir ~/.scripts/var

if [ -e $BRIGHTNESS_VALUE_PATH ]; then
    xbacklight -set $(cat $BRIGHTNESS_VALUE_PATH)
    rm $BRIGHTNESS_VALUE_PATH
fi
