# tmux-mark

**tmux-mark** is a plugin for tmux that brings Vim-like mark functionality to your terminal multiplexing workflow. It allows you to mark locations in panes, navigate between them sequentially, and jump directly to specific marks using single-letter keys (`a-z`).

---

## Features

- **Set Marks**: Use `prefix + m` followed by a letter (`a-z`) to mark a location.
- **Jump to Marks**:
  - `prefix + ]` followed by a letter (`a-z`) jumps to a specific mark.
  - `prefix + ]` jumps to the next mark sequentially.
  - `prefix + [` jumps to the previous mark sequentially.
- **Persistent Marks**: Marks are stored in `~/.tmux-marks.json` and persist across sessions.
- **Vim-like Keybindings**: Intuitive and familiar for Vim users.

---

## Installation

### Prerequisites

- `tmux` version 2.6 or higher
- `jq` for handling JSON data

Install `jq` if not already installed:
```bash
# Ubuntu/Debian
sudo apt-get install jq

# macOS (Homebrew)
brew install jq
