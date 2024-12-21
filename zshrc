# Path to oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(vi-mode)

# vi-mode plugin settings
export KEYTIMEOUT=10
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true # Update cursor
VI_MODE_SET_CURSOR=true  # Update cursor
MODE_INDICATOR=" "  # No mode indicator
VI_MODE_CURSOR_INSERT=5  # Blinking line

# Cleanup
export LESSHISTFILE="-"
export HISTFILE="/dev/null"
export LANG=en_US.UTF-8
export ZSH_COMPDUMP="$HOME/.cache/.zcompdump-Rodrigo's Macbook Air-${ZSH_VERSION}"


# Source it
source $ZSH/oh-my-zsh.sh

# Aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

