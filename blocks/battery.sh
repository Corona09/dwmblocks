#!/bin/sh

a=$(acpi | tail -n1)
battery=`echo "$a" | awk -F ' ' '{print $4}' | awk -F ',' '{print $1}' | awk -F '%' '{print $1}'`
status=`echo "$a" | awk -F ' ' '{print $3}' | sed 's/,//'`
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
	else bat_icon="";fi
elif [[ "$status" = "Full" ]]; then
	bat_icon=""
	battery="100"
else
	bat_icon=""
fi

if [[ $battery -le 15 ]]; then
	[[ -f $HOME/.battery-low ]] || {
		notify-send -t 3000 -u critical " 电池电量低, 请尽快充电!"
		touch $HOME/.battery-low
	}
else
	[[ -f $HOME/.battery-low ]] && {
		rm -f $HOME/.battery-low
	}
fi

printf "$bat_icon$battery%%"
