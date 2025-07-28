# Shell Out Plugin

Run the current line as a shell command and insert the output below in micro
editor.

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
