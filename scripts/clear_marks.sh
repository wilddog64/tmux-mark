#!/bin/bash

MARK_FILE="$HOME/.tmux-marks.json"

# Clear JSON file
echo "[]" > "$MARK_FILE"

# Reset visual marks
tmux select-pane -P "default"

tmux display-message "All marks cleared."
