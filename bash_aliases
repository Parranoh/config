alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -E'
alias shutdown='shutdown "now"'
alias ca='clear; cd'
alias sed='sed -r'
alias root='sudo su'
alias please='sudo'
alias bitch='sudo'
alias c='perl -p -e "chomp if eof" | xclip -selection clipboard'
alias v='xclip -selection clipboard -o'
alias sl='sl -al'
alias dirs='dirs -v'
alias ed="ed -p '* '"
alias emacs='emacs -nw'
alias cgrep='cat /usr/share/X11/locale/en_US.UTF-8/Compose ~/.XCompose | grep -i'
alias path='echo $PATH | sed "s/:/\n/g" | sort'

alias tmux-ls='tmux list-sessions'
alias tmux-r='tmux attach-session'

alias chatlisten='mawk -W interactive '\''$0="<Parranoh> "$0'\'' | cryptcat -lvp'
alias chatconnect='mawk -W interactive '\''$0="<Parranoh> "$0'\'' | cryptcat'

alias jfxc='javac --module-path $PATH_TO_FX --add-modules=javafx.controls'
alias jfx='java --module-path $PATH_TO_FX --add-modules=javafx.controls'

mkdir /tmp/recovery 2>/dev/null
rm () { mv $* /tmp/recovery/ }

utoh () { env printf -- "$*" | iconv -f utf-8 -t ucs-4le | od -tx4 | cut -c9- }
