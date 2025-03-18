# Kill pane
bind -n C-x kill-pane

# Create new windows
bind c new-window -c "#{pane_current_path}"

# Create horizontal splits
bind - split-window -v -c "#{pane_current_path}"

# Create vertical splits
bind | split-window -h -c "#{pane_current_path}"

# Break pane into a single windows
bind b break-pane -d

# Switching between tmux and vim splits seamlessly
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"

# Cycle through the windows
bind , previous-window
bind . next-window

# Resizing
bind -n S-Left resize-pane -L 2
bind -n S-Right resize-pane -R 2
bind -n S-Up resize-pane -U 1
bind -n S-Down resize-pane -D 1

# Move windows
# Ctrl-Shift-Left moves the current window one position to the left
bind -n C-S-Left { swap-window -t -1
previous-window }
# Ctrl-Shift-Right moves the current window one position to the right
bind -n C-S-Right { swap-window -t +1
next-window }

