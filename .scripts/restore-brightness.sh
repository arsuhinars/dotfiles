#!/bin/bash
#!/bin/bash

BRIGHTNESS_VALUE_PATH=~/.scripts/prev_brightness_value

if [ -e $BRIGHTNESS_VALUE_PATH ]; then
    xbacklight -set $(cat $BRIGHTNESS_VALUE_PATH)
    rm $BRIGHTNESS_VALUE_PATH
fi
