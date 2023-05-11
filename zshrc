# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# options
setopt interactivecomments
setopt extendedglob
setopt autocd

[[ -z "$HISTFILE" ]] && HISTFILE="$HOME/.zsh_history"
[[ "$HISTSIZE" -lt 50000 ]] && HISTSIZE=50000
[[ "$SAVEHIST" -lt 10000 ]] && SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# aliases
source ~/.bash_aliases

[[ -r ~/.dir_colors ]] &&
    eval $(dircolors -b ~/.dir_colors) ||
    eval $(dircolors -b)

# plugin options
COMPLETION_WAITING_DOTS=true
export ZSH_PLUGINS_ALIAS_TIPS_FORCE=1
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="_ g"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

zinit wait lucid for \
        blockf \
    zsh-users/zsh-completions \
    djui/alias-tips \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/sudo/sudo.plugin.zsh \
        blockf \
    OMZ::lib/completion.zsh \
    OMZ::lib/directories.zsh \
    OMZ::lib/spectrum.zsh \
    OMZ::lib/termsupport.zsh
zinit wait'1' lucid for \
        atinit"zicompinit; zicdreplay" \
        atclone'sed -i "/^comment/s/black/8/" themes/default.ini' atpull'%atclone' \
    zdharma-continuum/fast-syntax-highlighting
zinit ice atclone'sed -ri "/^bindkey -e$|(\\\\e|\\^\\[)[a-z]/d" key-bindings.zsh; zcompile key-bindings.zsh' atpull'%atclone'
zinit snippet OMZ::lib/key-bindings.zsh  # loading this with wait'' breaks p10k

zinit ice depth'1'
zinit load romkatv/powerlevel10k
[[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh
