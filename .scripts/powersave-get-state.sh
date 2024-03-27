#!/bin/sh

POWERSAVE_STATE_PATH=~/.scripts/var/powersave_state

cat $POWERSAVE_STATE_PATH || echo false

