#!/bin/bash

cd $1
name="`basename $1`"

if ps -A | grep tmux 1>/dev/null 2>&1; then
	tmux attach-session -d
else
	tmux new-session -d -s "$name" bash
	tmux split-window -h -l 40% -t "$name:1" bash
	tmux attach-session -d
fi
exit 0
