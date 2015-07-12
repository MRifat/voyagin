if [ ! $A2E_DIR ]; then export A2E_DIR=$HOME/workspace/voyagin; fi

cd $A2E_DIR

tmux new-session  -d -s a2e
tmux set-environment -t a2e -g A2E_DIR $A2E_DIR

tmux new-window     -t a2e -n 'A2E'
tmux send-key       -t a2e 'cd $A2E_DIR' Enter 'vim .'  Enter

tmux attach-session -t a2e
