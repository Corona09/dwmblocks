#!/bin/sh

battery=`acpi | awk -F ' ' '{print $4}' | awk -F ',' '{print $1}' | awk -F '%' '{print $1}'`
status=`acpi | awk -F ' ' '{print $3}' | awk -F ',' '{print $1}'`
if [[ "$status" = "Discharging" ]]; then
	if   [ "$battery" -ge 95 ]; then bat_icon="";
	elif [ "$battery" -ge 90 ]; then bat_icon="";
	elif [ "$battery" -ge 80 ]; then bat_icon="";
	elif [ "$battery" -ge 70 ]; then bat_icon="";
	elif [ "$battery" -ge 60 ]; then bat_icon="";
	elif [ "$battery" -ge 50 ]; then bat_icon="";
	elif [ "$battery" -ge 40 ]; then bat_icon="";
	elif [ "$battery" -ge 30 ]; then bat_icon="";
	elif [ "$battery" -ge 20 ]; then bat_icon="";
	elif [ "$battery" -ge 10 ]; then bat_icon="";
	else bat_icon=""; fi
else
	bat_icon=""
fi
printf "$bat_icon$battery%%"
