#!/bin/sh

case $1 in
	1)
		# 左键点击, 程序菜单
		[[ -f "$HOME/.cache/dmenu-applications" ]] && {
			cat "$HOME/.cache/dmenu-applications" | dmenu -fn "JetBrainsMono Nerd Font:style=medium:size=13" | ${SHELL:-"/bin/sh"} &
		} || {
			dmenu_run "$@"
		}
		;;
	2)
		# 中键点击, 随机壁纸
		dwm-wallpaper random
		;;
	3)
		# 右键点击, 电源菜单
		dwm-powermenu -fn "JetBrainsMono Nerd Font:style=medium:size=13"
		;;
	4)
		# 鼠标滑轮上滑, 切换上一张壁纸
		dwm-wallpaper prev
		;;
	5)
		# 鼠标滑轮下滑, 切花下一张壁纸
		dwm-wallpaper
		;;
	*)
		# 未知信号
		;;
esac


