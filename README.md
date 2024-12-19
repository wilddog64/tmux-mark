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

## Test Plan
This section outlines the steps required to validate the plugin's functionality, ensuring that it works as intended in both normal and copy modes. Ensure the plugin is installed and configured before running tests.

### Pre-requisites
1. Install the `tmux-mark` plugin using TPM or manual installation.
2. Ensure `expect` is installed for automation testing:
    ```bash
    sudo apt-get install expect
    ```
3. Ensure a minimal test configuration file can be created without modifying user `~/.tmux.conf`.
4. Run the test suite in an isolated tmux environment.

---

### Test Cases

#### 1. Verify Marks Cannot Be Added Outside Copy Mode
- **Steps**:
    1. Start a new tmux session.
    2. Attempt to add a mark without entering copy mode (`prefix + m`).
- **Expected Result**:
    - An error message is displayed: `Error: Marks can only be added in copy mode.`

#### 2. Verify Marks Can Be Added in Copy Mode
- **Steps**:
    1. Start a new tmux session.
    2. Enter copy mode (`prefix + [`).
    3. Add a mark at the current cursor location (`prefix + m`).
- **Expected Result**:
    - A success message is displayed: `Mark added at pane: <pane_id>, x: <cursor_x>, y: <cursor_y>`.

#### 3. Verify Navigation to Next Mark
- **Steps**:
    1. Enter copy mode (`prefix + [`).
    2. Add two marks at different locations.
    3. Use `prefix + ]` to jump to the next mark.
- **Expected Result**:
    - Cursor moves to the next marked location, and a confirmation message is displayed.

#### 4. Verify Navigation to Previous Mark
- **Steps**:
    1. Enter copy mode (`prefix + [`).
    2. Add two marks at different locations.
    3. Use `prefix + [` to jump to the previous mark.
- **Expected Result**:
    - Cursor moves to the previous marked location, and a confirmation message is displayed.

#### 5. Verify Marks Persist Within the Session
- **Steps**:
    1. Start a new tmux session and enter copy mode.
    2. Add multiple marks at various locations.
    3. Exit copy mode and re-enter it (`prefix + [`).
    4. Attempt to navigate marks using `prefix + ]` and `prefix + [`.
- **Expected Result**:
    - Marks remain accessible within the session.

#### 6. Verify Marks Do Not Persist After Session Termination
- **Steps**:
    1. Add marks in copy mode and confirm they work.
    2. Exit the tmux session.
    3. Start a new session and attempt to navigate marks.
- **Expected Result**:
    - No marks should persist; navigation fails with an appropriate message.

#### 7. Intentional Failure: Add Marks Without Plugin Loaded
- **Steps**:
    1. Start a new tmux session without loading the plugin.
    2. Attempt to add a mark (`prefix + m`).
- **Expected Result**:
    - Marks do not work, and no mark-related messages are displayed.

---

### Running Automated Tests
To automate the test cases, a test script `run_tests.sh` is provided. This script:
1. Creates a minimal **temporary configuration** to isolate the tests.
2. Runs tests using `expect` to validate success and failure scenarios.
3. Outputs a summary report with PASS/FAIL results.

#### Pre-requisites
Ensure the following dependencies are installed:
- **expect**: Install it using:
    ```bash
    sudo apt-get install expect
    ```
- **tmux**: Ensure tmux is installed and accessible in the environment.

#### Running the Tests
1. Make the test script executable:
    ```bash
    chmod +x tests/run_tests.sh
    ```
2. Run the test suite:
    ```bash
    ./tests/run_tests.sh
    ```

#### Expected Output
The script will print a summary like this:
```
Starting tmux-mark automated test suite...
Running Test 1: Marks cannot be added outside copy mode...
PASS: Marks cannot be added outside copy mode.
Running Test 2: Marks can be added in copy mode...
PASS: Marks can be added successfully in copy mode.
Running Test 3: Jump to next mark...
PASS: Successfully jumped to next mark.
Running Test 4: Intentional failure - Adding marks without plugin...
PASS: Marks do not work without the plugin loaded.
---------------------------------------
Test Suite Completed.
Passed: 4
Failed: 0
---------------------------------------
All tests passed successfully!
```

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
