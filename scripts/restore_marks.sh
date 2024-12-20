#!/bin/bash

MARK_FILE="$HOME/.tmux-marks.json"

if [ ! -f "$MARK_FILE" ]; then
    exit 0
fi

# Restore marks
jq -c '.[]' "$MARK_FILE" | while read -r mark; do
    PANE_ID=$(echo "$mark" | jq -r ".pane")
    CURSOR_Y=$(echo "$mark" | jq -r ".y")

    # Highlight the marked line
    tmux set-option -t "$PANE_ID" @marked_line_y "$CURSOR_Y"
    tmux select-pane -P "bg=colour4"
done
