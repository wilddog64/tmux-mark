#!/bin/bash

MARK_FILE="/tmp/tmux_marks"

# Get the current pane, line, and column position
PANE_ID=$(tmux display-message -p "#{pane_id}")
CURSOR_X=$(tmux display-message -p "#{cursor_x}")
CURSOR_Y=$(tmux display-message -p "#{cursor_y}")

# Append mark to the file
echo "$PANE_ID $CURSOR_X $CURSOR_Y" >> "$MARK_FILE"
tmux display-message "Mark added at pane: $PANE_ID, x: $CURSOR_X, y: $CURSOR_Y"
