#!/usr/bin/env bash

a=$(acpi | tail -n1)

full=$(echo "$a" | awk '{print $(NF-1)}' | sed 's/,//')

if [[ "$full" = "Full" ]]; then
	icon="ð"
	msg="å·²åæ»¡"
else
	charing=$(echo "$a" | awk '{print $3}' | sed 's/,//')

	if [[ "$charing" = "Charging" ]]; then
		t=$(acpi | awk '{print $(NF-2)}')
		h=$(echo "$t" | awk -F ':' '{print $1}')
		m=$(echo "$t" | awk -F ':' '{print $2}')

		h=$((h+0))
		m=$((m+0))
		icon="ð"
		msg="åçµä¸­:"

		if [[ $h -gt 0 ]]; then
			msg="$msg $h å°æ¶"
		fi
		if [[ $m -gt 0 ]]; then
			msg="$msg $m åé"
		fi
		msg="$msgååæ»¡"
	else
		t=$(acpi | awk '{print $(NF-1)}')
		h=$(echo "$t" | awk -F ':' '{print $1}')
		m=$(echo "$t" | awk -F ':' '{print $2}')

		h=$((h+0))
		m=$((m+0))
		icon="ð"
		msg="æ¾çµä¸­, å©ä½çº¦"

		if [[ $h -gt 0 ]]; then
			msg="$msg $h å°æ¶"
		fi
		if [[ $m -gt 0 ]]; then
			msg="$msg $m åé"
		fi
	fi
fi

notify-send -t 3000 "$icon $msg"
