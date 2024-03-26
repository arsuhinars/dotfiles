#!/bin/bash

BRIGHTNESS_VALUE_PATH=~/.scripts/prev_brightness_value

xbacklight -get > $BRIGHTNESS_VALUE_PATH && xbacklight -set 10
