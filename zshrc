# Quoc Hung Le's .zshrc

# Source ZIM {{{
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
# }}}

# Editors Settings {{{
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
# }}}

# PATH {{{
path=(
  /usr/local/bin
  /usr/local/sbin
  $path
)

# }}}

# FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# ZPlug {{{

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
# Load Zplug
source ~/.zplug/init.zsh

# Aliases tips
zplug "djui/alias-tips"

# Enhanced CD
zplug "b4b4r07/enhancd", use:init.sh

# Custom aliases
zplug "hungle88/dotfiles", use:aliases

# Github contirbution calendar
zplug "k4rthik/git-cal", as:command

# Extracting utility
zplug "plugins/extract", from:oh-my-zsh

# Encoding to base64
zplug "plugins/encode64", from:oh-my-zsh

# Use lib/clipboard plugin only on Mac
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Runs `ls` and `git status` after chpwd
zplug "dbkaplun/smart-cd"

# Docker completion
zplug "tcnksm/docker-alias", use:zshrc

# Almost On Top
zplug "Valiev/almostontop", use:almostontop.plugin.zsh

# Creating .gitignore files.
zplug "voronkovich/gitignore.plugin.zsh", use:gitignore.plugin.zsh

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