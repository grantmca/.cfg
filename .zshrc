#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history

# zsh options for more info use man zshoptions
setopt appendhistory

# completins 


# completions end

# Color
#
autoload -Uz colors && colors

# Import Helpful Functions
source "$HOME/.config/zsh/zsh-functions"

# Add Files For Organization
zsh_add_file "zsh-aliases"
