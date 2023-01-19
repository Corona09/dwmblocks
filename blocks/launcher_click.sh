#!/bin/sh

[[ -f "$HOME/.cache/dmenu-applications" ]] && {
	cat "$HOME/.cache/dmenu-applications" | dmenu | ${SHELL:-"/bin/sh"} &
} || {
	dmenu_run "$@"
}
