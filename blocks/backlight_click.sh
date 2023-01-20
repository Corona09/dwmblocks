#!/bin/sh

echo "$1" > ~/Downloads/sig.txt


if ! command -v xbrightness.sh &> /dev/null; then
	exit 1
fi

if ! command -v xgetcolortemp.sh &> /dev/null
then
	exit 1
else
	disp=`xrandr | grep -w connected | cut -f1 -d' '`
	temp=`xgetcolortemp.sh`
	if [[ `echo "$temp >= 0.5" | bc` -eq 1 ]]; then
		# 当前是日间模式，转为夜间模式
		xbrightness.sh = $disp 0.3 --temp
		notify-send -t 3000 "🌙夜间模式"
	else
		# 当前是夜间模式，转为日间模式
		xbrightness.sh = $disp 0.6 --temp
		notify-send -t 3000 "🌞日间模式"
	fi
fi

sigdwmblocks 2
