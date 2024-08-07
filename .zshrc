#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$HOME/.zsh_history
ulimit -n 1024 # increased from 256
# zsh options for more info use man zshoptions
setopt appendhistory
# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search completins 

# completions end

# Color
autoload -Uz colors && colors

# Import Helpful Functions
source "$ZDOTDIR/zsh-functions"

# Add Files For Organization
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-work-aliases"
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-work-exports"
zsh_add_file "zsh-history"
zsh_add_file "zsh-keys"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "felixr/docker-zsh-completion"

#Intro
zsh_add_file "zsh-intro"

_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

#Enviroment variables set everywhere
export EDITOR="nvim"
export TERMINAL="WezTerm"
export BROWSER="firefox"
export TERM="tmux-256color"
# FZF 
#[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
#[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
#[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
#[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
compinit

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
eval 
HI_AC_ZSH_SETUP_PATH=/Users/DMcAllister/Library/Caches/@eab-hip/cli/autocomplete/zsh_setup && test -f $HI_AC_ZSH_SETUP_PATH && source $HI_AC_ZSH_SETUP_PATH; # hi autocomplete setup