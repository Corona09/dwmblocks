#!/bin/sh

# 传入的 $1 参数代表鼠标点击的按键
# 1: 左键; 2: 中键; 3: 右键; 4: 上滑; 5: 下滑

case $1 in
	1)
		# 左键点击, 切换启用/禁用音量设备
		amixer -q set Master toggle
		status=`amixer get Master | tail -n1 | awk '{print $NF}'`
		if [[ "$status" = "[on]" ]]; then
			amixer -q set Speaker on
			amixer -q set Headphone on
		fi
		;;
	2|3)
		# 中键点击/右键点击, 启动 pavucontrol
		pavucontrol
		;;
	4)
		# 鼠标上滑, 增大音量
		dwm-volume u
		;;
	5)
		# 鼠标下滑, 降低音量
		dwm-volume d
		;;
	*)
		# 未知信号, 不处理
		;;
esac

# 向 dwmblocks 模块发送信号, 更新状态
sigdwmblocks 3
