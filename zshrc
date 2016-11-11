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

# Load Zplug Init file
source ~/.zplug/init.zsh

zplug "Valiev/almostontop"               # Almost On Top
zplug "b4b4r07/enhancd", use:init.sh     # Enhanced CD
zplug "djui/alias-tips"                  # Aliases tips
zplug "hungle88/aka"                     # Custom aliases
zplug "k4rthik/git-cal", as:command      # Github contirbution calendar
zplug "lukechilds/zsh-nvm"               # Nvm wrapper
zplug "plugins/extract", from:oh-my-zsh  # Extracting utility
zplug "supercrabtree/k"                  # K is the new l, yo!
zplug "urbainvaes/fzf-marks"             # Bookmark
zplug "voronkovich/gitignore.plugin.zsh" # Creating .gitignore files.

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