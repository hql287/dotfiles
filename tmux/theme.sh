# Always show status bar
set -g status on

# Set update frequencey (default 15 seconds)
set -g status-interval 5

# BASIC COLORS
WHITE="colour255"
BLACK="colour232"
GREY="colour249"

# DEFAULT COLORS
FG_DEFAULT="colour252"
BG_DEFAULT="colour240"

# WINDOWS LIST COLORS
NORMAL_WIN_TXT=$WHITE
NORMAL_WIN_COLOR="colour244"
ACTIVE_WIN_TXT=$WHITE
ACTIVE_WIN_COLOR="colour6"

#LEFT SEGMENT
LFT_SEG_1_TXT=$WHITE
LFT_SEG_1_COLOR="colour243"

# RIGHT SEGMENTS FROM RIGHT TO LEFT
RGT_SEG_1_TXT=$WHITE
RGT_SEG_1_COLOR="colour238"

RGT_SEG_2_TXT=$WHITE
RGT_SEG_2_COLOR="colour243"

# White text on black background
set -g status-fg $FG_DEFAULT
set -g status-bg $BG_DEFAULT
set -g status-attr bright

# Status bar left side
set -g status-left-length 52
set -g status-left "#{prefix_highlight}#[fg=$LFT_SEG_1_TXT,bg=$LFT_SEG_1_COLOR,bold] ❐ #S #{online_status} #[fg=$LFT_SEG_1_COLOR,bg=$BG_DEFAULT,nobold]⮀"

# Windows list customizations
set -g window-status-format "#[fg=$BG_DEFAULT,bg=$NORMAL_WIN_COLOR]⮀#[fg=$NORMAL_WIN_TXT,bg=$NORMAL_WIN_COLOR,nobold] #I:#W #[fg=$NORMAL_WIN_COLOR,bg=$BG_DEFAULT,nobold]⮀"
set -g window-status-current-format "#[fg=$BG_DEFAULT,bg=$ACTIVE_WIN_COLOR]⮀#[fg=$ACTIVE_WIN_TXT,bg=$ACTIVE_WIN_COLOR,noreverse,nobold] #I:#W #[fg=$ACTIVE_WIN_COLOR,bg=$BG_DEFAULT,nobold]⮀"


# Status bar right side
set -g status-right-length 451
set -g status-right "#[fg=$RGT_SEG_2_COLOR, bg=$BG_DEFAULT,nobold]⮂#[fg=$RGT_SEG_2_TXT,bg=$RGT_SEG_2_COLOR,nobold] %a %h.%d.%Y %H:%M #[fg=$RGT_SEG_1_COLOR, bg=$RGT_SEG_2_COLOR]⮂#[fg=$RGT_SEG_1_TXT,bg=$RGT_SEG_1_COLOR,nobold] ⌘ #h "
