#!/bin/bash

SOCKET="/run/user/$(id -u)/i3/ipc-socket.$(pgrep -o i3)"

LAST=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

cleanup() {
    echo "exit..."
    exit 0
}

trap cleanup SIGINT SIGTERM

while true; do
	if [ ! -S "$SOCKET" ]; then
		echo "Сокет недоступний. Завершення скрипта."
		exit 0
	fi
	while read -r event; do
		CURRENT=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

		if [ -n "$CURRENT" ]; then
			if [ -z "$LAST" ]; then
				LAST="$CURRENT"
			elif [ "$LAST" != "$CURRENT" ]; then
				echo "$LAST" > /tmp/last_workspace
				LAST="$CURRENT"
			fi
		fi
	done < <(i3-msg -t subscribe '[ "workspace" ]')
done
