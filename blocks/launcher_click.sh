#!/bin/sh

case $1 in
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


