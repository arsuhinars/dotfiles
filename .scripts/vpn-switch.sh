#!/bin/sh
 
if [ $1 = true ]; then
  nmcli connection up kindly_window
else
  nmcli connection down kindly_window
fi

