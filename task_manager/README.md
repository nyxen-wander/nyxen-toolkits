# task_manager.sh

A lightweight, management CLI tool built in pure Bash.
Crafted with passion, perseverance, and a pinch of chaotic sleep-deprived energy.

## Features

- Add tasks via CLI
- List all current tasks
- Remove tasks by index
- Persist tasks across sessions via `task_list.txt`
- Error handling for invalid inputs
- Simple, clean UX for the terminal goblins we are

## Usage

```bash
./task_manager.sh <command> [argument]
```

## Commands
| Command        | Description                | Example                              |
| -------------- | -------------------------- | ------------------------------------ |
| `add <task>`   | Add a new task             | `./task_manager.sh add "Clean logs"` |
| `list`         | List all current tasks     | `./task_manager.sh list`             |
| `remove <idx>` | Remove task by index       | `./task_manager.sh remove 1`         |
| `help`         | Display usage instructions | `./task_manager.sh help`             |

## Notes

- All tasks are saved to task_list.txt in the script’s directory.
- If the file doesn’t exist, it’ll be created automatically.
- Task indices are dynamic and re-ordered after removal.
- Script is written with set -euo pipefail to ensure safe execution.

## Limitations

- No support for editing or completing tasks (for now).
- Index gaps after deletion are re-packed (no gaps remain).
- Arguments longer than two words must be quoted.

## Example

```bash
./task_manager.sh add "Update SSL certs"
./task_manager.sh list
./task_manager.sh remove 0
```

Made with 💀 and ☕ by Nyxen Wander
