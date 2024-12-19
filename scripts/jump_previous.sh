#!/bin/bash

MARK_FILE="/tmp/tmux_marks"
CURRENT_MARK=$(tmux display-message -p "#{pane_id}")

if [ "$PANE_MODE" != "copy-mode" ]; then
    tmux display-message "Error: Marks can only be added in copy mode."
    exit 1
fi

# Read marks and jump to the previous
if [ -f "$MARK_FILE" ]; then
    PREV_MARK=$(awk -v current="$CURRENT_MARK" '
        BEGIN {last=""; found=0}
        {if ($1 == current) {found=1; print last; exit} else {last=$0}}
    ' "$MARK_FILE")

    if [ -n "$PREV_MARK" ]; then
        PANE_ID=$(echo "$PREV_MARK" | awk '{print $1}')
        CURSOR_X=$(echo "$PREV_MARK" | awk '{print $2}')
        CURSOR_Y=$(echo "$PREV_MARK" | awk '{print $3}')

        tmux select-pane -t "$PANE_ID"
        tmux send-keys -X cursor-left " "  # Adjust cursor position
        tmux display-message "Jumped to mark: pane: $PANE_ID, x: $CURSOR_X, y: $CURSOR_Y"
    else
        tmux display-message "No previous mark found."
    fi
else
    tmux display-message "No marks set yet."
fi
