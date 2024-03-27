#!/bin/bash

BRIGHTNESS_VALUE_PATH=~/.scripts/var/prev_brightness_value
mkdir ~/.scripts/var

xbacklight -get > $BRIGHTNESS_VALUE_PATH && xbacklight -set 10
