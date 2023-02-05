#!/usr/bin/env bash

if ! command -v xbrightness.sh &> /dev/null; then
	exit 1
fi

if ! command -v xgetcolortemp.sh &> /dev/null
then
	exit 1
fi

case $1 in
	1|2|3)
		# 鼠标左键/中键/右键点击, 切换夜间/日间模式
		disp=`xrandr | grep -w connected | cut -f1 -d' '`
		temp=`xgetcolortemp.sh`
		if [[ `echo "$temp >= 0.5" | bc` -eq 1 ]]; then
			# 当前是日间模式，转为夜间模式
			xbrightness.sh = $disp 0.4 --temp
			notify-send -t 3000 "🌙夜间模式"
		else
			# 当前是夜间模式，转为日间模式
			xbrightness.sh = $disp 0.6 --temp
			notify-send -t 3000 "🌞日间模式"
		fi
		;;
	4)
		# 鼠标滑轮上滑, 增大亮度
		dwm-backlight u
		;;
	5)
		# 鼠标滑轮下滑, 降低亮度
		dwm-backlight d
		;;
	*)
		# 未知信号, 不做处理
		;;
esac

sigdwmblocks 2
