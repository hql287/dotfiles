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

# Load FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# ZSH Plugins {{{
# Load Zplug
. ~/.zplug/init.zsh

# Enhanced CD
zplug "b4b4r07/enhancd", use:init.sh

# Zsh completion for docker
zplug "tcnksm/docker-alias", use:zshrc

# Almost On Top
zplug "Valiev/almostontop", use:almostontop.plugin.zsh

# ZSH plugin for creating .gitignore files.
zplug "voronkovich/gitignore.plugin.zsh", use:gitignore.plugin.zsh

# Source plugins & add commands to $PATH
zplug load

# }}}
