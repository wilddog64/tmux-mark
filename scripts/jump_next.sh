#!/bin/bash

MARK_FILE="/tmp/tmux_marks"
CURRENT_MARK=$(tmux display-message -p "#{pane_id}")

# Read marks and jump to the next
if [ -f "$MARK_FILE" ]; then
    NEXT_MARK=$(awk -v current="$CURRENT_MARK" '
        BEGIN {found=0}
        {if ($1 == current && found==0) {found=1; next} else if (found==1) {print $0; exit}}
    ' "$MARK_FILE")

    if [ -n "$NEXT_MARK" ]; then
        PANE_ID=$(echo "$NEXT_MARK" | awk '{print $1}')
        CURSOR_X=$(echo "$NEXT_MARK" | awk '{print $2}')
        CURSOR_Y=$(echo "$NEXT_MARK" | awk '{print $3}')

        tmux select-pane -t "$PANE_ID"
        tmux send-keys -X cursor-left " "  # Adjust cursor position
        tmux display-message "Jumped to mark: pane: $PANE_ID, x: $CURSOR_X, y: $CURSOR_Y"
    else
        tmux display-message "No next mark found."
    fi
else
    tmux display-message "No marks set yet."
fi
