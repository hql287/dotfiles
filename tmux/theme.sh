# ~/.tmux.conf - Cleaned and Optimized

# 🛠 GENERAL SETTINGS
set -g status on                                # Always show status bar
set -g status-interval 5                        # Update status every 5s
set -g history-limit 10000                      # Keep more scrollback history
set -sg escape-time 10                          # Improve escape key delay
set -g mouse on                                 # Enable mouse support
set -g base-index 1                             # Start windows at 1
set -g pane-base-index 0                        # Start panes at 0
set -g default-terminal "tmux-256color"         # Enable 256 colors
set -as terminal-overrides ",xterm-256color:Tc" # Ensure true color support
setw -g history-limit 50000000                  # Set the history limit so we get lots of scrollback.

# Default statusbar color
set-option -g status-style bg=colour237,fg=colour223 # bg=bg1, fg=fg1

# Default window title colors
set-window-option -g window-status-style bg=colour214,fg=colour237 # bg=yellow, fg=bg1

# Default window with an activity alert
set-window-option -g window-status-activity-style bg=colour237,fg=colour248 # bg=bg1, fg=fg3

# Active window title colors
set-window-option -g window-status-current-style bg=red,fg=colour237 # fg=bg1

# Set active pane border color
set-option -g pane-active-border-style fg=colour214

# Set inactive pane border color
set-option -g pane-border-style fg=colour239

# Message info
set-option -g message-style bg=colour239,fg=colour223 # bg=bg2, fg=fg1

# Writing commands inactive
set-option -g message-command-style bg=colour239,fg=colour223 # bg=fg3, fg=bg1

# Pane number display
set-option -g display-panes-active-colour colour1 #fg2
set-option -g display-panes-colour colour237      #bg1

# Clock
set-window-option -g clock-mode-colour colour109 #blue

# Bell
set-window-option -g window-status-bell-style bg=colour167,fg=colour235 # bg=red, fg=bg

#### NOTE
# Make sure option to Use Built-in Powerline glyphs is enabled in iTerm2
# In iTerm2, go to Preferences > Profiles > Text > Use Built-in Powerline glyphs

set-option -g status-left "\
#[fg=colour7, bg=colour241]#{?client_prefix,#[bg=colour167],} ❐ #S \
#[fg=colour241, bg=colour237]#{?client_prefix,#[fg=colour167],}#{?window_zoomed_flag, 🔍,}"

set-option -g status-right "\
#[fg=colour246, bg=colour237]  %b %d '%y \
#[fg=colour214, bg=colour237]\
#[fg=colour237, bg=colour214] #(whoami)@#H \
#[fg=colour237, bg=colour214]"

set-window-option -g window-status-current-format "\
#[fg=colour237, bg=colour214]\
#[fg=colour239, bg=colour214] #I*\
#[fg=colour239, bg=colour214, bold] #W \
#[fg=colour214, bg=colour237]"

set-window-option -g window-status-format "\
#[fg=colour237,bg=colour239,noitalics]\
#[fg=colour223,bg=colour239] #I\
#[fg=colour223, bg=colour239] #W \
#[fg=colour239, bg=colour237]"
