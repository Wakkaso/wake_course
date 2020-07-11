#!/bin/sh

path=$(pwd)
venvfile="$path/venv/bin/activate"
session_name="graphserver"

tmux kill-session -t $session_name 2>/dev/null

if [ $(tmux ls 2>/dev/null | grep $session_name | wc -l) -eq "0" ]
then
  tmux new-session -s $session_name -d;
  sleep 1
  tmux new-window -t $session_name -n Dashboard -d "source $venvfile; python3 $path/app.py; bash -i"
  tmux new-window -t $session_name -n DAs -d "source $venvfile; python3 $path/DAI.py; bash -i"
else
  echo "Can't kill previous tmux session..."
fi
