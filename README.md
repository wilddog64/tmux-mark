# tmux-mark

**tmux-mark** is a lightweight and simple tmux plugin that allows you to **mark specific positions on the screen** and **jump between them**, similar to iTerm2's integration. It is designed to improve your tmux navigation and workflow efficiency.

## Features
- Mark any location in the current tmux pane.
- Jump **forward** and **backward** between marks.
- Works seamlessly across panes.
- Lightweight and easy to install.

---

## Installation

### Using [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm)
1. Add the following line to your `.tmux.conf`:
    ```tmux
    set -g @plugin 'yourusername/tmux-mark'
    ```
2. Reload your tmux configuration:
    ```bash
    tmux source-file ~/.tmux.conf
    ```
3. Install the plugin by pressing:
    ```
    prefix + I
    ```

### Manual Installation
1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/tmux-mark.git ~/.tmux/tmux-mark
    ```
2. Add the following line to your `.tmux.conf`:
    ```tmux
    run-shell ~/.tmux/tmux-mark/tmux-mark.tmux
    ```
3. Reload your tmux configuration:
    ```bash
    tmux source-file ~/.tmux.conf
    ```

---

## Usage

### Keybindings
| Keybinding       | Description                        |
|------------------|------------------------------------|
| `prefix + m`     | Add a mark at the current location |
| `prefix + ]`     | Jump to the next mark              |
| `prefix + [`     | Jump to the previous mark          |

---

## How It Works
1. **Add a Mark**:
   - Press `prefix + m` to save the current pane, cursor position (x, y), and window.
2. **Navigate Marks**:
   - Use `prefix + ]` to jump **forward** to the next mark.
   - Use `prefix + [` to jump **backward** to the previous mark.
3. Marks are saved temporarily in a file (`/tmp/tmux_marks`) during the session.

---

## Configuration
By default, the plugin uses the following keybindings:
- **Add Mark**: `prefix + m`
- **Next Mark**: `prefix + ]`
- **Previous Mark**: `prefix + [`

If you wish to customize these keybindings, add the following lines to your `.tmux.conf`:
```tmux
unbind m
unbind ]
unbind [
bind <your-key> run-shell ~/.tmux/tmux-mark/scripts/add_mark.sh
bind <your-next-key> run-shell ~/.tmux/tmux-mark/scripts/jump_next.sh
bind <your-prev-key> run-shell ~/.tmux/tmux-mark/scripts/jump_prev.sh
```
Replace `<your-key>`, `<your-next-key>`, and `<your-prev-key>` with your preferred keys.

---

## Example
1. Open a tmux session and navigate to a pane.
2. Press `prefix + m` to add a mark at your current position.
3. Move to another pane or location and press `prefix + m` again.
4. Use `prefix + ]` to jump to the next mark or `prefix + [` to jump to the previous mark.
5. Marks will persist within the session and can help with quick navigation.

---

## Troubleshooting
1. **No marks found**:
   - Ensure you have added at least one mark using `prefix + m`.
2. **Marks not persisting**:
   - Marks are saved in `/tmp/tmux_marks` and do not persist across sessions.
3. **Custom Keybindings Not Working**:
   - Ensure your `.tmux.conf` is reloaded using `tmux source-file ~/.tmux.conf`.

---

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a feature branch.
3. Submit a pull request with a clear description of the changes.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Credits
This plugin was inspired by iTerm2's marks and navigation feature. Built for tmux enthusiasts who love efficient workflows.

---

## Future Improvements
- Visual indicators for marks.
- Persistent marks across sessions.
- Support for deleting marks.

---

Enjoy tmux-mark and make your navigation smooth! 🚀
