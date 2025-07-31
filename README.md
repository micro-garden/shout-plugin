# Shell Out Plugin for Micro

**Shell Out** is a plugin for the
[micro](https://micro-editor.github.io/) text editor that runs the current
line as a shell command and insert the output below.

## Usage

Write a shell command on a line, place your cursor on it, and run:

`Ctrl-Alt-b`

Or via command prompt:

```
shout
```

The output of the command is inserted directly below the current line. The
cursor moves to the end of the output.

## Notes

- Output is not modified in any way.
- Lines with only whitespace are ignored.
- If the command is at the end of the buffer and has no newline, one is
prepended to prevent merging.

## Installation

Place the plugin folder in `~/.config/micro/plug/shout/`, or clone it directly
from the GitHub repository:

```sh
mkdir -p ~/.config/micro/plug
git clone https://github.com/akikareha/micro-shout-plugin ~/.config/micro/plug/shout
```

## License

MIT.

## Author

Aki Kareha (aki@kareha.org)
