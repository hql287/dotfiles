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
