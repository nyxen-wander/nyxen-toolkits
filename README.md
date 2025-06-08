# Nyxen's Bash Toolkits

A growing collection of Bash scripts built to automate the small things and make life in the terminal a little more powerful.

## What’s Inside?

| Script                                                                                                         | Purpose                                                                                                         |
| -------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------  |
| [`find_and_compress.sh`](https://github.com/nyxen-wander/nyxen-toolkits/blob/main/find_and_compress/README.md) | Compresses `.log` files in a given directory into a timestamped `.tar.gz` archive.                              |
| [`log_analyzer.sh`](https://github.com/nyxen-wander/nyxen-toolkits/blob/main/log_analyzer/README.md)           | Parses `.log` files and extracts unique IP access info, optionally filtering by resource.                       |
| [`guessing_game.sh`](https://github.com/nyxen-wander/nyxen-toolkits/blob/main/guessing_game/README.md)         | A little terminal-based game written in Bash. The player has 5 lives to guess a secret number between 1 and 10. |
|[`task_manager.sh`](https://github.com/nyxen-wander/nyxen-toolkits/blob/main/task_manager/README.md)            | A lightweight, management CLI tool built in pure Bash. Crafted with passion, perseverance, and a pinch of chaotic sleep-deprived energy.|


## Why This Repo Exists?

- I got tired of rewriting the same bash snippets.
- I wanted to understand what I'm automating instead of just copy-pasting Stack Overflow code like a degenerate.
- Building my portfolio.

## Requirements
- Linux OS (tested on Ubuntu)
- bash
- Standard GNU utilities (find, tar, awk, grep, sort, uniq, etc.)

## Usage

Make the scripts executable and run them directly:

```bash
chmod +x script_name.sh
./script_name.sh
```

For each script’s details, check its individual folder and README.

## Contribution?

Not yet accepting PRs officially (this is still my lil playground), but feel free to open Issues, ask questions, or fork.

## License

MIT License – use, break, remix, meme, and improve at will.

## Final Note

I’m aware there are tools like logrotate, GoAccess, or enterprise log systems, but let’s be real… sometimes all you need is a dirty little script that Just Works.

<hr>

_Crafted with grit and coffee by Nyxen Wander_ ☕
