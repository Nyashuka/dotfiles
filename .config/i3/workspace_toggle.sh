#!/bin/bash

if [ -f /tmp/last_workspace ]; then
    LAST=$(cat /tmp/last_workspace)
fi

CURRENT=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

if [ "$LAST" ] && [ "$LAST" != "$CURRENT" ]; then
    i3-msg workspace "$LAST"
fi
