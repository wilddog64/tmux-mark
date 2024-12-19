# Add a mark at the current cursor position
bind m run-shell "$PWD/scripts/add_mark.sh"

# Jump to the next mark
bind ] run-shell "$PWD/scripts/jump_next.sh"

# Jump to the previous mark
bind [ run-shell "$PWD/scripts/jump_prev.sh"

# Reload tmux configuration
tmux source-file ~/.tmux.conf
