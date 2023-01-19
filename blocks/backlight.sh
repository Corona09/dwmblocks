#!/bin/sh

brightness=`xbacklight -get`
brightness=`echo "scale=0;$brightness/1" | bc`

if ! command -v xgetcolortemp.sh &> /dev/null
then
	icon=" "
else
	temp=`xgetcolortemp.sh`
	if [[ `echo "$temp >= 0.5" | bc` -eq 1 ]]; then
		icon=" "
	else
		icon=" "
	fi
fi
printf "$icon$brightness%%"
