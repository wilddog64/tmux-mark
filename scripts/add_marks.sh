#!/bin/bash

MARK_FILE="$HOME/.tmux-marks.json"
MARK_KEY="$1"  # Mark key passed as argument
PANE_ID=$(tmux display-message -p "#{pane_id}")
CURSOR_X=$(tmux display-message -p "#{cursor_x}")
CURSOR_Y=$(tmux display-message -p "#{cursor_y}")

# Validate mark key
if [[ ! "$MARK_KEY" =~ ^[a-z]$ ]]; then
    tmux display-message "Invalid mark key '$MARK_KEY'. Use a-z."
    exit 1
fi

# Ensure mark file exists
[ ! -f "$MARK_FILE" ] && echo "{}" > "$MARK_FILE"

# Store the mark
jq ".\"$MARK_KEY\" = {\"pane\": \"$PANE_ID\", \"x\": \"$CURSOR_X\", \"y\": \"$CURSOR_Y\"}" "$MARK_FILE" > "$MARK_FILE.tmp" && mv "$MARK_FILE.tmp" "$MARK_FILE"

tmux display-message "Mark '$MARK_KEY' set."
