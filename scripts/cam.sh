#!/bin/bash

session="CAM"

# Start New Session with our name
tmux new-session -d -s $session

# Name first Window and start zsh
tmux rename-window -t 1 'Vim'
tmux send-keys -t 'Vim' 'cd ~/dev/bymiles-cam' C-m 'clear' C-m 'vim' C-m

# Create and setup window for running dependent servers
tmux new-window -t $session:2 -n 'CAM Server'
tmux split-window -h -p 50
tmux send-keys -t 'CAM Server'.0 'cd ~/dev/bymiles-cam' C-m 'clear' C-m 'npm run start:dev' C-m
tmux send-keys -t 'CAM Server'.1 'cd ~/dev/bymiles-cam' C-m 'clear' C-m

# Create and setup window for running dependent servers
tmux new-window -t $session:3 -n 'Background Servers'
tmux split-window -h -p 50
tmux selectp -t 0
tmux split-window -v -p 50
tmux send-keys -t 'Background Servers'.0 'cd ~/dev/bymiles-engine' C-m 'clear' C-m 'npm run start:dev' C-m
tmux send-keys -t 'Background Servers'.1 'cd ~/dev/bymiles-dealership' C-m 'clear' C-m 'npm run build && npm run serve' C-m
tmux send-keys -t 'Background Servers'.2 'cd ~/dev/bymiles-policy-services/services/policy-prepaid-credits' C-m 'clear' C-m 'npm run start:dev' C-m

tmux attach-session -t $SESSION:1
