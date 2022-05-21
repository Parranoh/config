ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY:	all aliases ghci i3 i3status dunst p10k tmux uncrustify vim compose zsh alacritty dir_colors compton

all:	aliases i3 i3status dunst p10k tmux uncrustify vim compose zsh alacritty dir_colors compton mpv

~/.old:
	-mkdir ~/.old

aliases:	~/.old
	-mv ~/.bash_aliases -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/bash_aliases ~/.bash_aliases

ghci:	~/.old
	-mv ~/.ghci -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/ghci ~/.ghci

i3:	~/.old
	-mv ~/.config/i3/config -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/i3 ~/.config/i3/config

i3status:	~/.old
	-mv ~/.i3status.conf -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/i3status.conf ~/.i3status.conf

dunst:	~/.old
	-mv ~/.config/dunst/dunstrc ~/bin/dunst_espeak.sh -t ~/.old 2>/dev/null
	mkdir -p ~/.config/dunst ~/bin
	ln -s ${ROOT_DIR}/dunstrc ~/.config/dunst/dunstrc
	ln -s ${ROOT_DIR}/dunst_espeak.sh ~/bin/dunst_espeak.sh

p10k:	~/.old
	-mv ~/.p10k.zsh -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/p10k.zsh ~/.p10k.zsh

tmux:	~/.old
	-mv ~/.tmux.conf -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/tmux.conf ~/.tmux.conf

uncrustify:	~/.old
	-mv ~/.uncrustify -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/uncrustify ~/.uncrustify

vim:	~/.old
	-mv ~/.vimrc -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/vimrc ~/.vimrc

compose:	~/.old
	-mv ~/.XCompose -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/XCompose ~/.XCompose

zsh:	~/.old
	-mv ~/.zshrc -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/zshrc ~/.zshrc

alacritty:	~/.old
	-mv ~/.alacritty.yml -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/alacritty.yml ~/.alacritty.yml

dir_colors:	~/.old
	-mv ~/.dir_colors -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/dir_colors ~/.dir_colors

compton:	~/.old
	-mv ~/.compton.conf -t ~/.old 2>/dev/null
	ln -s ${ROOT_DIR}/compton.conf ~/.compton.conf

mpv:	~/.old
	-mv ~/.config/mpv/mpv.conf -t ~/.old 2>/dev/null
	mkdir -p ~/.config/mpv
	ln -s ${ROOT_DIR}/mpv.conf ~/.config/mpv/mpv.conf
