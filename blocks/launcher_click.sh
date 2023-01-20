#!/bin/sh

echo $1 > $HOME/Downloads/sig.txt

case $1 in
	2)
		feh --randomize --bg-fill $HOME/Pictures/wallpaper
		;;
	3)
		dwm-powermenu
		;;
	*)
		[[ -f "$HOME/.cache/dmenu-applications" ]] && {
			cat "$HOME/.cache/dmenu-applications" | dmenu | ${SHELL:-"/bin/sh"} &
		} || {
			dmenu_run "$@"
		}
		;;
esac


