# Add mark
bind m run-shell "~/.tmux/tmux-mark/scripts/add_mark.sh"

# Jump to next mark
bind ] run-shell "~/.tmux/tmux-mark/scripts/jump_next.sh"

# Clear all marks
bind M run-shell "~/.tmux/tmux-mark/scripts/clear_marks.sh"

# Restore marks on tmux start
if-shell 'test -f ~/.tmux-marks.json' "run-shell ~/.tmux/tmux-mark/scripts/restore_marks.sh"
