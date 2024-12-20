#!/bin/bash

MARK_FILE="$HOME/.tmux-marks.json"
MARK_KEY="$1"  # Mark key passed as argument

# Validate mark key
if [[ ! "$MARK_KEY" =~ ^[a-z]$ ]]; then
    tmux display-message "Invalid mark key '$MARK_KEY'. Use a-z."
    exit 1
fi

# Check if mark exists
if ! jq -e "has(\"$MARK_KEY\")" "$MARK_FILE" > /dev/null; then
    tmux display-message "Mark '$MARK_KEY' not found."
    exit 1
fi

# Retrieve mark details
PANE_ID=$(jq -r ".\"$MARK_KEY\".pane" "$MARK_FILE")
CURSOR_Y=$(jq -r ".\"$MARK_KEY\".y" "$MARK_FILE")

# Jump to mark
tmux select-pane -t "$PANE_ID"
tmux send-keys -X goto-line "$CURSOR_Y"

tmux display-message "Jumped to mark '$MARK_KEY'."
