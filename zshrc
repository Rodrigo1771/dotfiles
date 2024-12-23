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

# Set up fzf
eval "$(fzf --zsh)"

# Use fd instead of find for fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing all path candidates with **.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd for listing only dir path candidates with **.
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Previews with CTRL+T and ALT+C
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Used below
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

# Previews with **
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Set theme for bat
export BAT_THEME=gruvbox-dark

# Set theme for eza
export EZA_CONFIG_DIR="$HOME/.config/eza/"

# Cleanup
export LESSHISTFILE="-"
export HISTFILE="/dev/null"
export LANG=en_US.UTF-8
export ZSH_COMPDUMP="$HOME/.cache/.zcompdump-Rodrigo's Macbook Air-${ZSH_VERSION}"


# Source it
source $ZSH/oh-my-zsh.sh

# Aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

