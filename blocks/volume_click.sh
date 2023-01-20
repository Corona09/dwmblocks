#!/bin/sh

# 传入的 $1 参数代表鼠标点击的按键
# 1: 左键; 2: 中键; 3: 右键

case $1 in
	3)
		pavucontrol
		;;
	*)
		amixer -q set Master toggle
		status=`amixer get Master | tail -n1 | awk '{print $NF}'`
		if [[ "$status" = "[on]" ]]; then
			amixer -q set Speaker on
		fi
		;;
esac


sigdwmblocks 3
