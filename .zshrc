# The following lines were added by compinstall

zstyle ':completion:*:default' menu select=1
zstyle :compinstall filename '/home/shimada/.zshrc'

autoload -Uz compinit
autoload -Uz vcs_info

compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt appendhistory nomatch notify
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

#setopt inc_append_history

setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_verify

alias ls='ls -F'
alias ll='ls -lF'
alias la='ls -alF'
alias grep='grep --color=auto'

PROMPT='%{[33m%}%~%{[m%}
[%n@%m] %# '
PROMPT2='%_%# '
#RPROMPT='%{[33m%}%~%{[m%}'

# MacVimで開く
alias gvim='open -a MacVim.app $*'

# CotEditorで開く
alias cot='open -a CotEditor.app $*'

# gitコマンドの補完
if [ -f ~/bin/git-completion.bash ]; then
  autoload bashcompinit
  bashcompinit
  source ~/bin/git-completion.bash
fi

# vcs_info
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd() {
  psvar=()
  vcs_info
  psvar[1]=$vcs_info_msg_0_
}
PROMPT=$'%2F%n@%m%f %3F%~%f%1v\n%# '

