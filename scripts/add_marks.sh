#!/bin/bash

MARK_FILE="$HOME/.tmux-marks.json"
PANE_ID=$(tmux display-message -p "#{pane_id}")
CURSOR_X=$(tmux display-message -p "#{cursor_x}")
CURSOR_Y=$(tmux display-message -p "#{cursor_y}")

# Highlight the marked line temporarily
tmux set-option -t "$PANE_ID" @marked_line_y "$CURSOR_Y"
tmux select-pane -P "bg=colour4"  # Visual mark (temporary highlight)

# Append to JSON file
if [ ! -f "$MARK_FILE" ]; then
    echo "[]" > "$MARK_FILE"
fi

jq ". + [{\"pane\": \"$PANE_ID\", \"x\": \"$CURSOR_X\", \"y\": \"$CURSOR_Y\"}]" "$MARK_FILE" > "$MARK_FILE.tmp" && mv "$MARK_FILE.tmp" "$MARK_FILE"

tmux display-message "Mark added at pane: $PANE_ID, x: $CURSOR_X, y: $CURSOR_Y"
