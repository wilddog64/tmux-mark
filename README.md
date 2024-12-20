# tmux-mark: Vim-Like Marks for Tmux

**tmux-mark** is a plugin that brings **Vim-like mark navigation** to tmux. It allows you to set marks in panes, jump directly to specific marks using `a-z`, and navigate sequentially between marks.

---

## Installation and Configuration

To install and configure **tmux-mark** using TPM, copy and paste the following commands:

```bash
# Install prerequisites: tmux and jq
## Ubuntu/Debian
sudo apt-get install tmux jq -y
## macOS
brew install tmux jq

# Install and configure Tmux Plugin Manager (TPM)

## How to configure tmux-marks (TPM)

    # Install tmux-mark plugin with TPM
    set -g @plugin 'wilddog64/tmux-mark'

    # Keybindings for Vim-like mark navigation
    bind m switch-client -T mark-mode
    bind ] switch-client -T jump-mode
    bind [ switch-client -T jump-mode

    # Sequential navigation (next/previous marks)
    bind ] run-shell ~/.tmux/plugins/tmux-mark/scripts/jump_next.sh
    bind [ run-shell ~/.tmux/plugins/tmux-mark/scripts/jump_prev.sh

    # Mark mode: set marks a-z
    bind -T mark-mode a run-shell ~/.tmux/plugins/tmux-mark/scripts/add_mark.sh a
    bind -T mark-mode b run-shell ~/.tmux/plugins/tmux-mark/scripts/add_mark.sh b
    bind -T mark-mode c run-shell ~/.tmux/plugins/tmux-mark/scripts/add_mark.sh c
    # Repeat for all letters a-z
    bind -T mark-mode z run-shell ~/.tmux/plugins/tmux-mark/scripts/add_mark.sh z

    # Jump mode: jump to marks a-z
    bind -T jump-mode a run-shell ~/.tmux/plugins/tmux-mark/scripts/jump_to_mark.sh a
    bind -T jump-mode b run-shell ~/.tmux/plugins/tmux-mark/scripts/jump_to_mark.sh b
    bind -T jump-mode c run-shell ~/.tmux/plugins/tmux-mark/scripts/jump_to_mark.sh c
    # Repeat for all letters a-z
    bind -T jump-mode z run-shell ~/.tmux/plugins/tmux-mark/scripts/jump_to_mark.sh z

    # Exit mark or jump modes
    bind -T mark-mode Escape switch-client -T root

# Reload tmux configuration
tmux source-file ~/.tmux.conf

## Install tmux-mark plugin with TPM
<prefix>I to install plugin
<prefix>R to reload .tmux.conf
