# Quoc Hung Le's .zshrc

# Source ZIM {{{
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
# }}}

# Environment Variables Settings {{{
# If Neovim is installed
if type nvim > /dev/null 2>&1;
then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
export PAGER='less'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
path=(
  /usr/local/bin
  /usr/local/sbin
  $path
)
# }}}

# Custom Programs {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh                 # Fzf
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true       # Desk
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc # Phpbrew
eval "$(pyenv init -)"                                 # Pyenv
eval "$(thefuck --alias)"                              # Thefuck
eval "$(thefuck --alias FUCK)"
# }}}

# Run Tmux by default {{{
if [[ "$TERM" != "screen-256color" ]]
then
  tmux attach-session -t "$USER" || tmux new-session -s "$USER"
  exit
fi
# }}}

# Zplug Configuration {{{
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load Zplug Init file
source ~/.zplug/init.zsh

zplug "Valiev/almostontop"               # Almost On Top
zplug "b4b4r07/enhancd", use:init.sh     # Enhanced CD
zplug "djui/alias-tips"                  # Aliases tips
zplug "hungle88/aka"                     # Custom aliases
zplug "k4rthik/git-cal", as:command      # Github contirbution calendar
zplug "lukechilds/zsh-nvm"               # Node versions manager
zplug "plugins/extract", from:oh-my-zsh  # Extracting utility
zplug "shannonmoeller/up", use:up.sh     # Quickly navigate to a parent directory via tab-completion.
zplug "supercrabtree/k"                  # K is the new l, yo!
zplug "urbainvaes/fzf-marks"             # Bookmark
zplug "voronkovich/gitignore.plugin.zsh" # Creating .gitignore files.
zplug "rupa/z", use:z.sh                 # z jump

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Source plugins & add commands to $PATH
zplug load
# }}}

# vim:foldmethod=marker:foldlevel=0