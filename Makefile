ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY:	all aliases ghci i3 p10k tmux uncrustify vim compose zsh

all:	aliases ghci i3 p10k tmux uncrustify vim compose zsh

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
	-mv ~/.config/dunst/dunstrc -t ~/.old 2>/dev/null
	mkdir -p ~/.config/dunst
	ln -s ${ROOT_DIR}/dunstrc ~/.config/dunst/dunstrc

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
