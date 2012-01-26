# The following lines were added by compinstall

#zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' menu select=1
zstyle :compinstall filename '/home/shimada/.zshrc'

autoload -Uz compinit
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
[%n@%m] %% '
PROMPT2='%_%% '
#RPROMPT='%{[33m%}%~%{[m%}'

# Firefoxの複数プロファイルを管理
alias ffp='/Applications/Firefox.app/Contents/MacOS/firefox-bin -ProfileManager'

# MacVimで開く
alias gvim='open -a /Applications/MacVim.app $*'

# CotEditorで開く
alias cot='open -a /Applications/CotEditor.app $*'

# gitコマンドの補完
if [ -f ~/bin/git-completion.bash ]; then
  autoload bashcompinit
  bashcompinit
  source ~/bin/git-completion.bash
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
