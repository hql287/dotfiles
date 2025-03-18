set -g @plugin 'tmux-plugins/tpm'                   # Tmux Plugins Manager
set -g @plugin 'tmux-plugins/tmux-yank'             # Enables copying to system clipboard in Tmux
set -g @plugin 'tmux-plugins/tmux-sensible'         # A set of tmux options that should be acceptable to everyone
set -g @plugin 'tmux-plugins/tmux-copycat'          # Enhances tmux search
set -g @plugin 'tmux-plugins/tmux-resurrect'        # Restore tmux environment after system restart.
set -g @plugin 'tmux-plugins/tmux-sidebar'          # Opens a tree directory listing for the current path
set -g @plugin 'tmux-plugins/tmux-online-status'    # Tmux plugin that displays online status of your computer.
set -g @plugin 'tmux-plugins/tmux-open'             # Tmux key bindings for quick opening of a highlighted file or url
set -g @plugin 'tmux-plugins/tmux-continuum'        # Continuous saving of tmux environment
set -g @plugin 'tmux-plugins/tmux-prefix-highlight' # Highlights when you press tmux prefix key

# Online status symbols
set -g @online_icon "✓"
set -g @offline_icon "✗"

# Tmux prefix highlight
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=yellow,bold' # default is 'fg=default,bg=yellow'

# Automatic Restore Tmux Environment
set -g @continuum-restore 'off'
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-strategy-nvim 'session'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
