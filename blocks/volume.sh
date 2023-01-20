#!/bin/sh

master_status=`amixer get Master | tail -n1 | awk -F ' ' '{print $NF}'`
speaker_status=`amixer get Speaker | tail -n1 | awk -F ' ' '{print $NF}'`

if [ "$master_status" = "[off]" ] || [ "$speaker_status" = "[off]" ]; then
	printf "婢 ---"
	exit 0
fi


VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
indicator=" "

if [ "$VOL" -eq 0 ]; then
	printf "婢  0%%"
elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 9 ]; then
	printf "$indicator %s%%" "$VOL"
else
	printf "$indicator%s%%" "$VOL"
fi
