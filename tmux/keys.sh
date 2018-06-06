# Update default binding of `Enter` to also use copy-pipe
# unbind -t vi-copy Enter

# Remove Ctrl-b as default prefix key
unbind C-b

# Set Ctrl-a set prefix key
set -g prefix C-a

# Ctrl-a twice to send Ctrl-a to an app running inside tmux
bind a send-prefix

# Reload tmux config
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Rename windows & session
bind n command-prompt 'rename-window %%'
bind N command-prompt 'rename-session %%'

# Setup 'v' to begin selection as in Vim
# bind -t vi-copy v begin-selection
# bind -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
# bind -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
# Patch for OS X pbpaste and pbcopy under tmux.
set-option -g default-command "which reattach-to-user-namespace > /dev/null && reattach-to-user-namespace -l $SHELL || $SHELL"
