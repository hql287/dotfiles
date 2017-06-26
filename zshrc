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

# LANG
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# EnhanCD Hook
export ENHANCD_HOOK_AFTER_CD="ls -al"

# PATH
path=(
  /usr/local/bin
  /usr/local/sbin
  ~/.composer/vendor/bin
  $path
)
# }}}

# Custom Programs {{{
eval "$(pyenv init -)"                                 # Pyenv
eval "$(rbenv init -)"                                 # Rbenv
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh                 # Fzf
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc # Phpbrew
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
zplug "lukechilds/zsh-nvm"               # Node versions manager
zplug "plugins/extract", from:oh-my-zsh  # Extracting utility
zplug "zplug/zplug"                      # Manage zplug in the same way as any other packages<Paste>

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
