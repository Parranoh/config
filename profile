# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# no display timeout
xset dpms 10 10 10
xset -dpms
xset s off

# faster repeat rate
xset r rate 200 30

# no mouse accel
xset m 0

# menu key as Multi_key
setxkbmap -option compose:menu

# Workman keyboard layout
setxkbmap us workman-p

# swap escape and caps lock
setxkbmap -option caps:swapescape

# turn on num lock
xdotool key Num_Lock

# set wallpaper
~/.fehbg

export TERMINAL=alacritty
export EDITOR=vi
eval $(lesspipe)
eval $(dircolors -b)
