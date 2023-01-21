#!/bin/sh

a=$(acpi | tail -n1)

full=$(echo "$a" | awk '{print $(NF-1)}' | sed 's/,//')

if [[ "$full" = "Full" ]]; then
	icon="😄"
	msg="已充满"
else
	charing=$(echo "$a" | awk '{print $3}' | sed 's/,//')

	if [[ "$charing" = "Charging" ]]; then
		t=$(acpi | awk '{print $(NF-2)}')
		h=$(echo "$t" | awk -F ':' '{print $1}')
		m=$(echo "$t" | awk -F ':' '{print $2}')

		h=$((h+0))
		m=$((m+0))
		icon="🔌"
		msg="充电中:"

		if [[ $h -gt 0 ]]; then
			msg="$msg $h 小时"
		fi
		if [[ $m -gt 0 ]]; then
			msg="$msg $m 分钟"
		fi
		msg="$msg后充满"
	else
		t=$(acpi | awk '{print $(NF-1)}')
		h=$(echo "$t" | awk -F ':' '{print $1}')
		m=$(echo "$t" | awk -F ':' '{print $2}')

		h=$((h+0))
		m=$((m+0))
		icon="🔋"
		msg="放电中, 剩余约"

		if [[ $h -gt 0 ]]; then
			msg="$msg $h 小时"
		fi
		if [[ $m -gt 0 ]]; then
			msg="$msg $m 分钟"
		fi
	fi
fi

notify-send -t 3000 "$icon $msg"
