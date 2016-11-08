# User configuration sourced by interactive shells

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'


# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/bin
  /usr/local/sbin
  $path
)

# Load Custom Aliases
. ~/.dotfiles/aliases

# Load FASD
eval "$(fasd --init auto)"

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
