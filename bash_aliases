alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -P'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias shutdown='shutdown now'
alias ca='clear; cd'
alias sed='sed -r'
alias root='sudo su'
alias please='sudo'
alias bitch='sudo `history | tail -n1 | cut -c8-`'
alias c='xclip -rmlastnl -selection clipboard'
alias v='xclip -selection clipboard -o'
alias sl='sl -al'
alias ed="ed -p '* '"
alias emacs='emacs -nw'
alias cgrep='cat /usr/share/X11/locale/en_US.UTF-8/Compose ~/.XCompose | grep -i'
alias path='echo $PATH | sed "s/:/\n/g" | sort'
alias t='todo.sh'
alias e='zathura &>/dev/null'
alias _='sudo'
alias ffp='ffprobe -hide_banner'
alias f='feh -qdr.S filename --version-sort'

alias chatlisten='mawk -W interactive '\''$0="<Parranoh> "$0'\'' | cryptcat -lvp'
alias chatconnect='mawk -W interactive '\''$0="<Parranoh> "$0'\'' | cryptcat'

alias jfxc='javac --module-path $PATH_TO_FX --add-modules=javafx.controls'
alias jfx='java --module-path $PATH_TO_FX --add-modules=javafx.controls'

mkdir -p /tmp/recovery
rm () { mv --backup=numbered -- $* /tmp/recovery/ ; }
alias mv='mv -nv'

utoh () { env printf -- "$*" | iconv -f utf-8 -t ucs-4le | od -tx4 | cut -c9- ; }

mcd () { mkdir -p "$@" && cd "${@[-1]}" ; }
