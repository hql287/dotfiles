# Local custom config
if-shell "[ -f ~/.tmux.conf.user ]" 'source ~/.tmux.conf.user'

# Use Mouse
set -g mouse on

# Bigger history
set -g history-limit 10000

# Display visual bell
set -g visual-bell on

# Ring the bell if any background window rang a bell
set -g bell-action any

# Renumber windows sequentially after closing any of them
set -g renumber-windows on

# Using True Color
# set -ga terminal-overrides ",xterm-256color-italic:Tc"
# set -g default-terminal xterm-256color-italic
set -g default-terminal "screen-256color"

# Cursor shape change in tmux
set -ga terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

# Shorten command delay
set -sg escape-time 1

# Set first window to index 1 (not 0) to map more to the keyboard layout...
set -g base-index 1

# Setting panes index, start from 1.
setw -g pane-base-index 1

# Use vi keybindings for tmux commandline input.
set -g status-keys vi

# Use vi keybindings in copy and choice modes
setw -g mode-keys vi

# Command/Message
set -g message-style bg=colour39,fg=colour252,bright
