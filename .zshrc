# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="psychotropic"

zstyle ':omz:update' mode auto      # update automatically without asking
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

SAVEHIST=50000
HISTSIZE=20000

setopt SHARE_HISTORY
setopt APPEND_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

plugins=(git)

source $ZSH/oh-my-zsh.sh

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export GPG_TTY=$(tty)
export TERM=xterm-256color
export GTK_THEME=Breeze-Dark

export PATH=$PATH:~/.cargo/bin
bindkey '^[OA' up-line-or-history
bindkey '^[OB' down-line-or-history

export EDITOR='nvim'

alias vim="/usr/bin/nvim"
alias ll="ls -lha"
alias l="ls -lh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/karl/google-cloud-sdk/path.zsh.inc' ]; then . '/home/karl/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/karl/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/karl/google-cloud-sdk/completion.zsh.inc'; fi
