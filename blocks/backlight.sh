#!/bin/sh

brightness=`xbacklight -get`
brightness=`echo "scale=0;$brightness/1" | bc`
icon=" "
printf "$icon$brightness%%"
