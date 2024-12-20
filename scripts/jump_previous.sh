#!/bin/bash

MARK_FILE="$HOME/.tmux-marks.json"
PANE_ID=$(tmux display-message -p "#{pane_id}")

if [ ! -f "$MARK_FILE" ]; then
    tmux display-message "No marks found."
    exit 1
fi

# Extract previous mark
PREV_MARK=$(jq -r "map(select(.pane == \"$PANE_ID\")) | reverse | .[0]" "$MARK_FILE")
if [ -z "$PREV_MARK" ]; then
    tmux display-message "No previous mark found."
    exit 1
fi

CURSOR_Y=$(echo "$PREV_MARK" | jq -r ".y")

# Move cursor and highlight line
tmux send-keys -X goto-line "$CURSOR_Y"
tmux select-pane -P "bg=colour4"

tmux display-message "Jumped to previous mark at pane: $PANE_ID, y: $CURSOR_Y"
