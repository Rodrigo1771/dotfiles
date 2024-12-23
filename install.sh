#!/usr/bin/env bash

dotfiles=(
	gitconfig
	tmux.conf
	vscode
	zprofile
	zshrc
	# sshconfig
)

install_oh-my-zsh(){
    echo "[INSTALL.SH] Installing Oh My Zsh:"

	# Install it to ~/.config/ instead of to ~/
	export ZSH="$HOME/.config/oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo ""
}

install_packages(){
	echo "[INSTALL.SH] Installing packages (apps and utilities):"

	# Install homebrew and all of the packages
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file ~/.config/Brewfile

	# vimv is unfortunately not in homebrew
	mkdir -p ~/.local/bin/
	curl https://raw.githubusercontent.com/thameera/vimv/master/vimv > ~/.local/bin/vimv && chmod 755 ~/.local/bin/vimv
	
    echo ""
}

install_themes(){
    echo "[INSTALL.SH] Installing themes and fonts"
	#
	# install iTerm2 gruvbox theme
	mkdir -p ~/.config/iterm2/
	curl https://github.com/herrbischoff/iterm2-gruvbox/blob/master/gruvbox.itermcolors > ~/.config/iterm2/
    echo "[INSTALL.SH] Note: Import iTerm2 gruvbox theme in iTerm2 > Settings > Profiles > Colors > Color Presets"
    echo "[INSTALL.SH] Note: Import iTerm2  font in iTerm2 > Settings > Profiles > Text > Font"

	# install eza gruvbox theme
	mkdir -p ~/.config/eza/
	curl https://github.com/eza-community/eza-themes/blob/main/themes/gruvbox-dark.yml > ~/.config/eza/theme.yml

    echo ""
}

link_dotfiles() {
    echo "[INSTALL.SH] Linking dotfiles:"

	# Not tracking it in this repo, just making sure HOME is not cluttered
	mv ~/.vscode vscode

	for f in "${dotfiles[@]}"; do
		[[ -d ~/.$f && ! -L ~/.$f ]] && rm -r ~/."$f"
		printf '%25s -> %s\n' "~/${PWD/#$HOME\//}/${f}" "~/.${f}"
		ln -nsf "$PWD/$f" ~/."$f"
	done

    echo ""
}

unlink_dotfiles() {
    echo "[INSTALL.SH] Unlinking dotfiles:"

    for f in "${dotfiles[@]}"; do
        if [[ -L ~/.$f ]]; then
            echo "Removing symlink: ~/.${f}"
            rm ~/."$f"
        else
            echo "No symlink to remove for ${f}"
        fi
    done
}

if [ $# -eq 0 ]; then
    # No arguments were passed
	install_oh-my-zsh
	install_packages
	install_themes
	link_dotfiles
    echo "[INSTALL.SH] Note: Import iTerm2 gruvbox theme in iTerm2 > Settings > Profiles > Colors > Color Presets"
    echo "[INSTALL.SH] Note: Import iTerm2  font in iTerm2 > Settings > Profiles > Text > Font"
else
	while [[ "$#" -gt 0 ]]; do
		case "$1" in
			-o|--oh-my-zsh)
				install_oh-my-zsh
				shift
				;;
			-l|--link)
				link_dotfiles
				shift
				;;
			-u|--unlink)
				unlink_dotfiles
            	shift
            	;;
			-p|--packages)
				install_packages
				shift
				;;
			*)
				echo "Unknown flag: $1"
				echo "Usage: $0 [-o|--oh-my-zsh] [-l|--link] [-u|--unlink] [-p|--packages]"
				exit 1
				;;
		esac
	done
fi

