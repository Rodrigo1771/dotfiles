# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git vi-mode)

# vi-mode plugin settings
export KEYTIMEOUT=10
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true # Update cursor
VI_MODE_SET_CURSOR=true  # Update cursor
MODE_INDICATOR=" "  # No mode indicator
VI_MODE_CURSOR_INSERT=5  # Blinking line

# Cleanup
export LESSHISTFILE="-"
export HISTFILE="/dev/null"

# Source it
source $ZSH/oh-my-zsh.sh

# Aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

