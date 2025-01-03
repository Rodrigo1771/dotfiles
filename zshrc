# Path to oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Themes
ZSH_THEME="robbyrussell"
export BAT_THEME=gruvbox-dark
export EZA_CONFIG_DIR="$HOME/.config/eza/"  # eza dir only holds the theme

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
export ZSH_COMPDUMP="$HOME/.cache/.zcompdump-Rodrigo's Macbook Air-${ZSH_VERSION}"

# Source it
source $ZSH/oh-my-zsh.sh

# Fzf configs and aliases
[ -f "$HOME/.config/zsh/fzf.zsh" ] && source "$HOME/.config/zsh/fzf.zsh"
[ -f "$HOME/.config/zsh/alias.zsh" ] && source "$HOME/.config/zsh/alias.zsh"

