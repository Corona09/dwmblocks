#!/usr/bin/env bash

brightness=$(brightnessctl | grep "%" | sed -r "s/.*\((.*)%\).*/\1/")

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

if [[ $brightness -lt 10 ]]; then
	printf "${icon}0$brightness%%"
else
	printf "$icon$brightness%%"
fi
