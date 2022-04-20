#!/bin/bash

tmux new-session \; \
  split-window -v -p 20\; \
  send-keys -t 0 "export PATH=$PATH && /usr/bin/nvim $@" C-m \; \
  send-keys -t 1 "export PATH=$PATH" C-m \; \
  select-pane -t 0 \;
