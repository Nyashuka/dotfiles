#!/bin/bash

LAST=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

while true; do
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
