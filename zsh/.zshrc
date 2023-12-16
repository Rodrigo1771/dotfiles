# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Cleanup
export LESSHISTFILE="-"
export HISTFILE="/dev/null"

# Source it
source $ZSH/oh-my-zsh.sh

# Aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

